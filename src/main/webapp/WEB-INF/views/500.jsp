<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap core CSS -->
  <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/css/font-awesome.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/css/animate.min.css"/>" rel="stylesheet">
  <!-- Custom styling plus plugins -->
  <link href="<c:url value="/resources/css/custom.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/css/icheck/flat/green.css"/>" rel="stylesheet">
  <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<title>Virhe ohjelmassa</title>
 
</head>	
<body>
<img src="<c:url value="/resources/kuvat/haaga-helia.png"/>">
    <div id="wrapper">
      <div id="login" class="animate form">
      
        <section class="login_content">
<h1>Voi ei, ohjelmassa tapahtui virhe</h1>
<a href="<c:out value="/palaute/"/>"><h1>Etusivulle</h1></a>
	
		
		        </section>

      </div>
    </div>

</body>
</html>


