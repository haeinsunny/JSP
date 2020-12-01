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

import co.sunny.notice.NoticeVo;
import co.sunny.notice.dao.NoticeDao;

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
		HttpSession session = request.getSession();
		vo.setnWriter((String) (session.getAttribute("name"))); // name객체를 담아라

		// vo에서 넘어온 값 담기
		vo.setnTitle(request.getParameter("title"));
		vo.setnContent(request.getParameter("content")); // :request객체에있는 "content"

		// 서버에서 구동되는 실제경로
		String applicationPath = request.getServletContext().getRealPath("/");
		String uploadFilePath = applicationPath + UPLOAD_DIR; // "uploadFile"

		// 서버의 실경로가 어떻게되는지 체크
		System.out.println(" LOG :: [파일 저장 경로] :: " + uploadFilePath);

		// 파일경로가 없으면 생성(위험해서 잘 안씀)
//		if (!fileSaveDir.exists()) {
//			fileSaveDir.mkdirs();
//		}

		String fileName = null;
		// Get all the parts from request and write it to the file on server
		for (Part part : request.getParts()) { // javax
			fileName = getFileName(part);
			if (fileName != null) {
				System.out.println(" LOG :: [ 업로드 파일 경로 ] :: " + uploadFilePath + File.separator + fileName);
				part.write(uploadFilePath + File.separator + fileName); // java.io 서버저장
				vo.setnAttatch(fileName); // 파일이름 담아주기
			} else {
				break;
			}
		}

		int n = dao.insert(vo);

		// 이곳에 돌려줄 페이지 작성
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * Utility method to get file name from HTTP header content-disposition 파일네임
	 * 잘라오는것
	 */
	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println(" LOG :: content-disposition 헤더 :: = " + contentDisp);
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				System.out.println(" LOG :: 파일 이름 :: " + token);
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}
		return null;
	}

}
