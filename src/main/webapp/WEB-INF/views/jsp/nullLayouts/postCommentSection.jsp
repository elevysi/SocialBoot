<%@ include file="../../layout/taglib.jsp"%>

<c:url var="commentFormUrl" value="/comments/public/section/doSaveComment/${objectType}/${objectId}" />
<c:url var="likeFormUrl" value="/likes/${objectType}/${objectId}" />
<c:url var="shareFormUrl" value="/shares/${objectType}/${objectId}" />
<c:url var="getCommentsUrl" value="/comments/public/section/${objectType}/${objectId}" />
<c:set var="noCmts" value="${noComments}" />
<c:set var="noLikes" value="${noLikes}" />
<c:set var="noShares" value="${noShares}" />
<security:authorize access="isAuthenticated()">

<div class="row">
	<div class="col-md-3">
		<div class="row">
			<div class="col-md-6">
				<form:form commandName="like"  action="${likeFormUrl}" method="post" id="likePostForm">
					<form:hidden path="itemId" value="${objectId}"/>
					<form:hidden path="itemType" value="${objectType}"/>
					<button type="submit" class="btn-u"><i class="icon-custom rounded-x icon-bg-u fa fa-thumbs-up icon-sm "></i></button>
				</form:form>
			</div>
			
			<div class="col-md-6">
				<form:form commandName="share"  action="${shareFormUrl}" method="post" id="sharePostForm">
					<form:hidden path="itemId" value="${objectId}"/>
					<form:hidden path="itemType" value="${objectType}"/>
					<button type="submit" class="btn-u"><i class="icon-custom rounded-x icon-bg-u icon-sm icon-share"></i></button>
				</form:form>
			</div>
		</div>
	</div>
</div>

</security:authorize>
<hr>

<h2 class="margin-bottom-20">Comments</h2>

<!-- Form -->
<div id="CmtMsg" style="display: none;">
</div>
<form:form  commandName="comment" cssClass="sky-form comment-style postCmtForm" action="${commentFormUrl}" method="post">
<form:hidden path="itemId"/>
<form:hidden path="itemType"/>

	<fieldset>
		<security:authorize access="!isAuthenticated()">
		<div class="row sky-space-30">
			<div class="col-md-6">
				<div class="formItem">
					<form:input path="anonymous_name"  placeholder="Name" cssClass="form-control" minlength="2" required="required"/>
				</div>
			</div>
			<div class="col-md-6">
				<div class="formItem">
					<form:input path="anonymous_email" placeholder="Email" cssClass="form-control" minlength="3" required="required"/>
				</div>
			</div>
		</div>
		</security:authorize>

		<div class="sky-space-30">
			<div class="formItem">
				<form:textarea path="message" placeholder="Write comment here ..." cssClass="form-control" rows="8" required="required"/>
			</div>
		</div>
		

		<p>
			<button type="submit" class="btn-u" id="pstCmtSbmtBtn">Post Comment</button>
		</p>
	</fieldset>
	
</form:form>
<!-- End Form -->

<hr>
<!-- Blog Comments -->
<c:forEach items="${itemComments}" var="comment">

<div class="row blog-comments margin-bottom-30">
	
	
				<c:choose>
					<c:when test="${not empty comment.profile}">
						
						<div class="row blog-comments margin-bottom-30">
							<div class="col-sm-2 sm-margin-bottom-40">
								<c:choose>
									<c:when test="${not empty comment.profile.profilePicture && fn:length(comment.profile.profilePicture) >= 1}">
										<img src="<c:url value='/uploads/download?key=${comment.profile.profilePicture.iterator().next().keyIdentification}'/>" alt="${comment.profile.profilePicture.iterator().next().altText}">
									
									</c:when>
									<c:otherwise>
										
										<img src="<c:url value='/resources_1_8/img/team/img1-sm.jpg'/>" alt="">
									</c:otherwise>
								</c:choose>
							
								
							</div>
							<div class="col-sm-10">
								<div class="comments-itself">
									<h4>
										<c:out value="${comment.profile.name}" /> <span>5 hours ago / <button class="replyCmt" data-url="<c:out value='replyToComment${comment.id}'/>">Reply</button></span>
									</h4>
									<p><c:out value="${comment.message}" /></p>
								</div>
							</div>
							
						</div>
					
					</c:when>
					
					
					<c:otherwise>
					
					
						<div class="row blog-comments margin-bottom-30">
							<div class="col-sm-2 sm-margin-bottom-40">
								<img src="<c:url value='/resources_1_8/img/team/img1-sm.jpg'/>"
									alt="">
							</div>
							<div class="col-sm-10">
								<div class="comments-itself">
									<h4>
										<c:out value="${comment.anonymous_name}" /> <span>5 hours ago / <button class="replyCmt" data-url="<c:out value='replyToComment${comment.id}'/>">Reply</button></span>
									</h4>
									<p><c:out value="${comment.message}" /></p>
								</div>
							</div>
						</div>
						
					</c:otherwise>
				
				</c:choose>
				
				
				<!-- Reply Blog Comments -->
					<div class="row blog-comments blog-comments-reply margin-bottom-30" style="display:none;" id="<c:out value='replyToComment${comment.id}'/>">
						<div class="col-sm-2 sm-margin-bottom-40">
							<img src="<c:url value='/resources_1_8/img/team/img3-sm.jpg'/>"
								alt="">
						</div>
						<div class="col-sm-10">
							<div class="comments-itself">
								<form:form  commandName="comment" cssClass="sky-form comment-style postCmtForm" action="${commentFormUrl}" method="post" id="replyCommentForm${comment.id}">
									<form:hidden path="itemId"/>
									<form:hidden path="itemType"/>
									<form:hidden path="originalComment.id" value="${comment.id}"/>
										<fieldset>
										
											
										
											<security:authorize access="!isAuthenticated()">
											<div class="row sky-space-30">
												<div class="col-md-6">
													<div class="formItem">
														<form:input path="anonymous_name"  placeholder="Name" cssClass="form-control" minlength="2" required="required"/>
													</div>
												</div>
												<div class="col-md-6">
													<div class="formItem">
														<form:input path="anonymous_email" placeholder="Email" cssClass="form-control" minlength="3" required="required"/>
													</div>
												</div>
											</div>
											</security:authorize>
								
											<div class="sky-space-30">
												<div class="formItem">
													<form:textarea path="message" placeholder="Write comment here ..." cssClass="form-control" rows="8" required="required"/>
												</div>
											</div>
											
								
											<p>
												<button type="submit" class="btn-u" id="pstCmtSbmtBtn${comment.id}">Post Comment</button>
											</p>
										</fieldset>
									
								</form:form>
							</div>
						</div>
					</div>
				<!-- Reply End Blog Comments -->
				
				<c:forEach items="${comment.replies}" var="reply">
				 	<!-- Reply Blog Comments -->
				 	
				 	
				 	
						<div class="row blog-comments blog-comments-reply margin-bottom-30">
							<div class="col-sm-2 sm-margin-bottom-40">
								
								<c:choose>
							 		<c:when test="${not empty reply.profile}">
							 			<c:choose>
							 				<c:when test="${not empty reply.profile.profilePicture && fn:length(reply.profile.profilePicture) >= 1}">
							 					<img src="<c:url value='/uploads/download?key=${reply.profile.profilePicture.iterator().next().keyIdentification}'/>" alt="${reply.profile.profilePicture.iterator().next().altText}">
							 					
						 					</c:when>
						 					<c:otherwise>
						 						<img src="<c:url value='/resources_1_8/img/team/img1-sm.jpg'/>" alt="">
						 					</c:otherwise>
							 			</c:choose>
							 		
							 		</c:when>
							 		
							 		<c:otherwise>
							 			<img src="<c:url value='/resources_1_8/img/team/img1-sm.jpg'/>" alt="">
							 		</c:otherwise>
							 	</c:choose>
								
							</div>
							<div class="col-sm-10">
								<div class="comments-itself">
									<h4>
										<c:choose>
											<c:when test="${not empty reply.profile}">
												<c:out value="${reply.profile.name}" />
											</c:when>
											<c:otherwise>
												<c:out value="${reply.anonymous_name}"/>
											</c:otherwise>
										</c:choose>
									
										
										<span>6 hours ago </span>
									</h4>
									<p><c:out value="${reply.message}"/></p>
								</div>
							</div>
						</div>
						<!-- Reply End Blog Comments -->
				</c:forEach>
				
				
				
				
			
	
</div>
</c:forEach>


<!-- End Blog Comments -->





<script>


	
	//Submit the comment through ajax
	
	$(document).ready(function(){
		
		$("#noCmtsDiv").html("${noCmts}");
		$("#noLikesDiv").html("${noLikes}");
		$("#noSharesDiv").html("${noShares}");
		
		var getCommentsUrl = '${getCommentsUrl}';
		
		//Validate
		
		$(".postCmtForm").validate(
				{	
					rules : {
						anonymous_name: {
							required : true,
							minlength : 2,
						},
						anonymous_email: {
							required : true,
							email : true,
						},
						message: {
							required : true
						},
					},
					highlight:function(element){
						$(element).closest(".form-item").removeClass('has-success').addClass('has-error')
					},
					unhighlight:function(element){
						$(element).closest(".form-item").removeClass('has-error').addClass('has-success')
					},
					messages :{
						anonymous_name : {
							required : "Name is required",
							minlength : "Name must be minimum 2 characters"
						},
						anonymous_email : {
							required : "Email is required",
							minlength : "Email must be minimum 3 characters"
						},
						message : {
							required : "Comment is required"
						}
					}
				}
			);
		
		
		$(".postCmtForm").on("submit", function(e){
			e.preventDefault();
			
			var $form = $(this);
			
			if($form.valid()){
			
				$.ajax({
					type: "POST",
					url: "${commentFormUrl}",
					data: $form.serialize(),
					dataType: "json",
					success: function(postCommentReturnValue){
						//Get the html and put it where it goes
						
						
						if(postCommentReturnValue.code == 1){
							//Reload the comment section through another ajax section
							
							$("#commentingSection").html("");
							$("#commentingSection").addClass("loader-256-gray");
							
							$.ajax({
						          type: "GET",
						          url: getCommentsUrl,
						          dataType : "html",
						          beforeSend:function(xhr){
						  	 	         xhr.setRequestHeader(header, token)
					  	 	      },
						          success: function(html){
						        	  
						        	  
						        	 
						        	  setTimeout(function() {
						        		  $("#commentingSection").html(html);
						        		  $("#CmtMsg").html('<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button><i class="rounded-x fa fa-check"></i>'+postCommentReturnValue.message);
							        	  $("#CmtMsg").addClass("alert alert-success");
							        	  $("#CmtMsg").show();
						        		  $("#commentingSection").removeClass("loader-256-gray");
						        	  }, 500);
						        	  
						        	  
						          },
						          error: function(){
						        	  appendDialogMsgToBody("There was an error reloading the comment section.");
						          }
							 });
							
							
						}else{
							appendDialogMsgToBody("Failed to post the comments.");
						}
					},
				 	error: function(){
				 		appendDialogMsgToBody("There was an error posting the comment.");
	               }
				});
				}
				
		});
		
		
		$("#likePostForm").on("submit", function(e){
			e.preventDefault();
			
			var $form = $(this);
			
			if($form.valid()){
			
				$.ajax({
					type: "POST",
					url: "${likeFormUrl}",
					data: $form.serialize(),
					dataType: "json",
					beforeSend:function(xhr){
		  	 	         xhr.setRequestHeader(header, token)
	  	 	      	},
					success: function(likeReturnValue){
						//Get the html and put it where it goes
						
						
						if(likeReturnValue.code == 1){
							//Reload the comment section through another ajax section
							
							$("#commentingSection").html("");
							$("#commentingSection").addClass("loader-256-gray");
							
							$.ajax({
						          type: "GET",
						          url: getCommentsUrl,
						          dataType : "html",
						          success: function(html){
						        	  
						        	  
						        	 
						        	  setTimeout(function() {
						        		  $("#commentingSection").html(html);
						        		  $("#CmtMsg").html('<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button><i class="rounded-x fa fa-check"></i>'+likeReturnValue.message);
							        	  $("#CmtMsg").addClass("alert alert-success");
							        	  $("#CmtMsg").show();
						        		  $("#commentingSection").removeClass("loader-256-gray");
						        	  }, 500);
						        	  
						        	  
						          },
						          error: function(){
						        	  appendDialogMsgToBody("There was an error reloading the like section.");
						          }
							 });
							
							
						}else if(likeReturnValue.code == 2){
							appendDialogMsgToBody(likeReturnValue.message);
						}else{
							appendDialogMsgToBody("Failed to like the post.");
						}
					},
				 	error: function(){
				 		appendDialogMsgToBody("There was an error liking the post.");
	               }
				});
				}
				
			});
		
		
		$("#sharePostForm").on("submit", function(e){
			e.preventDefault();
			
			var $form = $(this);
			
			if($form.valid()){
			
				$.ajax({
					type: "POST",
					url: "${shareFormUrl}",
					data: $form.serialize(),
					dataType: "json",
					beforeSend:function(xhr){
		  	 	         xhr.setRequestHeader(header, token)
	  	 	        },
					success: function(likeReturnValue){
						//Get the html and put it where it goes
						
						
						if(likeReturnValue.code == 1){
							//Reload the comment section through another ajax section
							
							$("#commentingSection").html("");
							$("#commentingSection").addClass("loader-256-gray");
							
							$.ajax({
						          type: "GET",
						          url: getCommentsUrl,
						          dataType : "html",
						          success: function(html){
						        	  
						        	  
						        	 
						        	  setTimeout(function() {
						        		  $("#commentingSection").html(html);
						        		  $("#CmtMsg").html('<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button><i class="rounded-x fa fa-check"></i>'+likeReturnValue.message);
							        	  $("#CmtMsg").addClass("alert alert-success");
							        	  $("#CmtMsg").show();
						        		  $("#commentingSection").removeClass("loader-256-gray");
						        	  }, 500);
						        	  
						        	  
						          },
						          error: function(){
						        	  appendDialogMsgToBody("There was an error reloading the shares section.");
						          }
							 });
							
							
						}else if(likeReturnValue.code == 2){
							appendDialogMsgToBody(likeReturnValue.message);
						}else{
							appendDialogMsgToBody("Failed to share the post.");
						}
					},
				 	error: function(){
				 		appendDialogMsgToBody("There was an error sharing the post.");
	               }
				});
				}
				
			});
		
		
		
		
		
		$(".replyCmt").on("click", function(e){
			var _showCmpnt = $(this).attr("data-url");
			//var _commentId = _showCmpnt.replace("replyToComment", "");
			$("#"+_showCmpnt).show();
		/* 	var _cmtFormId = replyCommentForm+_commentId;
			$("#"+_cmtFormId+" input[name=name]").val('Hello World!'); */

			//Assign values to form
			
		});
		
		
	});
	

function appendDialogMsgToBody(msg){
	
	$('<div></div>').appendTo('body')
	  .html('<div><h6>'+msg+'</h6></div>')
	  .dialog({
	      modal: true, title: 'message', zIndex: 10000, autoOpen: true,
	      width: 'auto', resizable: false,
	      buttons: {
	          Close: function () {
	        	  $(this).dialog("close");
	        	  
	          },
	      },
	      close: function (event, ui) {
	          $(this).remove();
	      }
	});
}	
</script>