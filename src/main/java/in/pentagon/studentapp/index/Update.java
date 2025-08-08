package in.pentagon.studentapp.index;

import java.util.Scanner;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;
import in.pentagon.studentapp.dto.Student;

public class Update {
	public static void update(Student s) {
		Scanner sc = new Scanner(System.in);
		System.out.println("<----Update Account---->");
		StudentDAO dao = new StudentDAOImpl();
		System.out.println("Enter the field to be updated:");
		int choice = 0;
		
		
		do {
			System.out.println("1. Name");
			System.out.println("2. Phone number");
			System.out.println("3. Mail ID");
			System.out.println("4. Branch");
			System.out.println("5. Location");
			System.out.println("6. Back to Dashboard");
			
			choice = sc.nextInt();
			switch(choice) {
			case 1: System.out.println("Enter the new name:");
					s.setName(sc.next());
			break;
			
			case 2: System.out.println("Enter the new phone number:");
					s.setPhone(sc.nextLong());
			break;	

			case 3: System.out.println("Enter the new mail id:");
					s.setMail(sc.next());
			break;
			
			case 4: System.out.println("Enter the updated branch:");
					s.setBranch(sc.next());
			break;
			
			case 5: System.out.println("Enter the new location:");
					s.setLoc(sc.next());
			break;
			
			case 6: System.out.println("Going back to dashboar d...");
			break;
			
			default: System.out.println("Invalid choice...,Please select a valid choice. ");
			}
			
			boolean res = dao.updateStudent(s);
			if(res) {
				System.out.println("Account updated successfully..");
			}
			else {
				System.out.println("Unable to update the account...!");
			}
			
		}while(choice != 6);
		
	}
}

