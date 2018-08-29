<%@ include file="../../layout/taglib.jsp"%>

<h2 class="title-v4">Blog &amp; Comments</h2>

<c:forEach items="${latestBlogComments}" var="comment">

	<div class="blog-thumb-v3">
		<small> <c:if test="${not empty comment.profile}">
				<a href="<spring:url value='/profile/${comment.profile.id}/'/>"><c:out
						value="${comment.profile.name}" /></a>
			</c:if> in <c:out value="${comment.post.title}" />
		</small>

		<h3>
			<a href="<spring:url value='/posts/view/${comment.post.id}/'/>"><c:out value="${comment.message}" /></a>
		</h3>
	</div>

	<hr class="hr-xs">

</c:forEach>
