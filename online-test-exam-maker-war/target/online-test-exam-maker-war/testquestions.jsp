<%@ page
	import="com.crossover.assignment.common.model.OnlineTestQuestion"%>
<%@ page import="com.crossover.assignment.common.model.OnlineQuestion"%>
<%@ page import="com.crossover.assignment.common.model.OnlineChoice"%>
<%@ page import="java.util.List"%>

<html>
<head>
<title>Welcome to Online Exam Maker Demo!</title>
</head>
<body style="background-color: silver; text-align: center">
	<h1>Online Exam Maker Demo!</h1>
	<h4>Your online test begins now! You can answer each question one
		by one or navigate to other questions as you wish.</h4>

	<br />
	<br />
	<form action="" method="post">

		<%
			List<OnlineTestQuestion> questions = (List<OnlineTestQuestion>) request
					.getAttribute("testQuestions");
		%>
		<div id="questions">

			<%
				for (OnlineTestQuestion question : questions) {
			%>

			<p><%=question.getQuestion().getQuestion()%></p>
			<%
				List<OnlineChoice> choices = question.getChoices();
					for (OnlineChoice choice : choices) {
			%>
			<input type="radio" name=questionId_<%=question.getQuestion().getId()%>
				value=choiceId_<%=choice.getId()%>><%=choice.getChoice()%></input>
			<%
				}
			%>
			<br/><hr/>
			<%
				}
			%>

		</div>
		<input type="hidden" name="userId"
			value=<%=(String) request.getAttribute("userId")%> /> <input
			type="submit" value="Take Test Now!" />
	</form>
</body>
</html>
