package co.sunny.border.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.common.BorderCommand;
import co.sunny.border.command.BorderList;


@WebServlet("/Border.do")
public class BorderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BorderController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 여기가 게시판관련 처리
		request.setCharacterEncoding("utf-8");  //한글처리
		BorderCommand cmd = new BorderList(); //실행명령 선언: BorderCommand인터를 BorderList클래스로 초기화 한다
		String viewPage = cmd.action(request, response); //실행명령 호출 (보여줄 페이지를 command에서 담아온다)
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); //(받아온 값을 담은) 페이지를 디스패쳐에 싣는다. 보여줄 페이지 선택
		dispatcher.forward(request,	response); //응답한다
		
	}

}