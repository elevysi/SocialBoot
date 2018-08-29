<%@ include file="../../layout/taglib.jsp"%>


<h2><c:out value="${actingProfile.name}"/></h2>
<a class="btn-u rounded btn-u-dark-blue btn-u-xs"  href="<spring:url value='/albums/add' />"><i class="fa fa-magic"></i> New Album</a>
<hr>
<ul>
	<c:forEach items="${profileAlbums}" var="album">
		<li><a href='<c:url value="/albums/view/${album.id}/"/>'><c:out value="${album.name}" /></a></li>
	</c:forEach>
</ul>