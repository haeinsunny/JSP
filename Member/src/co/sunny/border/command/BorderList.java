package co.sunny.border.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.border.dao.BorderDao;
import co.sunny.border.vo.BorderVo;
import co.sunny.common.BorderCommand;

public class BorderList implements BorderCommand {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
	BorderDao dao = new BorderDao();
	ArrayList<BorderVo> blist = dao.selectAll();  //list타입으로 돌려주니까 똑같은 타입으로 받기위해
	request.setAttribute("list", blist);  //결과를 blist에 담는다
	
		return "jsp/border/borderList.jsp";  //보여줄 페이지 정의 > 다시 controller로 간다 (디스패쳐에 실으러)
	}

}
