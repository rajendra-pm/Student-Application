package in.pentagon.studentapp.servlet;

import java.io.IOException;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delete")
public class Delete extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session != null) {
			StudentDAO sdao = new StudentDAOImpl();
			boolean res = sdao.deleteStudent(Integer.parseInt(req.getParameter("id")));
			if(res) {
				req.setAttribute("success", "Deleted user information successfully");
				RequestDispatcher rd = req.getRequestDispatcher("ViewAllUsers.jsp");
				rd.forward(req, resp);
			}

		}else {
			req.setAttribute("error", "Session expired!");
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}


		
	}
}

