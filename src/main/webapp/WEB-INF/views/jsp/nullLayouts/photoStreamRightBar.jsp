<%@ include file="../../layout/taglib.jsp"%>
<c:url value="/public/albums/lalife/" var="lalifeAlbum" />
<div class="headline"><h2 class="heading-sm">Photo Stream</h2></div>
<ul class="list-unstyled blog-photos margin-bottom-35">			
	<c:forEach items="${albumUploads}" var="upload">
		<li><a href="${lalifeAlbum}"><img src="<c:url value='/uploads/download?key=${upload.keyIdentification}'/>" alt="${upload.altText}" class="hover-effect"></a></li>
	</c:forEach>
</ul>