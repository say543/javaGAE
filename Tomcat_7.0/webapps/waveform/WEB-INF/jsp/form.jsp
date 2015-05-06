

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type = "text/javascript">

	function myFunction(){
		//var test = "ab";
		//document.write(this.test);
		return this;
	}
	
	var fullname ="ab";
	
	var obj = {
		fullname : "Colin Ihrig",
		prop: {
			fullname : "joe",
			getFullName: function(){
				return this.fullname;
			}
		}
	}
	console.log(obj.prop.getFullName());
	var test = obj.prop.getFullName;
	console.log(test());
	console.log(test.call(obj));
	
	
	
	
	/*function myFunction(){
		var form = document.forms[0];
		form.action = "/waveform/submit";
		form.method = "get";
		form.submit();
	}*/
</script>


</head>
<body>
	<h1> Query Form </h1>
	<form action = "">
		name:<input type="text" name = "name">
		rsnum:<input type="text" name = "rsnum">
		<input type="button" value = "query" onclick = "myFunction()">
	</form>>
</body>
</html>