package in.pentagon.studentapp.index;

import java.util.Scanner;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import in.pentagon.studentapp.dto.Student;

public class Signup {
	public static void signup() {
		
		Scanner sc = new Scanner(System.in);
		Student s = new Student();
		StudentDAO dao = new StudentDAOImpl();
		
		System.out.println("<---Student Signup--->");
		System.out.println("Enter name:");
		s.setName(sc.next());
		System.out.println("Enter phone:");
		s.setPhone(sc.nextLong());
		System.out.println("Enter mail id:");
		s.setMail(sc.next());
		System.out.println("Enter branch:");
		s.setBranch(sc.next());
		System.out.println("Enter location:");
		s.setLoc(sc.next());
		
		System.out.println("Enter password:");
		String password = sc.next();
		System.out.println("Confirm password:");
		String confirmPwrd  = sc.next();
		
		if(confirmPwrd.equals(password)) {
			
			s.setPassword(password);
			boolean res = dao.insertStudent(s);
			if(res) {
				System.out.println("Signup successfull");
			}
			else {
				System.out.println("Signup unsuccessfull...!");
			}
		}
		else {
			System.out.println("Password mismatch..!");
		}
		
	}
}


