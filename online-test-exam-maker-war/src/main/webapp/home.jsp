<%@ page import="com.crossover.assignment.common.model.OnlineTest"%>
<html>
<head>
<title>Welcome to Online Exam Maker Demo!</title>
</head>
<body style="background-color: silver; text-align: center">
	<h1>Online Exam Maker Demo!</h1>
	<h2>
		Welcome back,
		<%=(String) request.getAttribute("userId")%></h2>

	<br />
	<br />
	<form action="takeTest" method="post">

		<h4>You currently have the following test assigned to you. You
			can read the details and may wish to take it up by clicking 'Take
			Test Now!' button below.</h4>

		<%
			OnlineTest onlineTest = (OnlineTest) request
					.getAttribute("testInfo");
			if (onlineTest != null) {
		%>
		<div id="testDetails">
			<p>
				Test Name is
				<%=onlineTest.getName()%></p>
			<p>
				Test Description is
				<%=onlineTest.getDescription()%></p>
		</div>
		<%
			}
		%>
		<input type="hidden" name="testId" value=<%=onlineTest.getId()%> />
		<input type="hidden" name="userId" value=<%=(String) request.getAttribute("userId")%> /> 
		<input type="submit" value="Take Test Now!" />
	</form>
</body>
</html>
