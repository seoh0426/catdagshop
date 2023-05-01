package com.springmvc.repository;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
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
import com.springmvc.domain.fileDTO;
import com.springmvc.domain.pageDTO;
import com.springmvc.mapper.EventMapper;
import com.springmvc.mapper.FileMapper;
import com.springmvc.mapper.NoticeMapper;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource ds) {
		this.template = new JdbcTemplate(ds);
	}
	
	
	//글쓰기 기능
	@Override
	public void writeboard(boardDTO board, HttpServletRequest req) {
		for (int i = 0; i < board.getFileimages().size(); i++) {
			MultipartFile mf = board.getFileimages().get(i);
			if(mf.getSize() == 0) {
				board.getFileimages().remove(i);
			}
		}
		//게시글 작성시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String regist_day = sdf.format(new Date());
		
		String sql;
		KeyHolder keyHolder = new GeneratedKeyHolder();
		//게시판 태그 설정
		if(board.getBoard_type().equals("notice")) {
			board.setBoard_type("공지사항");
			sql = "insert into noticeboard(m_name, nb_board_type, nb_title, nb_content, nb_regist_day, nb_hit) values(?,?,?,?,?,?)";
			template.update(connection -> {
			    PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			    ps.setString(1, board.getName());
			    ps.setString(2, board.getBoard_type());
			    ps.setString(3, board.getTitle());
			    ps.setString(4, board.getContent());
			    ps.setString(5, regist_day);
			    ps.setInt(6, board.getHit());
			    return ps;
			}, keyHolder);
		}
		else {
			board.setBoard_type("이벤트");
			sql = "insert into eventboard(m_name, eb_board_type, eb_title, eb_content, eb_regist_day, eb_hit, eb_recom) values(?,?,?,?,?,?,?)";
			template.update(connection -> {
			    PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			    ps.setString(1, board.getName());
			    ps.setString(2, board.getBoard_type());
			    ps.setString(3, board.getTitle());
			    ps.setString(4, board.getContent());
			    ps.setString(5, regist_day);
			    ps.setInt(6, board.getHit());
			    ps.setInt(7, board.getRecom());
			    return ps;
			}, keyHolder);
		}
		
		// 생성된 pk의 값을 num으로 가져오기
		board.setNum(keyHolder.getKey().intValue());
		//파일업로드하고 DB에 파일이름 저장
		List<MultipartFile> filelist = board.getFileimages();
		
		String path;
		if(board.getBoard_type().equals("공지사항")) {
			path = req.getServletContext().getRealPath("/resources/img/notice/");
		}
		else {
			path = req.getServletContext().getRealPath("/resources/img/event/");
		}
		
		String filesql;
		
		if(board.getBoard_type().equals("공지사항")) {
			filesql = "insert into boardfile(board_type, nb_num, filename) values(?,?,?)";
		}
		else {
			filesql = "insert into boardfile(board_type, eb_num, filename) values(?,?,?)";
		}
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

	//공지사항 전체 게시글 가져오기
	@Override
	public List<boardDTO> getnoticeboardlist(pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select * from noticeboard order by nb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist =  template.query(sql, new NoticeMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and nb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}		
		return boardlist;
	}

	//이벤트 전체 게시글 가져오기
	@Override
	public List<boardDTO> geteventboardlist(pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select * from eventboard order by eb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist =  template.query(sql, new EventMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and eb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}		
		return boardlist;
	}

	//공지사항 게시글 가져오기
	@Override
	public boardDTO getnoticeboardview(int num, HttpServletRequest req) {
		String sql = "select * from noticeboard where nb_num=?";
		boardDTO board = template.queryForObject(sql, new NoticeMapper(), num);
		
		String filesql = "select * from boardfile where board_type=? and nb_num=?";
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

	//이벤트 게시글 가져오기
	@Override
	public boardDTO geteventboardview(int num , HttpServletRequest req) {
		String sql = "select * from eventboard where eb_num=?";
		boardDTO board = template.queryForObject(sql, new EventMapper(), num);
		
		String filesql = "select * from boardfile where board_type=? and eb_num=?";
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

	//공지사항 게시글 수정하기
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
		if(board.getBoard_type().equals("notice")) {
			board.setBoard_type("공지사항");
			sql = "update noticeboard set nb_board_type=?, nb_title=?, nb_content=?, nb_regist_day=?, nb_hit=? where nb_num=?";
			template.update(sql, board.getBoard_type(), board.getTitle(), board.getContent(), regist_day, board.getHit(), board.getNum());
		}
		else {
			board.setBoard_type("이벤트");
			sql = "update eventboard set eb_board_type=?, eb_tagsrc=?, eb_tagvalue=? , eb_title=?, eb_content=?, eb_regist_day=?, eb_hit=?, eb_recom=? where eb_num=?";
			template.update(sql, board.getBoard_type(), board.getTagsrc(), board.getTagvalue(), board.getTitle(), board.getContent(), regist_day, board.getHit(), board.getRecom(), board.getNum());
		}		
		
		
		//파일이 없으면 boardfile테이블에서 삭제
		if (board.getFileimages().size() == 0 && board.getFilenames() == null && board.getBoard_type().equals("공지사항")) {		    
		    String deletesql = "delete from boardfile where board_type=? and nb_num=?";
		    template.update(deletesql, board.getBoard_type(), board.getNum());
		}
		if(board.getFileimages().size() == 0 && board.getFilenames() == null && board.getBoard_type().equals("이벤트")) {
			String deletesql = "delete from boardfile where board_type=? and eb_num=?";
		    template.update(deletesql, board.getBoard_type(), board.getNum());
		}
		String path;
		if(board.getBoard_type().equals("공지사항")) {
			path = req.getServletContext().getRealPath("/resources/img/notice/");
		}
		else {
			path = req.getServletContext().getRealPath("/resources/img/event/");
		}
		
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
		if(board.getBoard_type().equals("공지사항")) {
			String deletesql = "delete from boardfile where board_type=? and nb_num=?";
			template.update(deletesql, board.getBoard_type(), board.getNum());
			
			insertsql = "insert into boardfile(board_type, nb_num, filename) values(?,?,?)";
		}
		else {
			String deletesql = "delete from boardfile where board_type=? and eb_num=?";
			template.update(deletesql, board.getBoard_type(), board.getNum());
			
			insertsql = "insert into boardfile(board_type, eb_num, filename) values(?,?,?)";
		}
		
		if(board.getFilenames().length != 0) {
			for(String filename : board.getFilenames()) {
				template.update(insertsql, board.getBoard_type(), board.getNum(), filename);
			}
		}
	}

	//공지사항 게시글 검색하기
	@Override
	public List<boardDTO> getnoticesearch(String content, pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select*from noticeboard where nb_title like '%"+content+"%' or nb_content like '%"+content+"%' order by nb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist = template.query(sql, new NoticeMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and nb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}
		return boardlist;
	}

	//이벤트 게시글 검색하기
	@Override
	public List<boardDTO> geteventsearch(String content, pageDTO page) {
		int start = page.getCri().getpagestart();
		String sql = "select*from eventboard where eb_title like '%"+content+"%' or eb_content like '%"+content+"%' order by eb_num desc limit "+start+","+page.getCri().getAmount();
		List<boardDTO> boardlist = template.query(sql, new EventMapper());
		
		for(boardDTO board : boardlist) {
			board.setCalregist(caltime(board.getRegist_day()));
			String filesql = "select * from boardfile where board_type=? and eb_num=?";
			List<fileDTO> files = template.query(filesql, new FileMapper(), board.getBoard_type(), board.getNum());
			board.setFiles(files);
		}
		return boardlist;
	}

	//이벤트 게시글 추천하기
	@Override
	public void eventrecom(int num, String recom) {
		if(recom.equals("true")) {
			int cnt = 1;
			String sql = "update eventboard set eb_recom=eb_recom+? where eb_num=?";
			template.update(sql,cnt,num);
		}
		else if(recom.equals("false")) {
			int cnt = 1;
			String sql = "update eventboard set eb_recom=eb_recom-? where eb_num=?";
			template.update(sql,cnt,num);
		}	
		
	}
	
	//공지사항 게시글 조회수 증가
	@Override
	public void noticeviewhit(int num) {
		String sql = "update noticeboard set nb_hit = nb_hit+1 where nb_num=?";
		template.update(sql, num);
	}
	
	//이벤트 게시글 조회수 증가
	@Override
	public void eventviewhit(int num) {
		String sql = "update eventboard set eb_hit = eb_hit+1 where eb_num=?";
		template.update(sql, num);
	}

	//공지사항 게시글 삭제 기능
	@Override 
	public void deletenoticeboard(int num) {
		String sql = "delete from noticeboard where nb_num=?";
		template.update(sql, num);
	}
	
	//이벤트 게시글 삭제 기능
	@Override
	public void deleteeventboard(int num) {
		String sql = "delete from eventboard where eb_num=?";
		template.update(sql, num);
	}

	//공지사항 전체 게시글 개수
	@Override
	public int getnoticecount() {
		String sql = "select count(*) from noticeboard";
        int total_recond = template.queryForObject(sql, Integer.class);
        return total_recond;
	}

	//이벤트 전체 게시글 개수
	@Override
	public int geteventcount() {
		String sql = "select count(*) from eventboard";
        int total_recond = template.queryForObject(sql, Integer.class);
        return total_recond;
	}

	//검색한 공지사항 게시글 개수
	@Override
	public int getnoticesearchcount(String content) {
		String sql = "select count(*) from noticeboard where nb_title like '%"+content+"%' or nb_content like '%"+content+"%'";
		int total_recond = template.queryForObject(sql, Integer.class);
		return total_recond;
	}

	//검색한 이벤트 게시글 개수
	@Override
	public int geteventsearchcount(String content) {
		String sql = "select count(*) from eventboard where eb_title like '%"+content+"%' or eb_content like '%"+content+"%'";
		int total_recond = template.queryForObject(sql, Integer.class);
		return total_recond;
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

}