package in.pentagon.studentapp.index;

import java.util.Scanner;

public class index {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		@SuppressWarnings("resource")
		Scanner sc = new Scanner(System.in);
		int choice = 0;
		System.out.println("Welcome to Student Application..!");
		
		do {
			System.out.println("1. SIGNUP");
			System.out.println("2. LOGIN");
			System.out.println("3. FORGOT PASSWORD");
			System.out.println("4. EXIT");
			
			choice = sc.nextInt();
			
			switch(choice) {
			case 1: Signup.signup();
			break;
			case 2: Login.login();
			break;
			case 3: Password.forgot();
			break;
			case 4: System.out.println("Exiting the Application.. Thank you.");
			break;
			default: System.out.println("Invalid choice! Please enter a valid choice");
			}
		}while(choice != 4);
		
	}

}
