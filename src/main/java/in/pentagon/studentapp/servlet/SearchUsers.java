package in.pentagon.studentapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import in.pentagon.studentapp.dto.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/searchUsers")
public class SearchUsers extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAO sdao = new StudentDAOImpl();
		ArrayList<Student> sList = sdao.getStudent(req.getParameter("search"));
		if(!sList.isEmpty()) {
			req.setAttribute("users", sList);
			RequestDispatcher rd = req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "No such user present..!");
			RequestDispatcher rd = req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
	}
}

