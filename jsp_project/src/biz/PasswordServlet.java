package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/passwordPage")
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PasswordServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");

		MemberDAO dao = new MemberDAO();
		String pwd = dao.searchPwd(id);

		if (pwd == null) {
			out.println("<script> alert('해당 ID를 찾을 수 없습니다. 다시 입력해 주세요.'); history.back(); </script>");	
		}
		
		out.println("<script> alert('" + id + "님의 비밀번호는 " + pwd + "입니다.'); history.back();  </script>");	
	}

}