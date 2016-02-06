						Online Test Exam Maker
						~~~~~~~~~~~~~~~~~~~~~~

Hello! Welcome to the README of this web app.

1. The instructions to build, deploy, configure and stand up the application servers are provided in the Instructions.txt file under the Deployment directory as it made sense to have it in that directory. Also, the DB Setup instructions are provided in the same file.

2. Assumptions made

	1. No password encryption mechanism will be used to authenticate the user. For simplicity purposes, plain text is transmitted from client to server and same is stored in DB too.

	2. The scope and look & feel of Screen UIs will be limited and are only provided to access the backend functionalities.

	3. The SQL Scripts provided herewith require the user to have the necessary create/drop privileges.
	
3. Requirements not covered (or not met). This is because of the 3-day time limit on the assignment submission.
	
	1. The timer service (both front-end and back-end) is not implemented. So the user is not imposed of a time barrier to submit the test.
	
	2. All the questions are displayed one after the other in the same page. There's no one Question per page and a drop down to skip to a random Question.
	
	3. Unit testing using DBUnit wasn't covered. Right now, I have a few tests which assumes the DB is live which may not be the case when you run it in your local, so they are not added to the src/test/java folder in order not to block the build process.
	
4. I have some feedback on improving the assignment process. One good thing is, technically, the assignment is good enough to test the Candidate's skills. The assignment appears to be feasible, however, asking them to prepare this much of documentation (video, entire DB setup scripts, instructions, design document, etc.,) in addition to the Source Code is not entirely feasible. One big README is welcome, but that should be it. This is the main reason I wasn't able to complete a few requirements tabulated above. I'd be happier to do those given enough time.
