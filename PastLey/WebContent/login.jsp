<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--           -->
<!-- ATTRIBUTE -->
<!--           -->
<c:set var="title_project" scope="session" value="| Ingresar"/>
<c:set var="url_project" scope="session" value="<%=request.getContextPath()%>"/>
 
<!--          -->
<!-- TEMPLATE -->
<!--          -->  
<%@include file="/template/header.jsp"%>

<%@include file="/template/footer.jsp"%>