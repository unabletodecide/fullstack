<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <title>Student Information System -Hario Bismo Kuntarto - Walk to remember ...</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <link rel="stylesheet" href="/dt2018105/bootstrap/css/bootstrap.css">
        
		<script src="/dt2018105/jquery/jquery-3.3.1.min.js"></script>
		
		<script src="/dt2018105/bootstrap/js/bootstrap.js"></script>
		
		<script type="text/javascript">
		
		//Check function
		$(document).ready(function() 
		{	
			//insert function
			$('#insertbtn').click(function()
			{
			    if (document.getElementById("name").value == ""){
			    	alert("Please enter Name");	
			    } else if (document.getElementById("dob").value == ""){
			    	alert("Please enter Date of Birth");
			    } else if (document.getElementById("mark_1").value == ""){
			    	alert("Please enter Mark in Physic");
			    } else if (document.getElementById("mark_2").value == ""){
			    	alert("Please enter Mark in Chemistry");
			    } else if (document.getElementById("mark_3").value == ""){
			    	alert("Please enter Mark in Math");
			    }else {
					execInsertData();
			    }
			});
			
			//search function
			$('#searchStudent').click(function()
			{
			    if (document.getElementById("rollNoSrc").value == "")
			    	alert("Please enter roll Number");	
			    else 
			    	execSearchData();
			    
			});
			
			//upload Button
			$('#uploadImgBtn').click(function()
		     {
		                    var file = document.getElementById("uplImg");
		                    
		                    if(file)
		                    {
		                       var formData = new FormData();
		                        formData.append('file', file);
		                        $.ajax({
		                          url : '/dt2018105/upl/upload/image',
		                          type : 'POST',
		                          data : formData,
		                          cache : false,
		                          contentType : false,
		                          processData : false,
		                          success : function(data, textStatus, jqXHR) {
		                                var message = jqXHR.responseText + " " + textStatus;
		                                $("#messages").append("<li>" + message + "</li>");
		                          },
		                          error : function(jqXHR, textStatus, errorThrown) {
		                                $("#messages").append("<li style='color: red;'>" + textStatus + " apa "+ errorThrown.responseText + "</li>");
		                          }
		                        });
		                    }
		         });
			
			
			
			
		});
		
		//viewfunction
		function view() 
		{
			var jersey_url = "/dt2018105/stud/iStudent/view";
            $.ajax({
                type: 'GET', // GET
        		contentType: 'application/json',
                url: jersey_url,
                error: function(xhr, status, error) {
                    console.log(arguments);
                    alert(" Can't do because: " + xhr);
                },
                success: parseDatatoHTML
            });
		}
		
		//parser Data View
		function parseDatatoHTML(data) {
			$("#resultView").html(data);
        };
		
     	//insert data student
		function insertFormToJSON() 
		{
	        var name = $("#name").val();
	        var dob = $("#dob").val();
	        var mark_1 = $("#mark_1").val();
	        var mark_2 = $("#mark_2").val();
	        var mark_3 = $("#mark_3").val();
			var student = JSON.stringify({
				"name":name,
	        	"dob":dob,
	        	"rollNo":"0",
	        	"mark_1":mark_1,
	        	"mark_2":mark_2,
	        	"mark_3":mark_3
	        	});
			return student;
		}
		
     	//Remnder data Student
		function renderDetailsInsert(data)
		{	
	        $("#resultInsert").html(" Result Query : New Record Inserted Successfully!!! ");
				
		}
		
		//Remnder Search Student
		function renderDetailsSearch(data)
		{	
			$("#resultSearch").html(data);
		}
		
		function execInsertData()
		{
            var jersey_url = "/dt2018105/stud/iStudent/insert";
            $.ajax({
                type: 'POST', // GET
        		contentType: 'application/json',
                url: jersey_url,
                dataType: "json", // data type of response
                data: insertFormToJSON(),
                error: function(xhr, status, error) {
                    console.log(arguments);
                    alert(" Can't do because: " + xhr);
                },
                success: renderDetailsInsert
            });
            
           
		}
		
		//Search Student
		function execSearchData()
		{
			var rollNoSrc = $("#rollNoSrc").val();
			var rool_No = JSON.stringify(rollNoSrc);
            var jersey_url = "/dt2018105/stud/iStudent/search";
            $.ajax({
                type: 'POST', // GET
        		contentType: 'application/json',
                url: jersey_url,
                data: rool_No,
                error: function(xhr, status, error) {
                    console.log(arguments);
                    alert(" Can't do because: " + xhr +error);
                },
                success: renderDetailsSearch
            });
		}
		
	</script>
    </head>
    
    <body>
    
    <div class="container">
  	<h3>Student Information System</h3>
    <ul class="nav nav-tabs">
  		<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#home">Home</a></li>
  		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#insert">Insert Student</a></li>
  		<li class="nav-item"><a class="nav-link" data-toggle="tab" id="studentView" href="#view" onclick="view();">View Student</a></li>
  		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#search">Search Student</a></li>
  		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#example">Example</a></li>
	</ul>
	
	<div class="tab-content">
    <div id="home" class="tab-pane container active">
      <p><img src="img/Enterprise Architecture.png" class="img-rounded" alt="Enterprise Archistecture"/></p>
      <p>Create student information systems with 1 table consist of variables:Name, Roll No, Date of Birth, Mark Physic, Chemistry and Math
      using bootsrap, jersey, java class (MVC) with MySql Database that exposes total mark function by student id.</p>
      <table class="table table-condensed" >
      	<tr>
      		<td> 
      			<p id="prof">Our Lecture : Prof K V Dinesha</p>
      			<img src="img/Prof K V Dinesha.jpg" class="img-rounded" alt="Enterprise Archistecture"/>
      		</td>
      		<td>
      			<p>Team Members:</p>
		      	<p>
		      	<ul>
		      		<li>Hario Bismo Kuntarto</li>
		      		<li>Faiq Wildana</li>
		      		<li>Vivek Podar</li>
		      	</ul>
      		</td>
      	</tr>
      </table>
     
      
    </div>
    
    <div id="insert" class="tab-pane container fade">
   	  <h3>Insert</h3>
      	<div class="container">  
      	<table>
            <tbody>
                <tr>
                    <td>Name </td>
                    <td><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" id="dob" name="dob" value='1988-11-11'></td>
                </tr>
                <tr>
                    <td>Mark In Physic</td>
                    <td><input type="number" id="mark_1" name="mark_1"></td>
                </tr>
                <tr>
                    <td>Mark In Chemistry</td>
                    <td><input type="number" id="mark_2" name="mark_2"></td>
                </tr>
                <tr>
                    <td>Mark In Math</td>
                    <td><input type="number" id="mark_3" name="mark_3"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    	<p>  	 	</p> 
                    	<button id="insertbtn" type="button" class="btn btn-default">Insert</button>
                    </td>
                </tr>
            </tbody>
        </table>       
		</div>  
		 <p>  	 	</p> 	 	
      	<div class="container">
		  <div class="col-sm-offset-4 col-sm-5">           
		  <table style="text-align:center" id="result"   class="table table-condensed">
		    <thead>
		      <tr>
		        <th id="resultInsert" colspan="2">Result Query :</th>
		      </tr>
		    </thead>
		  </table>
		  </div>
		</div>
    </div>
    
    <div id="view" class="tab-pane container fade">
      <h3>Student Information</h3>
	   <table style="text-align:center" id="resultView"   class="table table-condensed"></table>
    </div>
    
    <div id="search" class="tab-pane container fade">
      <h3>Search Student By ID</h3>
      	<div class="container">  
      	<table>
            <tbody>
                <tr>
                    <td>Roll Number </td>
                    <td><input type="number" id="rollNoSrc" name="rollNoSrc"></td>
                    <td>
                    	<button id="searchStudent" type="button" class="btn btn-default">Search Student</button>
                    </td>
                </tr>
            </tbody>
        </table>    
        <table style="text-align:left" id="resultSearch"   class="table table-condensed"></table>   
		</div>  		
    </div>
    
    <div id="example" class="tab-pane container fade">
      <h3>1. Jersey Hello World</h3>
      <p><a href="rest/hello">Jersey</a></p>
      
      <h3>2. Jersey Hello "/Change URI"</h3>
      <p><a href="rest/hello/Change Uri">Jersey Method Get</a></p>
      
      <h3>3. Json</h3>
      <p><a href="rest/json">Json</a></p>
      
      <h3>4. Ajax Json Services</h3>
      <p><a href="bootstrapExam.jsp">AJAX JSON</a></p>
      
      <h3>5. Servlet</h3>
      <form action="viewStudent"  method="POST">
        <table>
            <tbody>
            	<tr>
                    <td>Roll No</td>
                    <td><input type="number" name="rollno"></td>
                </tr>
                <tr>
                    <td>Name </td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="dob" value='1988-11-11'></td>
                </tr>
                <tr>
                    <td>Mark In Physic</td>
                    <td><input type="number" name="mark1"></td>
                </tr>
                <tr>
                    <td>Mark In Chemistry</td>
                    <td><input type="number" name="mark2"></td>
                </tr>
                <tr>
                    <td>Mark In Math</td>
                    <td><input type="number" name="mark3"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" /></td>
                </tr>
            </tbody>
        </table>       
        </form>
        
        <h3>6. Upload File</h3>
      	<p>
            Select file 1: <input id="uplImg" type="file" name="file" size="450"  accept=".png, .jpg, .jpeg" />
        </p>
        <p>
            <button id="uploadImgBtn" type="button" class="btn btn-default">Upload Image (PND/JPEG/JPG)</button>
        </p>
          <ul id="messages">   </ul>
      
    </div>
  </div>
	
      
     
        
        
        </div>
    </body>
</html>



