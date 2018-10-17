<%@ include file="../../layout/taglib.jsp"%>


<h2><c:out value="${actingProfile.name}"/></h2>
<a class="btn-u rounded btn-u-dark-blue btn-u-xs"  href="<spring:url value='/plays/add' />"><i class="fa fa-magic"></i> New Play</a>
<hr>

<%@ include file="../nullLayouts/indexplaysajax.jsp"%>