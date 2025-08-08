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
import jakarta.servlet.http.HttpSession;
@WebServlet("/Update")
public class Update extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //Student s = new Student();
    HttpSession session = req.getSession(false);
    if(session.getAttribute("student") != null) {
    	StudentDAO sdao= new StudentDAOImpl();
    	
    	// Retrieve the existing student from session
    	Student s = (Student) req.getSession().getAttribute("student");
    	//PrintWriter out= resp.getWriter();
    	
    	s.setName(req.getParameter("name"));
		s.setPhone(Long.parseLong(req.getParameter("phone")));
		s.setMail(req.getParameter("mail"));
		s.setBranch(req.getParameter("branch"));
		s.setLoc(req.getParameter("loc"));
        
		//  Call the actual update method
		boolean res = sdao.updateStudent(s);
		if(res) {
			//req.setAttribute("UpdateSuccess", s);
		    req.setAttribute("success", "Update successful!");
		    RequestDispatcher rd = req.getRequestDispatcher("Dashboard.jsp");
		    rd.forward(req, resp);
		    
		} else {
		    req.setAttribute("error", "Update failed!");
		    RequestDispatcher rd = req.getRequestDispatcher("Update.jsp");
		    rd.forward(req, resp);
		}
     }else {

		req.setAttribute("error", "Session expired!");
		RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
		rd.forward(req, resp);
	 }
    }
}
