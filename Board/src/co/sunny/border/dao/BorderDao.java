package co.sunny.border.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.sunny.border.vo.BorderVo;
import co.sunny.common.DAO;

public class BorderDao extends DAO {  //상위 DAO를 상속받아서 만들기
	private PreparedStatement psmt;
	private ResultSet rs;

	private final String SELECT_ALL = "SELECT * FROM BORDER ORDER BY borderid ASC"; // 대문자로 바꿔주기 select all하는 프로그램

	public ArrayList<BorderVo> selectAll(){  //전체 데이터 가져오기
		ArrayList<BorderVo> list = new ArrayList<BorderVo>();
		BorderVo vo;
		try {
			psmt = conn.prepareStatement(SELECT_ALL); //실어보내는것
			rs = psmt.executeQuery(); //보낸명령을 실행시켜달라
			while(rs.next()) {
				vo = new BorderVo(); //초기화하고
				vo.setBorderId(rs.getInt("borderid"));  //값들을 가져와서
				vo.setBorderWriter(rs.getString("borderwriter"));
				vo.setBorderTitle(rs.getString("bordertitle"));	
				vo.setBorderContent(rs.getString("bordercontent"));
				vo.setBorderDate(rs.getDate("borderdate"));
				vo.setBorderHit(rs.getInt("borderhit"));
				
				list.add(vo);  //리스트에 담아라
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {  //finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
		close();
	}
		return list;
	}
	
	public BorderVo selectOne(BorderVo vo){  //위에서 다 가져온 BorderVo를 사용한다.
		//selectOne(BorderVo vo):를 전달 받아서 셀렉 중에서 딱 한 행만 가져오고싶다
		//이렇게 기본으로 만들어놓고 코드 채우기
		
		return vo;
	}
	
	public int insert(BorderVo vo) {  //INSERT: 게시글 입력
		int n = 0;	
		
		return n;
	}
	
	public int delete(BorderVo vo) {
		int n =0;	
		return n;
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();  //객채들을 닫아주는 역할
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
