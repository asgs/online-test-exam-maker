<%@ page
	import="com.crossover.assignment.common.model.OnlineTestQuestion"%>
<%@ page import="com.crossover.assignment.common.model.OnlineQuestion"%>
<%@ page import="com.crossover.assignment.common.model.OnlineChoice"%>
<%@ page import="java.util.List"%>

<html>
<head>
<title>Welcome to Online Exam Maker Demo!</title>
<script type="text/javascript">
	function checkIfAllQuestionsAreAnswered() {
		var questionElements = document.getElementById("testForm").elements;
		for (var counter = 0; counter < questionElements.length; counter++) {
			var questionItem = questionElements.item(counter);
			if (questionItem.type === "radio") {
				var radioButtonName = questionItem.name;
				var buttonGroup = document.getElementsByName(radioButtonName);
				var checked = false;
				for (var j = 0; j < buttonGroup.length; j++) {
					checked = buttonGroup[j].checked || checked;
				}
				if (!checked) {
					if (confirm("You haven't answered all questions. Are you sure you want to submit?")) {
						return true;
					} else {
						return false;
					}
				}
				counter += 3;
			}
		}
		return true;
	}
</script>
</head>
<body style="background-color: silver; text-align: center">
	<h1>Online Exam Maker Demo!</h1>
	<h4>Your online test begins now! You can answer each question one
		by one or navigate to other questions as you wish.</h4>

	<br />
	<br />
	<form action="evaluateTest" method="post" id="testForm"
		onsubmit="return checkIfAllQuestionsAreAnswered();">

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
			<input type="radio"
				name="questionId_<%=question.getQuestion().getId()%>"
				value="choiceId_<%=choice.getId()%>"><%=choice.getChoice()%></input>
			<%
				}
			%>
			<br />
			<hr />
			<%
				}
			%>

		</div>
		<input type="hidden" name="testId"
			value=<%=(String) request.getAttribute("testId")%> /> <input
			type="submit" value="Submit answers" />
	</form>
</body>
</html>
