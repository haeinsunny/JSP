package co.sunny.border.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.sunny.border.vo.BorderVo;
import co.sunny.common.DAO;

public class BorderDao extends DAO { // 상위 DAO를 상속받아서 만들기
	private PreparedStatement psmt;
	private ResultSet rs;

	private final String SELECT_ALL = "SELECT * FROM BORDER ORDER BY borderid DESC"; // 대문자로 바꿔주기 select all하는 프로그램
	private final String SELECT_ONE = "SELECT * FROM BORDER WHERE BORDERID=?";
	private final String INSERT = "INSERT INTO BORDER(BORDERID, BORDERWRITER, BORDERTITLE, BORDERCONTENT, BORDERDATE)"
			+ "VALUES(b_seq.nextval, ?, ?, ?, ?)";
	private final String HIT_UPDATE = "update border set borderhit = borderhit+1 where borderid =?";
	private final String UPDATE = "UPDATE BORDER SET BORDERDATE=?, BORDERCONTENT=? WHERE BORDERID=?";
	private final String DELETE = "DELETE FROM BORDER WHERE BORDERID=?";
	private final String SELECT_WRITER = "SELECT * FROM BORDER WHERE BORDERWRITER LIKE ?";
	private final String SELECT_TITLE = "SELECT * FROM BORDER WHERE BORDERTITLE LIKE ?";
	private final String SELECT_CONTENT = "SELECT * FROM BORDER WHERE BORDERCONTENT LIKE ?";

	public ArrayList<BorderVo> selectAll() { // 전체 데이터 가져오기
		ArrayList<BorderVo> list = new ArrayList<BorderVo>();
		BorderVo vo;
		try {
			psmt = conn.prepareStatement(SELECT_ALL); // 실어보내는것
			rs = psmt.executeQuery(); // 보낸명령을 실행시켜달라
			while (rs.next()) {
				vo = new BorderVo(); // 초기화하고
				vo.setBorderId(rs.getInt("borderid")); // 값들을 가져와서
				vo.setBorderWriter(rs.getString("borderwriter"));
				vo.setBorderTitle(rs.getString("bordertitle"));
				vo.setBorderContent(rs.getString("bordercontent"));
				vo.setBorderDate(rs.getDate("borderdate"));
				vo.setBorderHit(rs.getInt("borderhit"));

				list.add(vo); // 리스트에 담아라
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
			close();
		}
		return list;
	}

	public ArrayList<BorderVo> selectSearch(String search, String word) {
		ArrayList<BorderVo> slist = new ArrayList<BorderVo>();
		BorderVo vo;
		if (search.equals("writer")) { // string 일때는 .equals("?")
			try {
				psmt = conn.prepareStatement(SELECT_WRITER); // 실어보내는것
				psmt.setString(1, "%" + word + "%");
				rs = psmt.executeQuery(); // 보낸명령을 실행시켜달라
				while (rs.next()) {
					vo = new BorderVo(); // 초기화하고
					vo.setBorderId(rs.getInt("borderid")); // 값들을 가져와서
					vo.setBorderWriter(rs.getString("borderwriter"));
					vo.setBorderTitle(rs.getString("bordertitle"));
					vo.setBorderContent(rs.getString("bordercontent"));
					vo.setBorderDate(rs.getDate("borderdate"));
					vo.setBorderHit(rs.getInt("borderhit"));

					slist.add(vo); // 리스트에 담아라
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { // finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
				close();
			}
			return slist;

		} else if (search.equals("title")) {
			try {
				psmt = conn.prepareStatement(SELECT_TITLE); // 실어보내는것
				psmt.setString(1, "%" + word + "%");
				rs = psmt.executeQuery(); // 보낸명령을 실행시켜달라
				while (rs.next()) {
					vo = new BorderVo(); // 초기화하고
					vo.setBorderId(rs.getInt("borderid")); // 값들을 가져와서
					vo.setBorderWriter(rs.getString("borderwriter"));
					vo.setBorderTitle(rs.getString("bordertitle"));
					vo.setBorderContent(rs.getString("bordercontent"));
					vo.setBorderDate(rs.getDate("borderdate"));
					vo.setBorderHit(rs.getInt("borderhit"));

					slist.add(vo); // 리스트에 담아라
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { // finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
				close();
			}
			return slist;
		} else if (search.equals("CONTENT")) {
			try {
				psmt = conn.prepareStatement(SELECT_CONTENT); // 실어보내는것
				psmt.setString(1, "%" + word + "%");
				rs = psmt.executeQuery(); // 보낸명령을 실행시켜달라
				while (rs.next()) {
					vo = new BorderVo(); // 초기화하고
					vo.setBorderId(rs.getInt("borderid")); // 값들을 가져와서
					vo.setBorderWriter(rs.getString("borderwriter"));
					vo.setBorderTitle(rs.getString("bordertitle"));
					vo.setBorderContent(rs.getString("bordercontent"));
					vo.setBorderDate(rs.getDate("borderdate"));
					vo.setBorderHit(rs.getInt("borderhit"));

					slist.add(vo); // 리스트에 담아라
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { // finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
				close();
			}
			return slist;
		}
		return slist;
	}

	public BorderVo selectOne(BorderVo vo) { // 한건조회 및 조회수 증가. 위에서 다 가져온 BorderVo를 사용한다.
		// selectOne(BorderVo vo):를 전달 받아서 셀렉 중에서 딱 한 행만 가져오고싶다
		// 이렇게 기본으로 만들어놓고 코드 채우기
		try {
			psmt = conn.prepareStatement(SELECT_ONE); // 실어보내는것
			psmt.setInt(1, vo.getBorderId());
			rs = psmt.executeQuery(); // 보낸명령을 실행시켜달라
			if (rs.next()) { // 한레코드일때는 if(전체조회 일때는 while)
				psmt = conn.prepareStatement(HIT_UPDATE); // 조회수 증가
				psmt.setInt(1, vo.getBorderId());
				psmt.execute(); // 조회수를 1증가한다

				vo = new BorderVo(); // 초기화하고
				vo.setBorderId(rs.getInt("borderid")); // 값들을 가져와서
				vo.setBorderWriter(rs.getString("borderwriter"));
				vo.setBorderTitle(rs.getString("bordertitle"));
				vo.setBorderContent(rs.getString("bordercontent"));
				vo.setBorderDate(rs.getDate("borderdate"));
				vo.setBorderHit(rs.getInt("borderhit"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
			close();
		}

		return vo;
	}

	public int insert(BorderVo vo) { // INSERT: 게시글 입력
		int n = 0; // 입력건 선언 validation한다
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getBorderWriter());
			psmt.setString(2, vo.getBorderTitle());
			psmt.setString(3, vo.getBorderContent());
			psmt.setDate(4, vo.getBorderDate());
			n = psmt.executeUpdate(); // executeUpdate메소드는 건수를 돌려준다.
		} catch (SQLException e) { // SQLException하는 catch
			e.printStackTrace();
		} finally {
			close();
		}

		return n;
	}

	public BorderVo selectSearch(BorderVo vo) { // 한건조회. (조회수 변화없는)
		try {
			psmt = conn.prepareStatement(SELECT_ONE); // 실어보내는것
			psmt.setInt(1, vo.getBorderId());
			rs = psmt.executeQuery(); // 보낸명령을 실행시켜달라
			if (rs.next()) { // 한레코드일때는 if(전체조회 일때는 while)
				vo = new BorderVo(); // 초기화하고
				vo.setBorderId(rs.getInt("borderid")); // 값들을 가져와서
				vo.setBorderWriter(rs.getString("borderwriter"));
				vo.setBorderTitle(rs.getString("bordertitle"));
				vo.setBorderContent(rs.getString("bordercontent"));
				vo.setBorderDate(rs.getDate("borderdate"));
				vo.setBorderHit(rs.getInt("borderhit"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // finally되면 닫아주는 프로그램 실행 (밑의 메소드 만들어서)
			close();
		}

		return vo;
	}

	public int update(BorderVo vo) { // 게시글 update
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE); // psmt: conn해서 sql실어보내기
			psmt.setDate(1, vo.getBorderDate());
			psmt.setString(2, vo.getBorderContent());
			psmt.setInt(3, vo.getBorderId());
			n = psmt.executeUpdate(); // executeUpdate메소드는 건수를 돌려준다.
		} catch (SQLException e) { // SQLException하는 catch
			e.printStackTrace();
		} finally {
			close();
		}

		return n;
	}

	public int delete(BorderVo vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(DELETE); // psmt: conn해서 sql실어보내기
			psmt.setInt(1, vo.getBorderId());
			n = psmt.executeUpdate(); // executeUpdate메소드는 건수를 돌려준다.
		} catch (SQLException e) { // SQLException하는 catch
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	private void close() {
		try {
			if (rs != null)
				rs.close(); // 객채들을 닫아주는 역할
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
