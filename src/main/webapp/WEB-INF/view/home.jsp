<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
<title>luv2code Company home page</title>

</head>

<body>
	<h2>luv2code Company home page</h2>
	<hr>
	
	<p>
	Welcome to the luv2code company home page
	</p>
	
	<hr>
	<!-- display user name and role -->
	<p>
		User: <security:authentication property="principal.username"/>
		<hr></hr>
		Role(s): <security:authentication property="principal.authorities"/>
	</p>
	
	<!-- Add a link to point to /leaders this is for managers -->
	<security:authorize access="hasRole('MANAGER')">
	<p>
		<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
		(Only for Managers)
	</p>
	</security:authorize>
	<!-- Add a link to point to /systems this is for admin -->
	<security:authorize access="hasRole('ADMIN')">
	<p>
		<a href="${pageContext.request.contextPath}/systems">Admins meeting</a>
		(Only for Admin)
	</p>
	</security:authorize>
	<hr>
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
				method="POST">
	
		<input type="submit" value="Logout"/>
	
	</form:form>
</body>



</html>