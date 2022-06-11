package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/joinPage")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		String pwdck = request.getParameter("passwordCheck");
		
		MemberDAO dao = new MemberDAO();
		
		if (!pwd.equals(pwdck)) {
			out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
		} else {
			int result = dao.insertUser(id, pwd);
			if (result > 0) {
				out.println("<script> alert('회원가입에 성공하였습니다.'); window.location.href='/index.jsp'; </script>");
			} else {
				out.println("<script> alert('이미 존재하는 ID입니다. 다른 ID를 입력해 주세요.'); history.back(); </script>");
			}
		}
	}

}