<%@ page import="com.crossover.assignment.common.model.OnlineTestResult"%>
<%@ page import="java.util.List"%>

<html>
<head>
<title>Welcome to Online Exam Maker Demo!</title>
</head>
<body style="background-color: silver; text-align: center">
	<h1>Online Exam Maker Demo!</h1>

	<%
		OnlineTestResult result = (OnlineTestResult) request
				.getAttribute("testresult");

		if ("Success".equalsIgnoreCase(result.getResult())) {
	%>
	<h2 style="color: green">Congratulations! You've passed this test
		successfully.</h2>
	<%
		} else {
	%>
	<h2 style="color: red">Sorry, but you have NOT passed this test
		successfully.</h2>
	<%
		}
	%>

	<h4>
		You grade is
		<%=result.getGrade()%></h4>

</body>
</html>
