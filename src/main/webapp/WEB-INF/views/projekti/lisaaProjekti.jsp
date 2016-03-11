<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>Projektin lisääminen</title>
 
</head>	
<body>
	<h1>
		Lisää projekti
	</h1>
		<form:form modelAttribute="projekti" method="post">
		  	<fieldset>		
				<legend>Projektin tiedot</legend>
				<p>
					<form:label	path="projnimi">Projektin nimi</form:label><br/>
					<form:input path="projnimi" />		
				</p>
				<p>	
					<button type="submit">Lisää</button>
				</p>
			</fieldset>
		</form:form>
		
		
</body>
</html>