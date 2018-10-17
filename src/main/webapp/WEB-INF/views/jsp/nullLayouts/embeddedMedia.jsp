<%@ include file="../../layout/taglib.jsp"%>

<c:url var="embeddedMediaFormUrl" value="/uploads/embeddedMediaForm?type=${type}" />
<div class="row" id="saveCommunication"></div>
<form:form commandName="embeddedMedia" cssClass="sky-form embeddedMediaForm" method="post" action="${embeddedMediaFormUrl}">
<form:hidden path="uuid"/>
<header>Embedded Media</header>
<fieldset>
	<div class="row">
	
	<section class="col col-6">
		<label class="label">Type</label>
		<label class="input">
			<form:select path="mediaKind" cssClass="form-control">
				<form:options items="${mediaKinds}" />
			</form:select>
		</label>
	</section>
	
	<section class="col col-6">
		<label class="label">Url</label>
		<label class="input">
			<form:input path="url" cssClass="form-control"/>
		</label>
	</section>

	</div>
</fieldset>	
	
		<footer>
			<button type="submit" class="button btn-u btn-u-green" id="saveEmbedded"><spring:message code="label.save"/></button>
		</footer>
		
		
			
	
	
</form:form>


<script>

$(document).ready(function(){
	$("#saveEmbedded").click(function(e){
	    e.preventDefault();
	    
	    var embedded_form_url ="${embeddedMediaFormUrl}";
	    
	    var loadurl = $("#redirectTab").attr("data-url");
	  	var loadhref = $("#redirectTab")[0].hash;
	  	var loadpane = $("#redirectTab");
		

	    $.getJSON(checkusersessionlink, function(returnValue){
	    	if(returnValue){		    	
	    			if($(".embeddedMediaForm").valid()){
	    	    	
	    	    		$.ajax({
		  	                  type: "POST",
		  	                  url: embedded_form_url,
		  	                  data: $('.embeddedMediaForm').serialize(),
		  	                  success: function(returnValue){
		  	                    //location.reload(true);
		  	                    
		  	                    if(returnValue.code == 1){
		  	                    	var message = returnValue.message.replace(/ /g, "%20");
			  	              	  	$(loadhref).load(loadurl+"?message="+message,function(result){
			  	              	  		loadpane.tab('show');
			  	              		});
		  	                    	
		  	                    }else{
		  	                    	$("#saveCommunication").attr("class", "row alert alert-danger");
		  	                    }
		  	                    
		  	                  	$("#saveCommunication").html(returnValue.message);
		  	                    
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
