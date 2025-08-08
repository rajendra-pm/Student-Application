package in.pentagon.studentapp.index;

import java.util.ArrayList;
import java.util.Scanner;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import in.pentagon.studentapp.dto.Student;

public class Login {
	public static void login() {
		Scanner sc = new Scanner(System.in);
		StudentDAO dao = new StudentDAOImpl();
		int choice = 0;
		System.out.println("<---Login Page--->");
		System.out.println("Enter the mail id:");
		String mail = sc.next();
		System.out.println("Enter the password:");
		String password = sc.next();
		
		Student s = dao.getStudent(mail, password);
		if(s != null) {
			System.out.println("Login Successfull... Welcome "+s.getName());
			
			do {
				System.out.println("1. View data.");
				System.out.println("2. Search users.");
				System.out.println("3. Update account.");
				System.out.println("4. Reset password.");
				System.out.println("5. Back to main menu.");
				
				if(s.getId() == 1) {
					System.out.println("6. View all users.");
					System.out.println("7. Delete the user.");
				}
				
				choice = sc.nextInt();
				switch(choice) {
				case 1: System.out.println(s);
				break;
				case 2://search user logic 
						System.out.println("Enter the student name to search:");
						String name = sc.next();
						ArrayList<Student> students = dao.getStudent(name);
						if(!students.isEmpty()) {
							for(Student sl : students) {
								System.out.println("--------------------------");
								System.out.println("Student id: "+sl.getId());
								System.out.println("Student name: "+sl.getName());
								System.out.println("Student branch: "+sl.getBranch());
								System.out.println("Student location: "+sl.getLoc());
								System.out.println("--------------------------");
							}
						}else {
							System.out.println("No such user present...!");
						}

				break;
				case 3: Update.update(s);
				break;
				case 4: Password.reset(s);
				break; 
				case 5:System.out.println("Going back to main menu.....");
				break;
				case 6: //View all users
						System.out.println("Our users...");
						ArrayList<Student> studentList = dao.getStudent();
						for(Student sl : studentList ) {
							System.out.println(sl);
						}
				break;
				case 7: //Delete the user
						System.out.println("Enter the Student Id to delete:");
						boolean deleteCheck = dao.deleteStudent(sc.nextInt());
						if(deleteCheck) {
							System.out.println("Deleted the data successfully.");
						}
						else {
							System.out.println("Unable to delete...!,No such Id present...!");
						}
				break;
				default: System.out.println("Invalid choice!");
				}
			}while(choice != 5);
		}
		else {
			System.out.println("Invalid login credentials..!");
		}
		
	}
}

