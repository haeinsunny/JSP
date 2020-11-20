package co.sunny.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.command.ActionCommand;
import co.sunny.command.LoginFormActionCommand;
import co.sunny.command.LoginResultActionCommand;
import co.sunny.command.MainActionCommand;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet(description = "모든요청을 처리하는 컨트롤러", urlPatterns = { "/FrontController" })
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashMap<String, ActionCommand> map = new HashMap<String, ActionCommand>(); //map구조에 ActionCommand 받을거임
   
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		//init의 역할: 모든요청관련 클래스(메소드)들을 스택 메모리에 쌓아놓는 역할, 실제 동작시키는건 service에서한다
		
		map.put("/main.do", new MainActionCommand()); //'main.do라고 들어오면 new MainActionCommand를 실행하겠다'라는 k, v를 집어넣음
		map.put("/loginForm.do", new LoginFormActionCommand());  
		map.put("/loginCheck.do", new LoginResultActionCommand());
//		map.put("/main.do", new MainActionCommand());
//		map.put("/main.do", new MainActionCommand());
//		map.put("/main.do", new MainActionCommand());
//		map.put("/main.do", new MainActionCommand());
//		map.put("/main.do", new MainActionCommand());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요기는 실제 서비스할 내용을 쓰면된다. (실행할거는 service에)
		request.setCharacterEncoding("utf-8"); //한글 깨짐 방지
		String uri = request.getRequestURI(); //요청분석을 위해 uri 값을 구한다
		String contextPath = request.getContextPath(); //context Path 값 구한다
		String path = uri.substring(contextPath.length()); //실제요청 경로를 구한다(uri에서 context path의 길이만큼을 뺴면 실요청 주소이다)
		
		ActionCommand cmd = map.get(path); //수행할 Model을 구한다. 키값으로 끄집어낸다. main.do라고 들어오면 new MainActionCommand를 실행
		String viewPage = cmd.action(request, response); //Model 수행후 결과와 jsp페이지를 돌려받는다
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); //forward 객체생성
		dispatcher.forward(request, response);
	}

}
