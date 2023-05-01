package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.memberDTO;
import com.springmvc.mapper.MemberMapper;

@Repository
public class MemberRepositoryImpl implements MemberRepository {

	private JdbcTemplate template;
	private List<memberDTO> listOfmember;
	
	@Autowired
	public void setJdbcTemplate(DataSource ds) {
		this.template = new JdbcTemplate(ds);
	}
	
	@Override 	//회원가입 기능
	public void join(memberDTO member) {
		String phone = member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
		String sql = "insert into member(m_email, m_name, m_pw, m_phone, m_post, m_addr1, m_addr2) "+" values(?,?,?,?,?,?,?)";
		template.update(sql, member.getEmail(), member.getName(), member.getPw(), phone, member.getPost(), member.getAddr1(), member.getAddr2());
	}	
	
	@Override	//전체 회원을 DB에서 다 가져옴
	public void getmemberlist() {		
		String sql = "select*from member where m_email=?";
		memberDTO member = template.queryForObject(sql, new MemberMapper());
		
	}
	
	@Override	//회원정보 일치하는지 확인하는 기능
	public memberDTO chkmember(String email, String pw) {
		memberDTO memberinfo = new memberDTO();
		String sql = "select*from member where m_email=?";
		listOfmember = template.query(sql, new MemberMapper(), email);
		for(memberDTO member : listOfmember) {
			if(member.getPw().equals(pw)) {
				memberinfo = member;					
			}
		}
		return memberinfo;
	}
	
	@Override	//세션에 저장된 닉네임과 일치하는 멤버객체반환하는 기능
	public memberDTO getmemberByname(String name) {
		memberDTO memberinfo = new memberDTO();		
		String sql = "select*from member where m_name=?";
		listOfmember = template.query(sql, new MemberMapper(), name);
		for(memberDTO member : listOfmember) {
			if(member.getName().equals(name)) {
				memberinfo = member;					
			}
		}
		return memberinfo; 
	}

	@Override	//회원정보 수정
	public void updatemember(memberDTO member) {
		String sql = "select*from member where m_name=?";
		listOfmember = template.query(sql, new MemberMapper(), member.getName());
		
		for(memberDTO mb : listOfmember) {
			if(mb.getEmail().equals(member.getEmail())) {
				if(mb.getLevel() != member.getLevel()) {
					String phone = member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
					sql = "update member set m_name=?, m_pw=?, m_phone=?, m_post=?, m_addr1=?, m_addr2=?, m_level=? where m_email=?";
					template.update(sql, member.getName(), member.getPw(), phone, member.getPost(), member.getAddr1(), member.getAddr2(), member.getLevel(), member.getEmail());
				}
			}
		}
		String phone = member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
		sql = "update member set m_name=?, m_pw=?, m_phone=?, m_post=?, m_addr1=?, m_addr2=? where m_email=?";
		template.update(sql, member.getName(), member.getPw(), phone, member.getPost(), member.getAddr1(), member.getAddr2(), member.getEmail());		
	}

	@Override	//전체 멤버 받아오는 기능
	public List<memberDTO> getallmemberlist() {
		String sql = "select*from member";
		List<memberDTO> memberlist = template.query(sql, new MemberMapper());
		return memberlist;
	}
	@Override	//num이 일치하는 멤버정보가져오는 기능
	public memberDTO getmemberBynum(int num) {
		memberDTO memberinfo = new memberDTO();
		String sql = "select*from member where m_num=?";
		listOfmember = template.query(sql, new MemberMapper(), num);
		for(memberDTO member : listOfmember) {
			if(member.getNum() == num) {
				memberinfo = member;					
			}
		}
		return memberinfo;
	}
	
	@Override	//이메일 중복확인 기능
	public int chkemail(String email) {
		int x=2;
		String sql ="select*from member where m_email=?";
		listOfmember = template.query(sql, new MemberMapper(), email);
		for(memberDTO member : listOfmember) {
			if(member.getEmail().equals(email)) {
				x=1;
				return x;
			}
		}
		return x;
	}

	@Override	//닉네임 중복확인 기능
	public int chkname(String name) {
		int x=2;
		String sql ="select*from member where m_name=?";
		listOfmember = template.query(sql, new MemberMapper(), name);
		for(memberDTO member : listOfmember) {
			if(member.getName().equals(name)) {
				x=1;
				return x;
			}
		}
		return x;
		
	}
	
	@Override	//회원 삭제
	public void deletemember(int num) {
		String sql ="delete from member where m_num=?";
		template.update(sql, num);
	}
	
	
}