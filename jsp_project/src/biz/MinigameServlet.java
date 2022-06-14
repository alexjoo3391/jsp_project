package biz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/minigamePage")
public class MinigameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MinigameServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		Random random = new Random();
		String[] result = {"1", "2", "3"};
	
		String comRs = result[random.nextInt(3)];
		String playerRs = request.getParameter("input");
				
		if (comRs.equals("1")) {
			System.out.println(comRs);
			if (playerRs.equals("1")) {
				session.setAttribute("resultOK", true);
				response.sendRedirect("/minigamePage.jsp");
			} else if (playerRs.equals("2") || playerRs.equals("3")) {
				session.setAttribute("resultOK", false);
				response.sendRedirect("/minigamePage.jsp");
			}
		} else if (comRs.equals("2")) {
			if (playerRs.equals("2")) {
				session.setAttribute("resultOK", true);
				response.sendRedirect("/minigamePage.jsp");
			} else if (playerRs.equals("1") || playerRs.equals("3")) {
				session.setAttribute("resultOK", false);
				response.sendRedirect("/minigamePage.jsp");
			}
		} else if (comRs.equals("3")) {
			if (playerRs.equals("3")) {
				session.setAttribute("resultOK", true);
				response.sendRedirect("/minigamePage.jsp");
			} else if (playerRs.equals("1") || playerRs.equals("2")) {
				session.setAttribute("resultOK", false);
				response.sendRedirect("/minigamePage.jsp");
			}
		} else if (!playerRs.equals("1") && !playerRs.equals("2") && !playerRs.equals("3")  ) {
			out.println("<script> alert('1, 2, 3 중 하나를 입력해 주세요.'); history.back(); </script>");
		}
		
	}
	
}