<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp" %>
<c:url var="bucketPostUrl" value="/bucket/${userProfile.name}" />

<c:choose>
		<c:when test="${not empty userProfile.coverUploads && fn:length(userProfile.coverUploads) >= 1}">
			<img class="img-responsive full-width" src="<c:url value='/ui/uploads/download?key=${userProfile.coverUploads.iterator().next().keyIdentification}'/>" alt="${userProfile.coverUploads.iterator().next().altText}">
		</c:when>
</c:choose>


<h2><c:out value="${userProfile.name}" /></h2>
<ul class="list-inline up-ul">
	<li><a class="btn-u btn-brd btn-brd-hover rounded-2x btn-u-dark-blue btn-u-sm"  href="<spring:url value='/conversations/conversate/${userProfile.name}' />"><i class="fa fa-magic"></i>Message</a></li>
	<li>
		<form:form action="${bucketPostUrl}" method="post" onSubmit="return confirm('Please confirm before the action is processed.');" class="form-inline">
			<input type="hidden" value="${userProfile.name}" name="bucketID" >
			<button class="btn-u btn-brd btn-brd-hover rounded-2x btn-u-purple btn-u-sm" type="submit">Add to my Bucket</button>
		</form:form>
	</li>
	<li></li>
</ul>

<c:choose>
	<c:when test="${not empty post.publication.uploads && fn:length(post.publication.uploads) > 1}">
		<div class="carousel slide carousel-v2" id="portfolio-carousel">
			<ol class="carousel-indicators">
				<fmt:parseNumber var="licount" value="1" />
				<fmt:parseNumber var="activeLiItemIndex" value="1" />
				<c:forEach items="${post.publication.uploads}" var="upload">

					<c:set var="itemClass" value="rounded-x active" />
					<c:if test="${licount > activeLiItemIndex}">
						<c:set var="itemClass" value="rounded-x" />
					</c:if>
					<li class="${itemClass}" data-target="#portfolio-carousel"
						data-slide-to="${licount}"></li>
					<fmt:parseNumber var="licount" value="${licount + 1}" />
				</c:forEach>
			</ol>
			<div class="carousel-inner">
				<fmt:parseNumber var="count" value="1" />
				<fmt:parseNumber var="activeItemIndex" value="1" />
				<c:forEach items="${post.publication.uploads}" var="upload">

					<c:set var="itemClass" value="item active" />
					<c:if test="${count > activeItemIndex}">
						<c:set var="itemClass" value="item" />
					</c:if>

					<div class="<c:out value='${itemClass}' />">
						<img class="img-responsive full-width"
							src="<c:url value='/uploads/download?key=${upload.keyIdentification}'/>" alt="${upload.altText}">
					</div>
					<fmt:parseNumber var="count" value="${count + 1}" />
				</c:forEach>
			</div>
			<a class="left carousel-control rounded-x"
				href="#portfolio-carousel" role="button" data-slide="prev"> <i
				class="fa fa-angle-left arrow-prev"></i>
			</a> <a class="right carousel-control rounded-x"
				href="#portfolio-carousel" role="button" data-slide="next"> <i
				class="fa fa-angle-right arrow-next"></i>
			</a>
		</div>




	</c:when>


	<c:when test="${not empty post.publication.uploads && fn:length(post.publication.uploads) == 1}">
		<!-- img-responsive full-width -->
		<img class="img-responsive full-width" src="<c:url value='/uploads/download?key=${post.publication.uploads.iterator().next().keyIdentification}'/>" alt="${post.publication.uploads.iterator().next().altText}">
	</c:when>
</c:choose>

<%@ include file="../nullLayouts/profilePublications.jsp"%>
