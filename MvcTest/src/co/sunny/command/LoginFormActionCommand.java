package co.sunny.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormActionCommand implements ActionCommand {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return "jsp/member/loginForm.jsp";  //loginForm.jsp 호출해라
	}

}
