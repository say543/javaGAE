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
<link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
</head>
<body>
<h3>Query Persons</h3>
 
<form:form action="/waveform/formAndDisplay" method="get">
		name:<input type="text" name = "name"><br>
		rsnum:<input type="text" name = "rsnum"><br>
		<input type="submit" value = "query"> 
</form:form>
<br>

<h3>Records List</h3>
<c:if test="${not empty listRecords}">
<table class="tg" align="left">
    <tr>
        <th width="80" id="th1">Records ID</th>
        <th width="120" id="th2">Records Name</th>
        <th width="120" id="th3">Records Rsnum</th>
        <th width="120" id="th4">Records Drivedate</th>
        <th width="120" id="th5">Records Drivescan</th>
        <th width="120" id="th6">Records Temp</th>
        <th width="120" id="th7">Records Volts</th>
        <th width="120" id="th8">Records Previmage</th>
        <th width="120" id="th9">Records Tft</th>
        <th width="120" id="th10">Records Waveformname</th>
        <th width="120" id="th11">Records Samplecondi</th>
        <th width="120" id="th12">Records Barcodescan</th>
        <th width="120" id="th13">Records Notes</th>
        <th width="120" id="th14">Records Link</th>
    </tr>
    <c:forEach items="${listRecords}" var="record">
        <tr>
            <td headers="th1">${record.id}</td>
            <td headers="th2">${record.name}</td>
            <td headers="th3">${record.rsnum}</td>
            <td width="th4">${record.drivedate}</td>
            <td width="th5">${record.drivescan}</td>
            <td width="th6">${record.temp}</td>
            <td width="th7">${record.volts}</td>
            <td width="th8">${record.previmage}</td>
            <td width="th9">${record.tft}</td>
            <td width="th10">${record.waveformname}</td>
            <td width="th11">${record.samplecondi}</td>
            <td width="th12">${record.barcodescan}</td>
            <td width="th13">${record.notes}</td>
            <td width="th14"><a href='${record.link}' >Link</a></td>
        </tr>
    </c:forEach>
</table>
    
</c:if>
    <!-- c:forEach items="${listPersons}" var="person"-->
    <!-- <td width="th14"><a href='${record.link}' >Link</a></td>  -->
    <!--  <td width="th14"><a href="${record.link}" >Link</a></td>   -->
    <!-- <td width="th14"><a href="<c:url value='${record.link}' />" >Link</a></td>  -->
    <!-- <td>${person.id}</td> -->
    <!-- <td>${person.name}</td> -->

</body>
</html>