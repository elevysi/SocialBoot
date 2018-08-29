<%@ include file="../../layout/taglib.jsp"%>

<div id="likes">

<c:forEach items="${itemLikes}" var="like">

	<ul>
		<li class="">
		<div class="row blog-comments margin-bottom-30">
			<div class="col-sm-2 sm-margin-bottom-40">
				<c:choose>
					<c:when test="${not empty like.likeOwner.profilePicture}">
						<img src="<c:url value='/uploads/download?key=${like.likeOwner.profilePicture.keyIdentification}'/>" alt="${like.likeOwner.profilePicture.altText}">
					</c:when>
					<c:otherwise>
						<img src="<c:url value='/resources_1_8/img/team/img1-sm.jpg'/>" alt="">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-sm-10 sm-margin-bottom-40">
				<c:out value="${like.likeOwner.name}" />
			</div>
		</div>
		</li>
	</ul>

</c:forEach>


</div>