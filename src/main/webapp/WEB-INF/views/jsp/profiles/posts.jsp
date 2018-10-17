<%@ include file="../../layout/taglib.jsp"%>


<h2><c:out value="${actingProfile.name}"/></h2>
<a class="btn-u rounded btn-u-dark-blue btn-u-xs"  href="<spring:url value='/posts/add' />"><i class="fa fa-magic"></i> New Post</a>
<hr>


<c:forEach items="${profilePosts}" var="post">
	


<!--Blog Post-->
<div class="row blog blog-medium margin-bottom-40">

	<c:choose>
		<c:when test="${not empty post.uploads && fn:length(post.uploads)>= 1}">
		
			<div class="col-md-5">
				<img class="img-responsive" src="<c:url value='/uploads/download?key=${post.uploads.iterator().next().keyIdentification}'/>" alt="${post.uploads.iterator().next().altText}">
			</div>
			
			<div class="col-md-7">
					<h2><a href="<c:url value='/posts/view/${post.id}'/>"><c:out value="${post.title}" /></a></h2>
					<ul class="list-unstyled list-inline blog-info">
						<li><i class="fa fa-calendar"></i> <fmt:formatDate value="${post.created}" type="both" dateStyle="medium" timeStyle="medium" /></li>
						<li><i class="fa fa-comments"></i> <a href='<c:url value="/posts/view/${post.id}#commentingSection"/>'>${fn:length(post.comments)} Comments</a></li>
						<li><i class="fa fa-tags"></i> Technology, Internet</li>
					</ul>
					<div class="crop"><c:out value="${post.content}" escapeXml="false"/></div>
					<p>
						<a class="btn-u rounded btn-u-dark-blue btn-u-xs" href="<c:url value='/posts/view/${post.id}'/>"><i class="fa fa-location-arrow"></i> Read More</a>
					</p>
			</div>
			
		
		</c:when>
		
		<c:otherwise>
		
			<div class="">
					<h2><a href="<c:url value='/posts/view/${post.id}'/>"><c:out value="${post.title}" /></a></h2>
					<ul class="list-unstyled list-inline blog-info">
						<li><i class="fa fa-calendar"></i> <fmt:formatDate value="${post.created}" type="both" dateStyle="medium" timeStyle="medium" /></li>
						<li><i class="fa fa-comments"></i> <a href='<c:url value="/posts/view/${post.id}#commentingSection"/>'>${fn:length(post.comments)} Comments</a></li>
						<li><i class="fa fa-tags"></i> Technology, Internet</li>
					</ul>
					<div class="crop"><c:out value="${post.content}" escapeXml="false"/></div>
					<p>
						<a class="btn-u rounded btn-u-dark-blue btn-u-xs" href="<c:url value='/posts/view/${post.id}'/>"><i class="fa fa-location-arrow"></i> Read More</a>
					</p>
			</div>
		
		
		</c:otherwise>
	</c:choose>

	
</div>
<div class="clearfix margin-bottom-20"><hr></div>
<!--End Blog Post-->
</c:forEach>