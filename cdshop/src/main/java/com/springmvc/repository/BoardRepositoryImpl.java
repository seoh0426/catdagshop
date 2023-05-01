package com.springmvc.repository;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.commentDTO;
import com.springmvc.domain.fileDTO;
import com.springmvc.domain.pageDTO;
import com.springmvc.mapper.AllBoardMapper;
import com.springmvc.mapper.BoardMapper;
import com.springmvc.mapper.CommentMapper;
import com.springmvc.mapper.FileMapper;

@Repository
public class BoardRepositoryImpl implements BoardRepositoty {
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource ds) {
		this.template = new JdbcTemplate(ds);
	}
	
	//글쓰기 기능
	@Override
	public void writeboard(boardDTO board,HttpServletRequest req) {
		for (int i = 0; i < board.getFileimages().size(); i++) {
			MultipartFile mf = board.getFileimages().get(i);
			if(mf.getSize() == 0) {
				board.getFileimages().remove(i);
			}
		}
		
		//게시글의 반려동물 태그 설정
		if(board.getAnimal_type() != null && board.getAnimal_type().equals("cat")) {
			board.setTagsrc("catface.png");
			board.setTagvalue("고양이");
		}
		else if(board.getAnimal_type() != null && board.getAnimal_type().equals("dog")) {
			board.setTagsrc("dogface.png");
			board.setTagvalue("강아지");
		}
		
		//게시글 작성시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String regist_day = sdf.format(new Date());
		
		String sql;
		//게시판 태그 설정
		if(board.getBoard_type().equals("commu")) {
			board.setBoard_type("자랑해요");
			sql = "insert into commuboard(cb_board_type, cb_tagsrc, cb_tagvalue, m_name, cb_title, cb_content, cb_regist_day, cb_hit, cb_recom) values(?,?,?,?,?,?,?,?,?)";
		}
		else {
			board.setBoard_type("Q&A");
			sql = "insert into qnaboard(qb_board_type, qb_tagsrc, qb_tagvalue, m_name, qb_title, qb_content, qb_regist_day, qb_hit, qb_recom) values(?,?,?,?,?,?,?,?,?)";
		}
		KeyHolder keyHolder = new GeneratedKeyHolder();
		template.update(connection -> {
		    PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		    ps.setString(1, board.getBoard_type());
		    ps.setString(2, board.getTagsrc());
		    ps.setString(3, board.getTagvalue());
		    ps.setString(4, board.getName());
		    ps.setString(5, board.getTitle());
		    ps.setString(6, board.getContent());
		    ps.setString(7, regist_day);
		    ps.setInt(8, board.getHit());
		    ps.setInt(9, board.getRecom());
		    return ps;
		}, keyHolder);
		
		// 생성된 pk의 값을 num으로 가져오기
		board.setNum(keyHolder.getKey().intValue());
		//파일업로드하고 DB에 파일이름 저장
		List<MultipartFile> filelist = board.getFileimages();
		String path = req.getServletContext().getRealPath("/resources/img/board/");
		String filesql;
		
		if(board.getBoard_type().equals("자랑해요")) {
			filesql = "insert into boardfile(board_type, cb_num, filename) values(?,?,?)";
		}
		else {
			filesql = "insert into boardfile(board_type, qb_num, filename) values(?,?,?)";
		}
		System.out.println("filesql: "+filesql);
		for(MultipartFile mf : filelist) {
			//이미지 이름 가져오기			
			String saveName = mf.getOriginalFilename();
			//이미지 이름 board객체에 저장
			board.setFilename(saveName);
			//이미지 경로 변수에 담기
			
			//파일 업로드
			File saveFile = new File(path,saveName);		
			if (mf != null && !mf.isEmpty()) {
	            try {
	            	mf.transferTo(saveFile);  
	            } catch (Exception e) {
	                throw new RuntimeException("게시판 이미지 업로드가 실패하였습니다", e);
	            }
	        }
			template.update(filesql,board.getBoard_type(), board.getNum(), saveName);
		}
		
	}
	
	//자랑해요, Q&A 전체 게시글 가져오기
	@Override
	public List<boardDTO> getallboardlist(pageDTO page){
		int start = page.getCri().getpagestart();
		String sql = "select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard "
		           + "union all "
		           + "select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard "
		           + "order by regist_day desc limit "+start+","+page.getCri().getAmount();

		List<boardDTO> allboardlist = template.query(sql, new AllBoardMapper());
		for(boardDTO board : allboardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			if(board.getCbnum() != 0) {
				board.setNum(board.getCbnum());
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getCbnum());
				board.setFiles(files);
			}
			else {
				board.setNum(board.getQbnum());
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getQbnum());
				board.setFiles(files);
				
			}
		}
		return allboardlist;
	}

	//자랑해요 전체 게시글 가져오기
	@Override
	public List<boardDTO> getcommuboardlist(pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select * from commuboard order by cb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist =  template.query(sql, new BoardMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and cb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}		
		return boardlist;
	}
	
	//Q&A 전체 게시글 가져오기
	@Override
	public List<boardDTO> getqnaboardlist(pageDTO page){
		int start = page.getCri().getpagestart();
		String sql = "select * from qnaboard order by qb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist =  template.query(sql, new BoardMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and qb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}		
		return boardlist;
	}
	
	//추천해요 게시글 가져오기
	@Override
	public List<boardDTO> getrecomboardlist(pageDTO page){
		int start = page.getCri().getpagestart();
		String sql = "select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard "
				   + "where cb_recom >= 10 "				
		           + "union all "
		           + "select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard "
		           + "where qb_recom >= 10 "
		           + "order by regist_day desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist =  template.query(sql, new AllBoardMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			if(board.getCbnum() != 0) {
				board.setNum(board.getCbnum());
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getCbnum());
				board.setFiles(files);
			}
			else {
				board.setNum(board.getQbnum());
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getQbnum());
				board.setFiles(files);
				
			}
		}
		return boardlist;
	}
	
	//자랑해요 게시판 정렬 기능
	@Override 
	public List<boardDTO> getsortcommuboardlist(pageDTO page, String sort){
		int start = page.getCri().getpagestart();
		String sql;
		List<boardDTO> boardlist = new ArrayList<boardDTO>();
		if(sort.equals("viewed")) {
			sql = "select*from commuboard order by cb_hit desc limit "+start+","+page.getCri().getAmount();
			boardlist = template.query(sql, new BoardMapper());
			for(boardDTO board : boardlist) {
				board.setCalregist(caltime(board.getRegist_day()));
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
				board.setFiles(files);
			}
		}
		else if(sort.equals("popular")) {
			sql = "select*from commuboard order by cb_recom desc limit "+start+","+page.getCri().getAmount();
			boardlist = template.query(sql, new BoardMapper());
			for(boardDTO board : boardlist) {
				board.setCalregist(caltime(board.getRegist_day()));
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
				board.setFiles(files);
			}
		}
		else if(sort.equals("newest")) {
			sql = "select*from commuboard order by cb_num desc limit "+start+","+page.getCri().getAmount();;
			boardlist = template.query(sql, new BoardMapper());
			for(boardDTO board : boardlist) {
				board.setCalregist(caltime(board.getRegist_day()));
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
				board.setFiles(files);
			}
		}
		return boardlist;
	}
	
	//Q&A 게시판 정렬 기능
	@Override
	public List<boardDTO> getsortqnaboardlist(pageDTO page, String sort){
		int start = page.getCri().getpagestart();
		String sql;
		List<boardDTO> boardlist = new ArrayList<boardDTO>();
		if(sort.equals("viewed")) {
			sql = "select*from qnaboard order by qb_hit desc limit "+start+","+page.getCri().getAmount();
			boardlist = template.query(sql, new BoardMapper());
			for(boardDTO board : boardlist) {
				board.setCalregist(caltime(board.getRegist_day()));
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
				board.setFiles(files);
			}
		}
		else if(sort.equals("popular")) {
			sql = "select*from qnaboard order by qb_recom desc limit "+start+","+page.getCri().getAmount();
			boardlist = template.query(sql, new BoardMapper());
			for(boardDTO board : boardlist) {
				board.setCalregist(caltime(board.getRegist_day()));
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
				board.setFiles(files);
			}
		}
		else if(sort.equals("newest")) {
			sql = "select*from qnaboard order by qb_num desc limit "+start+","+page.getCri().getAmount();;
			boardlist = template.query(sql, new BoardMapper());
			for(boardDTO board : boardlist) {
				board.setCalregist(caltime(board.getRegist_day()));
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
				board.setFiles(files);
			}
		}
		return boardlist;
	}
	
	//게시글 접속시간-작성시간 비교하는 기능
	public String caltime(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String x="";
		try {
			Date date = sdf.parse(time);
			long curTime = System.currentTimeMillis();
			long regTime = date.getTime();
			long calTime = (curTime-regTime)/1000;
			if(calTime<60) {
				x="방금전";			
			}
			else if(calTime<3600) {
				x=(calTime/60)+"분전";
				return x;
			}
			else if(calTime<86400) {
				x=(calTime/3600)+"시간전";
				return x;
			}
			else if(calTime<(86400*30)) {
				x=(calTime/86400)+"일전";
				return x;
			}
			else {				
				x=sdf.format(date);
				return x;
			}		
		} catch (Exception e) {
			System.out.println("접속시간 에러: "+e);
		}
		return x;
		
	}
	
	//자랑해요 게시글 상세페이지 가져오기
	@Override
	public boardDTO getcommuboardview(int num, HttpServletRequest req) {
		String sql = "select * from commuboard where cb_num=?";
		boardDTO board = template.queryForObject(sql, new BoardMapper(), num);
		
		String filesql = "select * from boardfile where board_type=? and cb_num=?";
		List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
		
		board.setFiles(files);
		
		String[] filenames = new String[files.size()];
		for(int i = 0;i < files.size();i++) {			
			fileDTO file = files.get(i);
			filenames[i] = file.getFilename();
		}
		
		board.setFilenames(filenames);
		
		return board;
	}
	
	//Q&A 게시글 상세페이지 가져오기
	@Override
	public boardDTO getqnaboardview(int num, HttpServletRequest req) {
		String sql = "select * from qnaboard where qb_num=?";
		boardDTO board = template.queryForObject(sql, new BoardMapper(), num);
		
		String filesql = "select * from boardfile where board_type=? and qb_num=?";
		List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
		
		board.setFiles(files);
		
		String[] filenames = new String[files.size()];
		for(int i = 0;i < files.size();i++) {			
			fileDTO file = files.get(i);
			filenames[i] = file.getFilename();
		}
		
		board.setFilenames(filenames);
		
		return board;
	}
	
	//자랑해요 게시글 조회수 증가
	@Override
	public void commuviewhit(int num) {
		String sql = "update commuboard set cb_hit = cb_hit+1 where cb_num=?";
		template.update(sql, num);
	}
	
	//Q&A 게시글 조회수 증가
	@Override
	public void qnaviewhit(int num) {
		String sql = "update qnaboard set qb_hit = qb_hit+1 where qb_num=?";
		template.update(sql, num);
	}

	//자랑해요 게시글 삭제 기능
	@Override 
	public void deletecommuboard(int num) {
		String sql = "delete from commuboard where cb_num=?";
		template.update(sql, num);
	}
	
	//Q&A 게시글 삭제 기능
	@Override
	public void deleteqnaboard(int num) {
		String sql = "delete from qnaboard where qb_num=?";
		template.update(sql, num);
	}
	
	//게시글 수정하기 기능
	@Override 
	public void updateboard(boardDTO board, HttpServletRequest req) {
		for (int i = 0; i < board.getFileimages().size(); i++) {
			MultipartFile mf = board.getFileimages().get(i);
			if(mf.getSize() == 0) {
				board.getFileimages().remove(i);
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String regist_day = sdf.format(new Date());
		
		String sql;
		//DB에 게시글 수정
		if(board.getBoard_type().equals("commu")) {
			board.setBoard_type("자랑해요");
			sql = "update commuboard set cb_board_type=?, cb_tagsrc=?, cb_tagvalue=? , cb_title=?, cb_content=?, cb_regist_day=?, cb_hit=?, cb_recom=? where cb_num=?";
			template.update(sql, board.getBoard_type(), board.getTagsrc(), board.getTagvalue(), board.getTitle(), board.getContent(), regist_day, board.getHit(), board.getRecom(), board.getNum());
		}
		else {
			board.setBoard_type("Q&A");
			sql = "update qnaboard set qb_board_type=?, qb_tagsrc=?, qb_tagvalue=? , qb_title=?, qb_content=?, qb_regist_day=?, qb_hit=?, qb_recom=? where qb_num=?";
			template.update(sql, board.getBoard_type(), board.getTagsrc(), board.getTagvalue(), board.getTitle(), board.getContent(), regist_day, board.getHit(), board.getRecom(), board.getNum());
		}		
		
		
		//파일이 없으면 boardfile테이블에서 삭제
		if (board.getFileimages().size() == 0 && board.getFilenames() == null && board.getBoard_type().equals("자랑해요")) {		    
		    String deletesql = "delete from boardfile where board_type=? and cb_num=?";
		    template.update(deletesql, board.getBoard_type(), board.getNum());
		}
		else if(board.getFileimages().size() == 0 && board.getFilenames() == null && board.getBoard_type().equals("Q&A")) {
			String deletesql = "delete from boardfile where board_type=? and qb_num=?";
		    template.update(deletesql, board.getBoard_type(), board.getNum());
		}
		else {
			String path = req.getServletContext().getRealPath("/resources/img/board/");
			for(MultipartFile mf : board.getFileimages()) {
				String saveName = mf.getOriginalFilename();
				File saveFile = new File(path, saveName);
				if(mf != null && !mf.isEmpty()) {
					try {
						mf.transferTo(saveFile);
					}
					catch(Exception e) {
						throw new RuntimeException("게시판 이미지 수정 업로드에 실패했습니다",e);
					}
				}
			}
			String insertsql;
			if(board.getBoard_type().equals("자랑해요")) {
				String deletesql = "delete from boardfile where board_type=? and cb_num=?";
				template.update(deletesql, board.getBoard_type(), board.getNum());
				
				insertsql = "insert into boardfile(board_type, cb_num, filename) values(?,?,?)";
			}
			else {
				String deletesql = "delete from boardfile where board_type=? and qb_num=?";
				template.update(deletesql, board.getBoard_type(), board.getNum());
				
				insertsql = "insert into boardfile(board_type, qb_num, filename) values(?,?,?)";
			}
			
			for(String filename : board.getFilenames()) {
				template.update(insertsql, board.getBoard_type(), board.getNum(), filename);
			}
		}
	}
	
	//전체 게시글 제목이나 내용으로 검색하기
	@Override
	public List<boardDTO> getallsearch(String content, pageDTO page){
		int start = page.getCri().getpagestart();
		String sql = "select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard "
				   + "where cb_title like '%"+content+"%' or cb_content like '%"+content+"%' "				
		           + "union all "
		           + "select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard "
		           + "where qb_title like '%"+content+"%' or qb_content like '%"+content+"%' "
		           + "order by cb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> allboardlist = template.query(sql, new AllBoardMapper());
		for(boardDTO board : allboardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			if(board.getCbnum() != 0) {
				board.setNum(board.getCbnum());
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getCbnum());
				board.setFiles(files);
			}
			else {
				board.setNum(board.getQbnum());
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getQbnum());
				board.setFiles(files);
				
			}
		}
		return allboardlist;
	}
	
	//자랑해요 게시글 제목이나 내용으로 검색하기
	@Override
	public List<boardDTO> getcommusearch(String content, pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select*from commuboard where cb_title like '%"+content+"%' or cb_content like '%"+content+"%' order by cb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist = template.query(sql, new BoardMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and cb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}
		return boardlist;		
	}
	
	//Q&A 게시글 제목이나 내용으로 검색하기
	@Override
	public List<boardDTO> getqnasearch(String content, pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select*from qnaboard where qb_title like '%"+content+"%' or qb_content like '%"+content+"%' order by qb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist = template.query(sql, new BoardMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and qb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}
		return boardlist;		
	}
	
	//추천해요 제목이나 내용으로 검색하기
	@Override
	public List<boardDTO> getrecomsearch(String content, pageDTO page){
		int start = page.getCri().getpagestart();
		String sql = "select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard "
				   + "where cb_recom >= 10 and cb_title like '%"+content+"%' or cb_content like '%"+content+"%' "				
		           + "union all "
		           + "select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard "
		           + "where qb_recom >= 10 and qb_title like '%"+content+"%' or qb_content like '%"+content+"%' "
		           + "order by cb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> allboardlist = template.query(sql, new AllBoardMapper());
		for(boardDTO board : allboardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			if(board.getCbnum() != 0) {
				board.setNum(board.getCbnum());
				String filesql = "select * from boardfile where board_type=? and cb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getCbnum());
				board.setFiles(files);
			}
			else {
				board.setNum(board.getQbnum());
				String filesql = "select * from boardfile where board_type=? and qb_num=?";
				List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getQbnum());
				board.setFiles(files);
				
			}
		}
		return allboardlist;
	}
	
	//자랑해요 추천 기능
	@Override
	public void commurecom(int num, String recom) {
		if(recom.equals("true")) {
			int cnt = 1;
			String sql = "update commuboard set cb_recom=cb_recom+? where cb_num=?";
			template.update(sql,cnt,num);
		}
		else if(recom.equals("false")) {
			int cnt = 1;
			String sql = "update commuboard set cb_recom=cb_recom-? where cb_num=?";
			template.update(sql,cnt,num);
		}		
	}
	
	//Q&A 추천 기능
	@Override
	public void qnarecom(int num, String recom) {
		if(recom.equals("true")) {
			int cnt = 1;
			String sql = "update qnaboard set qb_recom=qb_recom+? where qb_num=?";
			template.update(sql,cnt,num);
		}
		else if(recom.equals("false")) {
			int cnt = 1;
			String sql = "update qnaboard set qb_recom=qb_recom-? where qb_num=?";
			template.update(sql,cnt,num);
		}		
	}
	
	//인기글 가져오기
	@Override
	public List<boardDTO> getrecomboard() {
		String sql = "select*from commuboard where cb_recom >= 10 limit 3";
		List<boardDTO> recomlist = template.query(sql, new BoardMapper());
		return recomlist;
	}
	
	//게시글 전체 개수 가져오기
	@Override
	public int getallcount() {
		String sql = "select count(*) from commuboard";
        int total_recond = template.queryForObject(sql, Integer.class);
        sql = "select count(*) from qnaboard";
        total_recond += template.queryForObject(sql, Integer.class);
        return total_recond;
	}
	
	//자랑해요 게시판 전체 게시글 개수 가져오기
	@Override
	public int getcommucount() {
		String sql = "select count(*) from commuboard";
		int total_recond = template.queryForObject(sql, Integer.class);
		return total_recond;
	}
	
	//Q&A 게시판 전체 게시글 개수 가져오기
	@Override
	public int getqnacount() {
		String sql = "select count(*) from qnaboard";
		int total_recond = template.queryForObject(sql, Integer.class);
		return total_recond;
	}
	
	//추천해요 게시글 개수 가져오기
	@Override
	public int getrecomcount() {
		String sql = "select count(*) from commuboard where cb_recom >= 10";
        int total_recond = template.queryForObject(sql, Integer.class);
        sql = "select count(*) from qnaboard where qb_recom >= 10";
        total_recond += template.queryForObject(sql, Integer.class);
        return total_recond;
	}
	
	//검색할 전체 게시글의 개수 가져오기
	@Override
	public int getallsearchcount(String content) {
		String sql = "select count(*) from commuboard where cb_title like '%"+content+"%' or cb_content like '%"+content+"%'";
        int total_recond = template.queryForObject(sql, Integer.class);
        sql = "select count(*) from qnaboard where qb_title like '%"+content+"%' or qb_content like '%"+content+"%'";
        total_recond += template.queryForObject(sql, Integer.class);
        return total_recond;
	}
	
	//자랑해요 게시판의 검색할 게시글의 전체 개수 가져오기
	@Override
	public int getcommusearchcount(String content) {
		String sql = "select count(*) from commuboard where cb_title like '%"+content+"%' or cb_content like '%"+content+"%'";
		int total_recond = template.queryForObject(sql, Integer.class);
		return total_recond;
    }
	
	//Q&A 게시판의 검색할 게시글의 전체 개수 가져오기
	@Override
	public int getqnasearchcount(String content) {
		String sql = "select count(*) from qnaboard where qb_title like '%"+content+"%' or qb_content like '%"+content+"%'";
		int total_recond = template.queryForObject(sql, Integer.class);
		return total_recond;
	}
	
	//댓글 등록
	@Override
	public void writecomment(commentDTO comment) {
		if(comment.getBoard_type().equals("자랑해요")) {
			String sql = "insert into cb_comments(m_name, cb_num, c_comment) values(?,?,?)";
			template.update(sql, comment.getName(), comment.getBnum(), comment.getComment());
		}
	}
	
	//게시글의 댓글목록 가져오기
	@Override
	public List<commentDTO> getcommentlist(commentDTO comment){
		String sql = "select*from cb_comments where cb_num=? order by c_order";
		return template.query(sql, new CommentMapper(), comment.getBnum());
	}
	
	//댓글 삭제
	@Override
	public void deletecomment(commentDTO comment) {
		String sql = "delete from cb_comments where c_num=? and cb_num=?";
		template.update(sql, comment.getNum(), comment.getBnum());
	}
}