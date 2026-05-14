<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.patient" %>

<html>
<head>
    <title>Patients Data</title>
</head>

<body>

<h2>Patients List</h2>

<table border="1">
    <tr>
        <th>HealthID</th>
        <th>Name</th>
        <th>Gender</th>
    </tr>

<%
    List<patient> patients = (List<patient>) request.getAttribute("Patient");

    if (patients != null) {
        for (int i = 0; i < patients.size(); i++) {
            patient p = patients.get(i);
%>
    <tr>
        <td><%= p.getHealthID() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getGender() %></td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="3">No data found</td>
    </tr>
<%
    }
%>

</table>

</body>
</html>