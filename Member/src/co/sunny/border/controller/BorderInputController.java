package co.sunny.border.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.border.dao.BorderDao;
import co.sunny.border.vo.BorderVo;

@WebServlet("/BorderInput.do")
public class BorderInputController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BorderInputController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// command구현업시 여기 컨트롤러에서 처리
		request.setCharacterEncoding("utf-8");
		BorderDao dao = new BorderDao();
		BorderVo vo = new BorderVo();

		vo.setBorderWriter(request.getParameter("writer")); // request객체의 getParameter가 가지고있는 "writer": input.jsp page가 가지고있는 name의 변수명
		vo.setBorderDate(Date.valueOf(request.getParameter("date"))); // 넘어온 date타입을 date타입으로 바꿔준다(db에는 date타입이므로)
		vo.setBorderTitle(request.getParameter("title"));
		vo.setBorderContent(request.getParameter("content"));
		// id값은 시뭔스로 자동 넣을거임!

		int n = dao.insert(vo); // n에 dao의 insert(vo)를 실어서 보낸다. 입력건 나타냄

		String viewPage;
		if (n != 0) { // 항상 정상적으로 입력됐는지 모르므로 입력이 성공했으면 메세지 보여주려고
			response.sendRedirect("/Member/BorderList.do");  
			//어노테이션 기반에서 서블릿 호출시는 response객체를 이용해서 호출한다.
		} else {
			String msg = "정상적으로 입력하지 못했습니다.";
			request.setAttribute("msg", msg);  //위의 매세지를 req객체에 실어보낸다.
			viewPage = "jsp/border/inputError.jsp";	
			RequestDispatcher dp = request.getRequestDispatcher(viewPage);	//디스패쳐에 실어보내기
			dp.forward(request, response);
		}		
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 어차피 doget으로 감
		doGet(request, response);
	}

}
