<%@ include file="../../layout/taglib.jsp"%>

<fmt:parseNumber var="count" value="0" />
<fmt:parseNumber var="noColumns" value="4" />
<fmt:parseNumber var="starter" value="0" />
<fmt:parseNumber var="unit" value="1" />
<fmt:parseNumber var="even" value="2" />
<fmt:parseNumber var="postsSize" value="${fn:length(posts)}" />


<div class="margin-bottom-50"></div>
<c:forEach items="${posts}" var="post">

	

		<c:if test="${count == starter || (count%noColumns)==starter}">
					<div class="row news-v2 margin-bottom-30">
		</c:if>
		

	

		<div class="col-md-3">
			<div class="thumbnails thumbnail-style thumbnail-kenburn">
				<div class="thumbnail-img">
					
					<c:choose>
						<c:when test="${not empty post.uploads && fn:length(post.uploads) >= 1}">
							<div class="overflow-hidden">
								<img class="img-responsive" src="<c:url value='/uploads/download?key=${post.uploads.iterator().next().keyIdentification}'/>" alt="">
							</div>
						</c:when>
						<c:otherwise>
							<div class="overflow-hidden">
								<img class="img-responsive" src="<c:url value='/resources_1_9_5/img/main/img22.jpg'/>" alt="">
							</div>
						</c:otherwise>
					</c:choose>
					
					
					<a class="btn-more hover-effect" href="<c:url value='/posts/view/${post.id}/${post.publication.friendlyUrl}'/>">read more +</a>
				</div>
				<div class="caption">
					<h3><a class="hover-effect" href="<c:url value='/posts/view/${post.id}/${post.publication.friendlyUrl}'/>"><c:out value="${post.title}" /></a></h3>
					<small>By <a href="<c:url value='/public/profile/${post.publication.profileName}' />" ><c:out value="${post.publication.profileName}" /></a> | <fmt:formatDate pattern="dd MMMM yy" value="${post.created}" /></small>
					<p><c:out value="${post.description}" /></p>
				</div>
			</div>
		</div>
	

	

		<c:if test="${((count+unit) == postsSize) || ((count+unit)%noColumns==starter)}">
			</div>
		</c:if>
		

	

	<fmt:parseNumber var="count" value="${count + 1}" />

</c:forEach>