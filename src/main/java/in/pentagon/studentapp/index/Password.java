package in.pentagon.studentapp.index;

import java.util.Scanner;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import in.pentagon.studentapp.dto.Student;

public class Password {
	
	public static void forgot(){
		Scanner sc = new Scanner(System.in);
		StudentDAO dao = new StudentDAOImpl();
		System.out.println("<----Forgot Password---->");
		System.out.println("Enter your phone number:");
		Long phone = sc.nextLong();
		System.out.println("Enter your mail id:");
		String mail = sc.next();
		
		Student s = dao.getStudent(phone, mail);
		if(s != null) {
			System.out.println("Enter the new password:");
			String pass = sc.next();
			System.out.println("Confirm your password:");
			String confirm = sc.next();
			
			if(pass.equals(confirm)) {
				s.setPassword(pass);
				boolean res = dao.updateStudent(s);
				if(res) {
					System.out.println("New password added successfully.");
				}
				else {
					System.out.println("Failed to add the new password..!");
				}
			}
			else {
				System.out.println("Passowrd mismatch..!");
			}
		}
		else {
			System.out.println("Incorrect Phone number or Mail id..!");
		}
		
		
	}
	
	public static void reset(Student s) {
		Scanner sc = new Scanner(System.in);
		StudentDAO dao = new StudentDAOImpl();
		System.out.println("<----Reset Password---->");
		System.out.println("Enter your phone number:");
		Long phone = sc.nextLong();
		System.out.println("Enter your email id:");
		String email = sc.next();
		
		if(phone == s.getPhone() && email.equals(s.getMail())) {
			System.out.println("Enter the new password:");
			String pass = sc.next();
			System.out.println("Confirm your password:");
			String confirm = sc.next();
			
			if(pass.equals(confirm)) {
				s.setPassword(pass);
				boolean res = dao.updateStudent(s);
				if(res) {
					System.out.println("Password resetted successfully.");
				}
				else {
					System.out.println("Failed to reset the password..!");
				}
			}
			else {
				System.out.println("Passowrd mismatch..!");
			}
			
		}
		else {
			System.out.println("Incorrect Phone number or Mail id...!");
		}

		
		
		

		
	}
}

