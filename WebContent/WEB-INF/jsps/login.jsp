<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<!--Pulling Awesome Font -->
	<script>
		function callMyJS() {
			//alert("I am clicked");
			document.forms[0].submit();
		}
	</script>
	<form:form action="MixedFinal" method="post" commandName="agent">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-5 col-md-3">
					<div class="form-login">
						<h4>Welcome back.</h4>
						<form:input path="name" type="text" placeholder="name" />
						<!-- <input type="text" id="userName"
							class="form-control input-sm chat-input" placeholder="username" /> -->
						<br />
						<form:input path="password" type="text" placeholder="password" />
						<!-- <input type="text" id="password"
							class="form-control input-sm chat-input" placeholder="password" /> -->
						<br />
						<div class="wrapper">
							<span class="group-btn"> <a href="javascript:void(0)"
								onClick="callMyJS()" class="btn btn-primary btn-md">login <i
									class="fa fa-sign-in"> </i></a>
							</span>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form:form>
</body>
</html>