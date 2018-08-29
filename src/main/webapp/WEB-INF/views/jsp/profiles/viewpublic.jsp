<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp" %>
<div class="headline">
	<h2><c:out value="${userProfile.name}" /></h2>
</div>

<c:forEach items="${featuredPublications}" var="featuredItem">
	 <c:choose>
		<c:when test="${not empty featuredItem.post}">
			<c:choose>
				<c:when test="${not empty featuredItem.post.uploads && fn:length(featuredItem.post.uploads)>= 1}">
				
					<div class="col-md-5">
						<img class="img-responsive" src="<c:url value='/uploads/download?key=${featuredItem.post.uploads.iterator().next().keyIdentification}'/>" alt="${featuredItem.post.uploads.iterator().next().altText}">
					</div>
					
					<div class="col-md-7">
							<h2><a href="<c:url value='/posts/view/${featuredItem.post.id}/${featuredItem.friendlyUrl}'/>"><c:out value="${featuredItem.post.title}" /></a></h2>
							
							<div><c:out value="${featuredItem.post.description}" escapeXml="false"/></div>
							<p>
								<a class="btn-u btn-brd btn-u-blue" href="<c:url value='/posts/view/${featuredItem.post.id}/${featuredItem.friendlyUrl}'/>"><i class="fa fa-hand-o-up"></i> Read More</a>
							</p>
					</div>
					
				
				</c:when>
				
				<c:otherwise>
				
					<div class="">
							<h2><a href="<c:url value='/posts/view/${featuredItem.post.id}/${featuredItem.friendlyUrl}'/>"><c:out value="${featuredItem.post.title}" /></a></h2>
							
							<div><c:out value="${featuredItem.post.description}" escapeXml="false"/></div>
							<p>
								<a class="btn-u btn-brd btn-u-blue" href="<c:url value='/posts/view/${featuredItem.post.id}/${featuredItem.friendlyUrl}'/>"><i class="fa fa-hand-o-up"></i> Read More</a>
							</p>
					</div>
				
				
				</c:otherwise>
			</c:choose>
		</c:when>
		
		<c:when test="${not empty featuredItem.play}">
		<!-- News v3 -->
		<div class="row margin-bottom-20">
			<div class="col-sm-5 sm-margin-bottom-20">
     
			     <div class="responsive-video">
					<iframe src="<c:out value='${featuredItem.play.url}'/>" frameborder="0" allowfullscreen></iframe>
				 </div>
			         
			     </div>
			     <div class="col-sm-7 news-v3">
			         <div class="news-v3-in-sm no-padding">
			             
			             <h2><a href="<c:url value='/plays/view/${featuredItem.play.id}/' />"><c:out value="${featuredItem.play.title}" /></a></h2>
			             <div class="crop"><c:out value="${featuredItem.play.description}" escapeXml="false"/></div>
		            	 <p>
							<a class="btn-u btn-brd btn-u-blue" href="<c:url value='/plays/view/${featuredItem.play.id}/' />"><i class="fa fa-hand-o-up"></i> View More</a>
					     </p>
			         </div>
			     </div>
		      </div><!--/end row-->
 			<!-- End News v3 -->
		
		</c:when>
	</c:choose>
     

<div class="clearfix margin-bottom-20"><hr></div>
</c:forEach>


<!-- Pager v3 -->
<!-- <ul class="pager pager-v3 pager-sm no-margin-bottom">
    <li class="previous"><a href="#">&larr; Older</a></li>
    <li class="page-amount">1 of 7</li>
    <li class="next"><a href="#">Newer &rarr;</a></li>
</ul> -->
<!-- End Pager v3 -->

