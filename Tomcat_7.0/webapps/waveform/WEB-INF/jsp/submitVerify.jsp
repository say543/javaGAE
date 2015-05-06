<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1> submit content through MVC</h1>
	index1 : *** ${index1}
	<br/>
	index2 : *** ${index2}
	
<br>
<h3>Records List</h3>
<c:if test="${not empty listRecords}">
<table class="tg">
    <tr>
        <th width="80">Records ID</th>
        <th width="120">Records Name</th>
        <th width="120">Records Rsnum</th>
    </tr>
    <c:forEach items="${listRecords}" var="record">
        <tr>
            <td>${record.id}</td>
            <td>${record.name}</td>
            <td>${record.rsnum}</td>
        </tr>
    </c:forEach>
</table>
    
</c:if>
    <!-- c:forEach items="${listPersons}" var="person"-->
    <!-- <td>${person.id}</td> -->
    <!-- <td>${person.name}</td> -->

</body>
</html>