/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HANDLER;

import DTO.StudentDTO;
import java.util.Scanner;


public class StudentDTOHandler {
    
    private static final Scanner scanner = new Scanner(System.in);
    
    public void inputStudentID(StudentDTO dto) {
        System.out.println("Please input student id: ");
        while (true) {
            String id = scanner.nextLine();
            if (id.matches("^SE[0-9]{6}$")) {
                dto.setStudentId(id);
                break;
            } else {
                System.out.println("Invalid student Id format. Must be SE[0-9]{6}.");
            }
        }
    }
    
    public void inputStudentFullname(StudentDTO dto) {
        System.out.println("Please input student fullname: ");
        while (true) {
            String fullname = scanner.nextLine();
            if (fullname.matches("^[a-zA-Z\\s]{2,100}$")) {
                dto.setFullname(fullname);
                break;
            } else {
                System.out.println("Invalid student fullname format. Must be [a-zA-Z\\s]{2,100}");
            }
        }
    }
}
