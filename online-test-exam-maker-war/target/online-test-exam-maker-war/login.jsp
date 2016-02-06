<html>
<head>
<title>Welcome to Online Exam Maker Demo!</title>
</head>
<body style="background-color: silver; text-align: center">
	<h1>Online Exam Maker Demo!</h1>
	<h2>Please login</h2>
	<form action="authenticate" method="post">
		<br /> <br />
		<hr />
		<br /> <br />
		<%
			String errorMessage = (String) request.getAttribute("error");
			if (errorMessage != null) {
		%>
		<div style="color: red"><%=errorMessage%></div>
		<br />
		<%
			}
		%>

		<div
			style="margin: auto; width: 25%; border: 1px dotted red; padding: 25px">
			<div>
				<input id="userId" name="userId" type="text" length="40"
					placeholder="User ID" autofocus="autofocus" />
			</div>
			<br /> <br />
			<div>
				<input id="password" name="password" type="password" length="50"
					placeholder="Password" />
			</div>
		</div>
		<br /> <br />
		<hr />
		<br /> <br /> <input type="submit" value="Login!" />
	</form>
</body>
</html>
