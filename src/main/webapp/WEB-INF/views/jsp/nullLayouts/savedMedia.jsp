<%@ include file="../../layout/taglib.jsp"%>

<c:url var="savedMediaFormUrl" value="/uploads/savedMedia?type=${type}" />

<c:choose>
	<c:when test="${not empty  savedUploads or not empty profileSavedUploads}">
		
		<div class="row" id="saveCommunication" style="display: hidden;">
		
		</div>
		
		<div id="formContainer">
		
		<form:form commandName="savedMedia" cssClass="sky-form savedMediaForm" method="post" action="${savedMediaFormUrl}">
		<form:hidden path="uuid"/>
		<header>Choose Media to add to post</header>
		
			<c:if test="${message != null}">
						<div class="alert alert-success">
							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
							<c:out value="${message}"></c:out>
						</div>
			</c:if>
			
			<c:if test="${not empty  uploads}">
				<section>
						
						
						
							<div class="row">
							<c:forEach items="${uploads}" var="savedUpload" varStatus="status">
								
									<div class="col-sm-4 sm-margin-bottom-30 image_block">
										<div class=" image_block_container">
											<div class="image_block_inner">
												<div class=""><form:checkbox path="uploads" value="${savedUpload.id}"/></div>
												<img class="img-responsive" src="<c:url value='/uploads/download?key=${savedUpload.keyIdentification}' />" alt="${savedUpload.altText}">
											</div>
											<div class="title"><c:out value="${savedUpload.filename}" /></div>
										
											  
										</div>
									</div>
									<c:if test="${status.count % 3 == 0}">
									</div>
									<div class="row">
									</c:if>
								
							</c:forEach>
							</div>
				

						<%-- <form:checkboxes items="${savedUploads}" path="uploads" element="label class='checkbox'"/>  --%>
				</section>
			</c:if>
		
		
		
		
		
			
			<c:if test="${not empty  profileUploads}">
			
				<header>Old Media</header>
				
					<section>
					
<%-- 							<form:checkboxes items="${profileSavedUploads}" path="oldUploads" element="label class=''"/> --%>
							<div class="row">
							<c:forEach items="${profileUploads}" var="profileSavedUpload" varStatus="status">
								
									<div class="col-sm-4 sm-margin-bottom-30 image_block">
										<div class=" image_block_container">
											<div class="image_block_inner">
												<div class=""><form:checkbox path="oldUploads" value="${profileSavedUpload.id}"/></div>
												<img class="img-responsive" src="<c:url value='/uploads/download?key=${profileSavedUpload.keyIdentification}' />" alt="${profileSavedUpload.altText}">
											</div>
											<div class="title"><c:out value="${profileSavedUpload.filename}" /></div>
										
											  
										</div>
									</div>
									<c:if test="${status.count % 3 == 0}">
									</div>
									<div class="row">
									</c:if>
								
							</c:forEach>
							</div>
							
							<%-- <form:checkboxes items="${savedUploads}" path="uploads" element="label class='checkbox'"/>  --%>
					</section>
					
			</c:if>
	
			
		
			
				<footer>
					<button type="submit" class="button btn-u btn-u-green" id="saveMediaBtn"><spring:message code="label.save"/></button>
				</footer>
				
				
					
			
			
		</form:form>
		</div>
		
		</c:when>
	<c:otherwise>
		<h3><spring:message code="label.uploads.manage.noSaved" /></h3>
	</c:otherwise>
</c:choose>

<script>

$(document).ready(function(){
	
	
	$('#formContainer').find(':checkbox').each(function(){
		
		if(this.checked){
			$(this).parent().parent().parent()[0].style.border = '4px solid #38A';
		}
    });
	
	$('.image_block input[type="checkbox"]').on("click", function(e){
		
		if((this).checked){
			$(this).parent().parent().parent()[0].style.border = '4px solid #38A';
		}else{
			$(this).parent().parent().parent()[0].style.border = '1px solid #ccc';
		}
		
		
	});
	
	
	$("#saveMediaBtn").click(function(e){
	    e.preventDefault();
	    
	    var savedMedia_form_url ="${savedMediaFormUrl}";
		

	    $.getJSON(checkusersessionlink, function(returnValue){
	    	if(returnValue){		    	
	    			if($(".savedMediaForm").valid()){
	    	    	
	    	    		$.ajax({
		  	                  type: "POST",
		  	                  url: savedMedia_form_url,
		  	                  data: $('.savedMediaForm').serialize(),
		  	                  success: function(returnValue){
		  	                    //location.reload(true);
		  	                    
		  	                    if(returnValue.code == 1){
		  	                    	
		  	                    	$("#saveCommunication").attr("class", "row alert alert-success");
		  	                    	
		  	                    }else{
		  	                    	$("#saveCommunication").attr("class", "row alert alert-danger");
		  	                    }
		  	                    var _closeButton = '<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>';
		  	                    var _message =_closeButton+returnValue.message+ " Click on the close button to exit.";
		  	                 	 $("#saveCommunication").html(_message);
		  	                 	$("#saveCommunication").show();
		  	                    
		  	                    //Reload Saved Media Tab and redirect to Saved Media
		  	                  },
		  	                  error: function(){
		  	                      alert("Failed to save!");
		  	                  }
	     				 });
	    	    	}else{
	    	    		alert("Please verify your data before saving.");
	    	    	}
	    	    
			  }else{
				  	loginReferedFromSaveOfModalWindow = true;

					//Hide the modal to show the login modal
					$("#modalholder #modalAdd").modal('hide');
				  	
				  	$("#loginmodalholder .modal-body").html('');
				  	$("#loginmodalholder .modal-body").addClass('loader');
					$("#loginmodalholder #dialog-login").modal('show');

				  $.get(dialogloginlink, function(html){
				    $("#loginmodalholder .modal-hrefLink").attr('href', dialogloginlink);
				    $("#loginmodalholder .modal-body").removeClass('loader');
				    $("#loginmodalholder .modal-body").html(html);
				  });

			  }
	    });
	    
	    
	    
	    });
});

</script>