package co.sunny.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginResultActionCommand implements ActionCommand {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id"); //form으로부터 전달된 id값을 받는다
		String password = request.getParameter("password");	
		String msg = null;
		
		if(id.equals("sunny") && password.equals("123")) {
			msg= "김해인님 환영합니다.";
		}else {
			msg = id + "님 아이디 또는 패스워드가 일치하지 않습니다.";
		}
		
		request.setAttribute("msg", msg); //(변수명, 값): 위에서 담은 msg를 보여줄 페이지의 변수명에 전달한다
		//위 문장은 처리한 data를 request에 실어보낸다. loginForm의 msg에 msg가 담길거다

		return "jsp/member/loginCheck.jsp";
	}

}
