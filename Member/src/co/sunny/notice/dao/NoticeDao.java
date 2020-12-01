package co.sunny.notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.sunny.notice.NoticeVo;

public class NoticeDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // @뒤 : 포트
	private String user = "SUNNY";
	private String password = "1234";

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	// 생성자 선언
	public NoticeDao() { 
		try {
			Class.forName(driver); // Class.forName로 드라이버 로드
			conn = DriverManager.getConnection(url, user, password); // conn객체는 DriverManager를 통해서 보낼때(괄호안을)가져온다.
			System.out.println("DB연결 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("DB연결 실패!!!");
		}

	}
	
	//객체닫는처리
	private void close() {
		try {
			if (rs != null)
				rs.close(); // rs객체가 not null이면(열려있다면) 닫아주는 역할
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	//sql작성
	private final String NOTICELIST = "SELECT * FROM NOTICE";
	private final String INSERT = "INSERT INTO NOTICE(NID, NWRITER, NTITLE, NCONTENT, NATTACH) "
								+ "VALUES(N_SEQ.NEXTVAL, ?, ?, ? ?)";
	
	public ArrayList<NoticeVo> selectAll(){
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();
		NoticeVo vo;
		try {
			psmt = conn.prepareStatement(NOTICELIST);	
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new NoticeVo();
				vo.setnId(rs.getInt("nid"));	
				vo.setnTitle(rs.getString("ntitle"));	
				vo.setnWriter(rs.getString("nwriter"));	
				vo.setnContent(rs.getString("ncontent"));	
				vo.setnDate(rs.getDate("ndate"));	
				vo.setnHit(rs.getInt("nhit"));	
				vo.setnAttatch(rs.getString("nattach"));
				
				list.add(vo);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close();
		}
		
		return list;	
	}
	
	public int insert(NoticeVo vo) {
		int n = 0;	
		try {
			psmt = conn.prepareStatement(INSERT);	
			
			psmt.setString(1, vo.getnWriter());
			psmt.setString(2, vo.getnTitle());
			psmt.setString(3, vo.getnContent());	
			psmt.setString(4, vo.getnAttatch());
			
			n =psmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close();
		}
		return n;
	}
	
	public int delete(NoticeVo vo) {
		int n = 0;	
		
		return n;
	}
}
