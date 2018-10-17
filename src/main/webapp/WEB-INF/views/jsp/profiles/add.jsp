<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<c:url var="addProfile" value="/profile/add/" />

<c:url var="uploadLink" value="/uploads/post" />
<c:url var="uploadDeleteLink" value="/uploads/profileDelete" />
<c:url var ="tinymceCss" value='/css/tinymce.css'/>



<form:form commandName="profile" cssClass="sky-form profileForm" method="post" action="${addProfile}">

	<header>Add Profile </header>		
	<fieldset>
	
	<div class="row">
		<a class="btn-u btn-u-green"  href="<spring:url value='/uploads/profile/' />"><i class="glyphicon glyphicon-file"></i>Profile Picture</a>
		<a class="btn-u btn-u-green"  href="<spring:url value='/profiles/add/' />"><i class="glyphicon glyphicon-file"></i>Add new Profile</a>
	</div>
	
	<hr>
	
	<div class="form-item">
		<section>
			<label class="label">Choose Type <form:errors path="profileType" /></label> <label class="select">
			<form:select path="profileType.id">
				<form:option  value="">--Select one--</form:option>
				<form:options items="${profileTypes}" itemValue="id" itemLabel="name"/>
				<form:errors path="profileType"/>
			</form:select>
			
			</label>
		</section>
	</div>
	
	
  
	<div class="form-item">
		<section>
			<label class="label">Name <span class="color-red">*</span> <form:errors path="name" /></label> <label class="input"> <form:input
					path="name" />
			</label>
		</section>
	</div>
	
	<div class="form-item">
		<section>
			<label class="label">Title <span class="color-red">*</span> <form:errors path="title" /></label> <label class="input"> <form:input
					path="title" />
			</label>
		</section>
	</div>

		<section class="form-item">
			<label class="label">Description</label> <label class="textarea">
				<form:textarea path="description" cssClass="editorTextarea"/>
				
			</label>
			<div class="note">
				<strong>Note:</strong> A small description or a subtitle to your profile
			</div>
		</section>


	</fieldset>
	<footer>
		<button class="btn-u" type="submit" name="action" value="Save">Save</button>
		
		
	</footer>



</form:form>

<!-- TinyMCE -->
<script type="text/javascript" src="<c:url value='/js/tinymce_4.4.1/tinymce/js/tinymce/tinymce.min.js'/>"></script>		
<script type="text/javascript">




tinymce.init({
	  mode : "specific_textareas",
      editor_selector : "editorTextarea",
	  height: 500,
	  theme: 'modern',
	  content_css : "${tinymceCss}",
	  plugins: [
	    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
	    'searchreplace wordcount sh4tinymce visualblocks visualchars code fullscreen',
	    'insertdatetime media nonbreaking save table contextmenu directionality',
	    'emoticons template paste textcolor colorpicker textpattern imagetools'
	  ],
	  toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	  toolbar2: 'print preview media | forecolor backcolor emoticons | sh4tinymce',
	  image_advtab: true,
	  templates: [
	    { title: 'Test template 1', content: 'Test 1' },
	    { title: 'Test template 2', content: 'Test 2' }
	  ]
	  
});

/**
 * content_css: [
         	    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
        	    '//www.tinymce.com/css/codepen.min.css'
        	  ]
 */






$(document).ready(function(){
	$(".profileForm").validate(
		{	
			rules : {
				name: {
					required : true,
					minlength : 2
				},
				title: {
					minlength : 2
				},
				description: {
					minlength : 2
				},
			},
			highlight:function(element){
				$(element).closest(".form-item").removeClass('has-success').addClass('has-error')
			},
			unhighlight:function(element){
				$(element).closest(".form-item").removeClass('has-error').addClass('has-success')
			}
		}
	);
	
	
	
	
});

</script>

