package co.sunny.notice.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.common.MemberCommand;
import co.sunny.member.command.MemberList;
import co.sunny.notice.NoticeVo;
import co.sunny.notice.dao.NoticeDao;


@WebServlet("/NoticeList.do")
public class NoticeListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeListCon() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  //한글처리
		NoticeDao dao = new NoticeDao();
		
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();	//list를 가져오므로 vo를 선언해서 쓸필요 없음
		
		list = dao.selectAll();	
		request.setAttribute("list", list);
		String viewPage = "jsp/notice/noticeList.jsp";	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); //(받아온 값을 담은) 페이지를 디스패쳐에 싣는다. 보여줄 페이지 선택
		dispatcher.forward(request,	response); //응답한다
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
