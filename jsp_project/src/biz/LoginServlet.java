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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.checkPassword(id, pwd);
		
		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("loginOK", id);
			response.sendRedirect("/startPage.jsp");
		} else {
			out.println("<script> alert('아이디와 비밀번호가 일치하지 않습니다.'); history.back(); </script>");
		}
	}

}