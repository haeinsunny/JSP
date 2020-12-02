package co.sunny.notice.web;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import co.sunny.notice.dao.NoticeDao;
import co.sunny.notice.vo.NoticeVo;

@WebServlet("/NoticeInsert.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 용량 10MB까지 읽어서 전송하겠다
		maxFileSize = 1024 * 1024 * 200, // 용량 20MB까지 올리겠다 (톰캣은 최대 200메가까지 가능)
		maxRequestSize = 1024 * 1024 * 200) // 용량 100MB까지 올리겠다

public class NoticeInsertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "uploadFile"; // 파일 업로드

	public NoticeInsertCon() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		NoticeDao dao = new NoticeDao();
		NoticeVo vo = new NoticeVo();

		// session 생성해서 name담아 보내기
		HttpSession session = request.getSession(false);
		
		// 서버에서 구동되는 실제경로
		String applicationPath = request.getServletContext().getRealPath("/");  //파일경로 찾음
		String uploadFilePath = applicationPath + UPLOAD_DIR; //"uploadFile"
		String fileName = null;

	
		 for (Part part : request.getParts()) {   //파일명 찾기 및 파일 업로드 javax
	        	String contentDisp = part.getHeader("content-disposition");   
				String[] tokens = contentDisp.split(";");
				for(String str : tokens) {
					if(str.trim().startsWith("fileName")) {
						fileName = str.substring(str.indexOf("=") + 2, str.length()-1);
						part.write(uploadFilePath + File.separator + fileName); // java.io 서버저장
					}
				}
	        }

	        vo.setnWriter((String) session.getAttribute("name"));
	        vo.setnTitle(request.getParameter("title"));
	        vo.setnContent(request.getParameter("content"));
	        vo.setnAttach(fileName);
	        int n = dao.insert(vo);
	        
	        if(n != 0) {
	        	response.sendRedirect("/Member/NoticeList.do");
	        } else {
	        	//등록 실패 페이지 로 보냄
	        }
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
