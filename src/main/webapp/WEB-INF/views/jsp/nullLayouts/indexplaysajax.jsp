<%@ include file="../../layout/taglib.jsp"%>

<fmt:parseNumber var="count" value="0" />
<fmt:parseNumber var="noColumns" value="4" />
<fmt:parseNumber var="starter" value="0" />
<fmt:parseNumber var="unit" value="1" />
<fmt:parseNumber var="even" value="2" />
<fmt:parseNumber var="playsSize" value="${fn:length(plays)}" />

<div class="margin-bottom-50"></div>
<c:forEach items="${plays}" var="play">
					
<c:if test="${count == starter || (count%noColumns)==starter}">
	<div class="row news-v2 margin-bottom-50">
</c:if>

	<div class="col-sm-3 sm-margin-bottom-30">
		<div class="news-v2-badge">
		
			<div class="responsive-video">
				<iframe src="<c:out value='${play.url}'/>" frameborder="0" allowfullscreen></iframe>
			</div>
			<c:if test="${not empty play.created}">
				<p>
					<fmt:formatDate pattern="dd MM yy" value="${play.created}" />
				</p>
			</c:if>
		</div>
		
		<div class="news-v2-desc">
			<h3>
				<a href='<c:url value='/plays/view/${play.id}/${play.publication.friendlyUrl}'/>'><c:out value="${play.title}" /></a>
			</h3>
			<small>By <a href="<c:url value='/public/profile/${play.publication.profileName}' />" ><c:out value="${play.publication.profileName}" /></a> | In <a href="#"><c:out value="${play.playType.name}" /></a></small>
		</div>
	
	</div>
	
	<c:if test="${((count+unit) == playsSize) || ((count+unit)%noColumns==starter)}">
		</div>
	</c:if>
	

	<fmt:parseNumber var="count" value="${count + 1}" />

</c:forEach>