package co.sunny.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html"); // 컨텐트타입 만들기
		response.setCharacterEncoding("utf-8"); // 한글깨짐방지

		PrintWriter out = response.getWriter();

		String id = request.getParameter("id"); // "id": form의 id에 담겨져있는 값을 던짐
		String password = request.getParameter("password");
		String msg;

		if (id.equals("hong")) { // 아이디값과 같거나 다를때 표출할 메시지
			msg = "홍길동님 환영합니다.";
		} else {
			msg = "아이디값이 존재하지 않습니다.";
		}
		// 담은 msg를 이렇게 뿌리겠다
		out.print("<html>");
		out.print("<head>");
		out.print("<body>");
		out.print("<div align='center'>");
		out.print("<h1>" + msg + "</h1>");
		out.print("</div>");
		out.print("</body>");
		out.print("</head>");

		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
