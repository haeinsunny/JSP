package co.sunny.notice.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.notice.dao.NoticeDao;
import co.sunny.notice.vo.NoticeVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@WebServlet("/AjaxNoticeList.do")
public class AjaxNoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxNoticeList() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Json형태의 데이터를 리턴한다
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");  //"text/html; charset=utf-8" 이런형태의 페이지를 내가 만들겠다.
		PrintWriter out = response.getWriter();  //html 코드를 담기위해 선언
		
		NoticeDao dao = new NoticeDao();		
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();
		list = dao.selectAll();	
		
		JSONObject jsonObject = new JSONObject(); //전체 데이터의 저장을 위해
		JSONObject data;  //하나의 레코드를 위해
		JSONArray jlist = new JSONArray(); //레코드 배열을 위해
		
		for(NoticeVo vo : list) { //json 객체 생성
			data = new JSONObject();	
			data.put("nId", vo.getnId());	
			data.put("nTitle", vo.getnTitle());	
			data.put("nDate", vo.getnDate().toString());	
			data.put("nWriter", vo.getnWriter());	
			data.put("nHit", vo.getnHit());
			data.put("nAttach", vo.getnAttach());
			
			jlist.add(data);
		}
		
		jsonObject.put("data", jlist); //ajax에서 가져온 jlist이름을 data라고 하겠다
		out.print(jsonObject);
		out.flush();
		out.close();
		System.out.println("jlist");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
