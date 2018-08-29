<%@ include file="../../layout/taglib.jsp"%>

<fmt:parseNumber var="count" value="0" />
<fmt:parseNumber var="noColumns" value="4" />
<fmt:parseNumber var="starter" value="0" />
<fmt:parseNumber var="unit" value="1" />
<fmt:parseNumber var="even" value="2" />
<fmt:parseNumber var="friendSize" value="${fn:length(profiles)}" />

<div class="margin-bottom-50"></div>
<c:forEach items="${profiles}" var="friend">

		<c:if test="${count == starter || (count%noColumns)==starter}">
					<div class="row news-v2">
		</c:if>

		<div class="col-md-3">
			<div class="thumbnails thumbnail-style thumbnail-kenburn">
				<div class="thumbnail-img">
				
				<div class="overflow-hidden">
					<c:choose>
							<c:when test="${empty friend.profilePicture && fn:length(friend.profilePicture) < 1}">
									<img class="img-responsive" src="<c:url value='/resources_1_9_5/img/main/img22.jpg'/>" alt="">
							</c:when>
							<c:otherwise>
								
									<img class="img-responsive" src="<c:url value='/ui/uploads/download?key=${friend.profilePicture.iterator().next().keyIdentification}'/>" alt="${friend.profilePicture.iterator().next().altText}">
								
							</c:otherwise>
					</c:choose>
				</div>
					<a class="btn-more hover-effect" href="<c:url value='/profile/${friend.name}'/>">read more +</a>
				</div>
				<div class="caption">
					<h3><a class="hover-effect" href="<c:url value='/profile/${friend.name}'/>"><c:out value="${friend.name}" /></a></h3>
					<small>Member Since <fmt:formatDate pattern="dd MMMM yyyy" value="${friend.created}" /></small>
					<p><c:out value="${friend.description}" escapeXml="false"/></p>
				</div>
			</div>
		</div>
	

	

		<c:if test="${((count+unit) == friendSize) || ((count+unit)%noColumns==starter)}">
			</div>
			<div class="margin-bottom-50"></div>
		</c:if>
		

	

	<fmt:parseNumber var="count" value="${count + 1}" />

</c:forEach>