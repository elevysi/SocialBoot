<%@ include file="../../layout/taglib.jsp"%>


<fmt:parseNumber var="count" value="0" />
<fmt:parseNumber var="noColumns" value="4" />
<fmt:parseNumber var="starter" value="0" />
<fmt:parseNumber var="unit" value="1" />
<fmt:parseNumber var="even" value="2" />
<fmt:parseNumber var="publicationsSize" value="${fn:length(publications)}" />

<spring:eval expression="@environment.getProperty('blogService.url')" var="blogServiceUrl" />
<div class="margin-bottom-50"></div>
<c:forEach items="${publications}" var="publication">


		<c:if test="${count == starter || (count%noColumns)==starter}">
					<div class="row news-v2 margin-bottom-30">
		</c:if>

		<div class="col-md-3">
				
				<c:choose>
						<c:when test="${not empty publication.post}">
						
							<c:set var="post" value="${publication.post}" />
						
							<div class="thumbnails thumbnail-style thumbnail-kenburn">
								<div class="thumbnail-img">
						
									<c:choose>
										<c:when test="${not empty publication.uploads && fn:length(publication.uploads) >= 1}">
											<div class="overflow-hidden">
												<img class="img-responsive" src="<c:url value='${blogServiceUrl}/uploads/download?key=${publication.uploads.iterator().next().keyIdentification}'/>" alt="">
											</div>
										</c:when>
										<c:otherwise>
											<div class="overflow-hidden">
												<img class="img-responsive" src="<c:url value='/resources_1_9_5/img/main/img22.jpg'/>" alt="">
											</div>
										</c:otherwise>
									</c:choose>
									
								<div class="caption">
									<h3><a class="hover-effect" href="<c:url value='${blogServiceUrl}/public/publication/view/${publication.id}/${publication.friendlyUrl}'/>"><c:out value="${post.title}" /></a></h3>
									<small>By <a href="<c:url value='/public/profile/${publication.profileName}' />" ><c:out value="${publication.profileName}" /></a> | <fmt:formatDate pattern="dd MMMM yy" value="${post.created}" /></small>
									<p><c:out value="${post.description}" /></p>
								</div>
								</div>
								<a class="btn-more hover-effect" href="${blogServiceUrl}/public/publication/view/${publication.id}/${publication.friendlyUrl}">read more +</a>
							</div>
							
						</c:when>
						
						<c:when test="${not empty publication.play}">
						
							<c:set var="play" value="${publication.play}" />
						
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
					                <a href='<c:url value='${blogServiceUrl}/public/publication/view/${publication.id}/${publication.friendlyUrl}'/>'><c:out value="${play.title}" /></a>
					            </h3>
					            <small>By <a href="<c:url value='/public/profile/${publication.profileName}' />" ><c:out value="${publication.profileName}" /></a> | In <a href="#">Video</a></small>
					        </div>
						
						</c:when>
						
						<c:when test="${not empty publication.dossier}">
						
							<c:set var="dossier" value="${publication.dossier}" />
							
							<div class="thumbnails thumbnail-style thumbnail-kenburn">
								<div class="thumbnail-img">
						
									<c:choose>
										<c:when test="${not empty publication.uploads && fn:length(publication.uploads) >= 1}">
											<div class="overflow-hidden">
												<img class="img-responsive" src="<c:url value='${blogServiceUrl}/uploads/download?key=${publication.uploads.iterator().next().keyIdentification}'/>" alt="">
											</div>
										</c:when>
										<c:otherwise>
											<div class="overflow-hidden">
												<img class="img-responsive" src="<c:url value='/resources_1_9_5/img/main/img22.jpg'/>" alt="">
											</div>
										</c:otherwise>
									</c:choose>
									
								<div class="caption">
									<h3><a class="hover-effect" href="<c:url value='${blogServiceUrl}/public/publication/view/${publication.id}/${publication.friendlyUrl}'/>"><c:out value="${dossier.name}" /></a></h3>
									<small>By <a href="<c:url value='/public/profile/${publication.profileName}' />" ><c:out value="${publication.profileName}" /></a> | <fmt:formatDate pattern="dd MMMM yy" value="${dossier.created}" /></small>
									<p><c:out value="${dossier.description}" escapeXml="false"/></p>
								</div>
								</div>
								<a class="btn-more hover-effect" href="${blogServiceUrl}/public/publication/view/${publication.id}/${publication.friendlyUrl}">read more +</a>
							</div>
							
						</c:when>
						
				</c:choose>
		</div>
		
		<c:if test="${((count+unit) == publicationsSize) || ((count+unit)%noColumns==starter)}">
			</div>
		</c:if>
		
		<fmt:parseNumber var="count" value="${count + 1}" />

</c:forEach>

<div class="tag-box tag-box-v7 text-justify">
	<div class="text-center">
		<ul class="pagination">
			<li class="next"><a href="<c:out value='${currentUrl}?page=${nextpageIndex}'/>">Next</a></li>
		</ul>
	</div>
</div>