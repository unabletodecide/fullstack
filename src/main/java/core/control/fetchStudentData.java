package core.control;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import core.model.student;

public class fetchStudentData{
	public static ArrayList<student> getAllStudent(ResultSet rs) throws SQLException{
		ArrayList<student> stu = new ArrayList<student>();
		    while(rs.next()) {  
		        student Student=new student();
		        Student.setRollNo(rs.getInt(1));
		        Student.setName(rs.getString(2));
		        Student.setDob(rs.getString(3));
		        Student.setMarkInPhysics(rs.getInt(4));
		        Student.setMarkInCHemistry(rs.getInt(5));
		        Student.setMarkInMath(rs.getInt(6));
		        stu.add(Student);
		    }
		return stu;
	}
}
