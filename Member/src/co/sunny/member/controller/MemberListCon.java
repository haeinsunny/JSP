package co.sunny.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.border.command.BorderList;
import co.sunny.common.BorderCommand;
import co.sunny.common.MemberCommand;
import co.sunny.member.command.MemberList;


@WebServlet("/MemberList.do")
public class MemberListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberListCon() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  //한글처리
		MemberCommand cmd = new MemberList(); //실행명령 선언: BorderCommand인터를 BorderList클래스로 초기화 한다(나머지 세줄은 같고 얘만 클래스명에 따라 다름)
		String viewPage = cmd.action(request, response); //실행명령 호출 (보여줄 페이지를 command에서 담아온다)
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); //(받아온 값을 담은) 페이지를 디스패쳐에 싣는다. 보여줄 페이지 선택
		dispatcher.forward(request,	response); //응답한다
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
