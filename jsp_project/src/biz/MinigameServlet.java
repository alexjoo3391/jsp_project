package biz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/minigamePage")
public class MinigameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MinigameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		Random random = new Random();
		String[] result = {"가위", "바위", "보"};
	
		String comRs = result[random.nextInt(3)];
		String playerRs = request.getParameter("input");
				
		if (comRs.equals("가위")) {
			if (playerRs.equals("가위")) {
				out.println("<script> alert('"+ comRs + "'); window.location.href='/mainPage.jsp'; </script>");
			} else if (playerRs.equals("바위")) {
				System.out.println("이겼습니다.");
			} else if (playerRs.equals("보")) {
				System.out.println("졌습니다.");
			}
		} else if (comRs.equals("바위")) {
			if (playerRs.equals("가위")) {
				System.out.println("졌습니다.");
			} else if (playerRs.equals("바위")) {
				System.out.println("비겼습니다.");
			} else if (playerRs.equals("보")) {
				System.out.println("이겼습니다.");
			}
		} else if (comRs.equals("보")) {
			if (playerRs.equals("가위")) {
				System.out.println("이겼습니다.");
			} else if (playerRs.equals("바위")) {
				System.out.println("졌습니다.");
			} else if (playerRs.equals("보")) {
				System.out.println("비겼습니다.");
			}
		}
	}

}