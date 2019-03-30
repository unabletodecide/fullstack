<!DOCTYPE html>  
<html lang="en">  
<head>  
  <title>Bootstrap example</title>  
    
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="/dt2018105/bootstrap/css/bootstrap.css">  
  <script src="/dt2018105/jquery/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
		$(document).ready(function() 
		{
			$('#calc').click(function()
			{
			    if (document.getElementById("a").value == "" ||
			    		document.getElementById("b").value == "" ||
			    		document.getElementById("c").value == "" ) 
			    {
			        alert("Please enter numbers for a, b and c");
			    } 
			    else 
			    {
					calcQuadEqn();
			    }
			});
		});

		function renderDetails(data)
		{
	        var a = $("#a").val();
	        var b = $("#b").val();
	        var c = $("#c").val();
			console.log(data);
			
			$("#eqn").html("The roots of the equation, ("+a+") x^2 + ("+b+") x + ("+c+") = 0 are:");
			
			$("#root1").html(data.root1);
			$("#root2").html(data.root2);
			$("#result").show();
			
		}

		function formToJSON() 
		{
	        var a = $("#a").val();
	        var b = $("#b").val();
	        var c = $("#c").val();
			var eqn = JSON.stringify({
	        	"a":a,
	        	"b":b,
	        	"c":c
	        	});
			return eqn;
		}
		
		function calcQuadEqn()
		{
            var jersey_url = "http://localhost:8080/dt2018105/rest/json/find_roots";// "<%=request.getContextPath() %>";
            $.ajax({
                type: 'POST', // GET
        		contentType: 'application/json',
                url: jersey_url,
                dataType: "json", // data type of response
                data: formToJSON(),
                //error: function(xhr){
                  //  alert("An error occured: " + xhr.status + " " + xhr.statusText);},
                // success: renderDetails
                success: function (data, textStatus, xhr) {
                	renderDetails(data);
                }
            });
		}
	</script>
  
</head>  
<body>  
<div class="container">   
  <form class="form-horizontal" action="#">
    <div class="form-group">
	  <h1 style="text-align: center"> We can help you find the quadratic roots of an equation</h1>  
	  <p style="text-align: center">Write the quadratic equation to be solved in the form of ax^2 + bx + c = 0 </p>
	  "<a href='http://localhost:8080/dt2018105/'>return</a>" 
    </div>
    <div class="form-group">
      <label class="control-label col-sm-1" for="a">a:</label>
      <div class="col-sm-3">
        <input type="number" step=".01" class="form-control" id="a" placeholder="Enter a value for a" name="a">
      </div>
      <label class="control-label col-sm-1" for="b">b:</label>
      <div class="col-sm-3">
        <input type="number" step=".01" class="form-control" id="b" placeholder="Enter a value for b" name="b">
      </div>
      <label class="control-label col-sm-1" for="c">c:</label>
      <div class="col-sm-3">
        <input type="number" step=".01" class="form-control" id="c" placeholder="Enter a value for c" name="c">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-5 col-sm-7">
        <button id="calc" type="button" class="btn btn-default">Find Roots</button>
      </div>
    </div>
  </form> 
</div>  

<div class="container">
  <div class="col-sm-offset-4 col-sm-5">           
  <table style="text-align:center" id="result"   class="table table-condensed">
    <thead>
      <tr>
        <th id="eqn" colspan="2">(a)x^2 + (b)x + (c) = 0</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>root 1</th>
        <td id="root1"></td>
      </tr>
     <tr>
        <th>root 2</th>
        <td id="root2"></td>
      </tr>
    </tbody>
  </table>
  </div>
</div>
  
  <script src="/dt2018105/jquery/jquery-3.3.1.min.js"></script>  
  <script src="/dt2018105/bootstrap/js/bootstrap.js"></script>  
</body>  
</html>  