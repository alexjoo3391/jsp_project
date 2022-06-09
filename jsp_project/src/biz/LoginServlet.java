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

@WebServlet("/loginPage")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		out.print(id);
		String pwd = request.getParameter("password");
		
		MemberDAO dao = new MemberDAO();
		boolean idResult = dao.checkId(id);
		boolean pwdResult = dao.checkPassword(id, pwd);
		
		if (idResult && pwdResult) {
			HttpSession session = request.getSession();
			session.setAttribute("loginOK", id);
			response.sendRedirect("/startPage.jsp");
			out.println("<script> alert('로그인 성공'); </script>");
		} else if (idResult && !pwdResult) {
			out.println("<script> alert('비밀번호가 올바르지 않습니다.'); history.back(); </script>");
		} else {
			out.println("<script> alert('ID와 비밀번호가 올바르지 않습니다.'); history.back(); </script>");
		}
	}

}