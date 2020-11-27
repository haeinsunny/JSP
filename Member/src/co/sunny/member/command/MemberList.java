package co.sunny.member.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sunny.common.MemberCommand;
import co.sunny.member.dao.MemberDao;
import co.sunny.member.vo.MemberVo;

public class MemberList implements MemberCommand {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		MemberDao dao = new MemberDao();
		ArrayList<MemberVo> list = dao.selectAll(); // list타입으로 돌려주니까 똑같은 타입으로 받기위해
		request.setAttribute("list", list); // 결과를 blist에 담는다

		return "jsp/manage/memberList.jsp"; // 보여줄 페이지 정의 > 다시 controller로 간다 (디스패쳐에 실으러)
	}

}
