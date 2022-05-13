/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UTIL;

import java.util.Scanner;

public class CommonUtility {
    
    public static String getInputString() {
        return new Scanner(System.in).nextLine();
    }

    public static int getInputID() {
        int id = -1;
        while (true) {
            try {
                id = new Scanner(System.in).nextInt();
            } catch (Exception e) {
                System.out.println("Only accept ID from 1 in integer number.");
            }
            if (id < 1) {
                System.err.println("Your ID input must be larger than 0.");
                System.out.println("Do you want to enter again? (Y/N): ");
                boolean choice = getYesNoInput();
                if (choice) {
                    continue;
                } else {
                    id = -1;
                    break;
                }
            } else {
                break;
            }
        }
        return id;
    }

    public static boolean getYesNoInput() {
        boolean flag = false;
        while (true) {
            String choice = new Scanner(System.in).nextLine();
            if (choice.equalsIgnoreCase("y")) {
                flag = true;
                break;
            } else if (choice.equalsIgnoreCase("n")) {
                break;
            } else {
                System.err.println("Only accept Y or N.");
            }
        }
        return flag;
    }
}
