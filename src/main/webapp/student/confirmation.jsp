<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="core.model.student"%>
<%@page import="core.control.controlStudent"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hario - DT2018105 - Walk to remember - MVC ...</h1>
        <%  
        controlStudent cStudent =(controlStudent)request.getAttribute("student");  
        
        out.print("Welcome, "+ cStudent.getStudentName() + "<br/> Your Roll No : " 
        + cStudent.getStudentRollNo()+ "<br/> Your Age : "
        + cStudent.getStudentAge() + "<br/> Your Average Mark : "
        + cStudent.getStudentAverageMark() + "<br/> Your Total Mark :" 
        + cStudent.getStudentTotalMark());  
        %>
    </body>
</html>
