package core.view;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import conn.jdbc.dataSource;
import core.control.controlStudent;
import core.control.fetchStudentData;
import core.model.student;
import example.model.QuadraticEquation;

@Path("/iStudent")
public class iStudent extends dataSource{
	String result;
	private ArrayList<student> stu;
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String getSampleQEInJSON()
	{

		QuadraticEquation qe = new QuadraticEquation();
		qe.setA(6);
		qe.setB(4);
		qe.setC(2);

		return qe.toString() + "<a href='http://localhost:8080/dt2018105/'> return</a>";
	}
	
	@POST
	@Path("/insert")
	@Consumes(MediaType.APPLICATION_JSON)
	public String Student(student stu) throws SQLException, ParseException
	{
		new dataSource().Add(stu);
		return result;
	}
	
	@POST
	@Path("/search")
	@Consumes(MediaType.APPLICATION_JSON)
	public String Student(String rool_No) throws SQLException, ParseException
	{
		stu = new ArrayList<student>();
		stu=fetchStudentData.getAllStudent(new dataSource().SearchRecords(rool_No));
		String resultStudent="";
		new dataSource().closeConnection();
		resultStudent = "<table>";
		controlStudent cStudent;
		if (stu.size() > 0)
		{
			cStudent = new controlStudent(stu.get(0));
			resultStudent= resultStudent+"<tr><td>Roll Number </td><td> : " + stu.get(0).getRollNo() + "</td></tr><tr>" + 
        			"<td>Name </td><td> : " +stu.get(0).getName() + "</td></tr><tr>" +
        			"<td>Date of Birth </td><td> : " +stu.get(0).getdob() + "</td></tr><tr>" +
        			"<td>Mark in Physics </td><td> : " +stu.get(0).getMarkInPhysics() + "</td></tr><tr>" +
        			"<td>Mark in CHemistry </td><td> : " +stu.get(0).getMarkInChemistry() + "</td></tr><tr>" +
        			"<td>Mark in CHemistry </td><td> : " +stu.get(0).getMarkInMath() + "</td></tr><tr>" +
        			"<td bgcolor='yellow'><b>Student Age</b></td><td bgcolor='yellow'> : <b>" +cStudent.getStudentAge() + "</b></td></tr><tr>" +
        			"<td bgcolor='yellow'><b>Average Marks</b></td><td bgcolor='yellow'> <b>: " +cStudent.getStudentAverageMark() + "</b></td></tr><tr>" +
        			"<td bgcolor='yellow'><b>Total Marks</b></td><td bgcolor='yellow'> : <b>" +cStudent.getStudentTotalMark() + "</b></td></tr>" ;
		}
		
        resultStudent=resultStudent+"</table>";
		return resultStudent;
	}
	
	@GET
	@Path("/view")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getStudent() throws SQLException
	{
		
		ArrayList<student> stu=new ArrayList<student>();
		stu=fetchStudentData.getAllStudent(new dataSource().DisplayRecords(selectrecordSQL));
		new dataSource().closeConnection();
		String table = "";
        table = "<table border=\"1\"><tr><th>Roll Number</th><th>Name</th><th>Date of Birth</th><th>Mark in Physic</th>"+
        		"<th>Mark In Chemistry</th><th>Mark In Math</th></tr>";
        for (int i = 0; i < stu.size(); i++) {
        	table= table+"<tr><td>" + stu.get(i).getRollNo() + "</td>" + 
        			"<td>" +stu.get(i).getName() + "</td>" +
        			"<td>" +stu.get(i).getdob() + "</td>" +
        			"<td>" +stu.get(i).getMarkInPhysics() + "</td>" +
        			"<td>" +stu.get(i).getMarkInChemistry() + "</td>" +
        			"<td>" +stu.get(i).getMarkInMath() + "</td></tr>" ;
        }
        table=table+"</table>";
		return table;
	}

}
