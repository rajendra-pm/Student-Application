package in.pentagon.studentapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import in.pentagon.studentapp.dto.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/password")
public class Password extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StudentDAO sdao = new StudentDAOImpl();
		PrintWriter out = resp.getWriter();
		long phone = Long.parseLong(req.getParameter("phone"));
		String mail = req.getParameter("mail");
	
		Student s = sdao.getStudent(phone, mail);
		
		if(s != null) {
			String pass = req.getParameter("password");
			String confirm = req.getParameter("confirm");
			if(pass.equals(confirm)) {
				s.setPassword(pass);
				boolean res = sdao.updateStudent(s);
				if(res) {
//					out.println("<h1>New Password added successfully!</h1> ");
					req.setAttribute("success", "New Password added successfully!");
					RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
					rd.forward(req, resp);
				}
				else {
//					out.println("<h1>Failed to add the new password..!</h1> ");
					req.setAttribute("error", "Failed to add the new password..!");
					RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
					rd.forward(req, resp);
					
					
				}
			}
			else {
//				out.println("<h1>Password mismatch..!</h1>");
				req.setAttribute("error", "Password mismatch..!");
				RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
				rd.forward(req, resp);
			}
			
		}else {
//			out.println("<h1>Incorrect Phone number or Mail id..!</h1>");
			req.setAttribute("error", "Incorrect Phone number or Mail id..!");
			RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
			rd.forward(req, resp);
		}
		
	}
}

