package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/signoutPage")
public class SignoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignoutServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("loginOK");
		
		MemberDAO dao = new MemberDAO();
		
		int result = dao.deleteUser(id);
		
		if (result > 0) {
			out.println("<script> alert('회원탈퇴가 완료되었습니다.'); window.location.href='/index.jsp'; </script>");
		} else {
			out.println("<script> alert('회원탈퇴에 실패하였습니다.'); history.back(); </script>");
		}
	}

}