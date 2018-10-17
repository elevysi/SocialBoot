<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>
<c:url var="formActionUrl" value="/admin/users/ajax/edit/${user.id}" />
<c:url var="emailCheckUrl" value="/register/emailRegistered?update=${user.email}" />
<c:url var="usernameCheckUrl" value="/register/usernameAvailable?update=${user.username}" />

	<form:form commandName="user" class="modalForm" action="${formActionUrl}">
		<form:hidden path="id" />
		<div class="form-item">
			<label>First Name <span class="color-red">*</span> <form:errors path="first_name" /></label>
			<form:input path="first_name" cssClass="form-control margin-bottom-20" minlength="3" required="required"/>
		</div>

		<div class="form-item">
			<label>Last Name <span class="color-red">*</span> <form:errors path="last_name" /></label>
			<form:input path="last_name" cssClass="form-control margin-bottom-20" minlength="3" required="required"/>
		</div>

		<div class="form-item">
			<label>Email Address <span class="color-red">*</span> <form:errors path="email" /></label>
			<div class="input-group margin-bottom-20">
				<span class="input-group-addon"> <i class="fa fa-envelope"></i></span>
				<form:input path="email" cssClass="form-control margin-bottom-20" minlength="3" required="required" type="email"/>
				
			</div>
		</div>

		<div class="form-item">
			<label>Username <span class="color-red">*</span> <form:errors path="username" /></label>
			<div class="input-group margin-bottom-20">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<form:input path="username" cssClass="form-control margin-bottom-20" minlength="3" required="required"/>
				
			</div>
		</div>
		
		<div class="form-item">
			<label>Roles <span class="color-red">*</span> <form:errors path="roles" /></label>
				<c:forEach items="${roles}" var="role" varStatus="status">
					<label class="checkbox">
						<form:checkbox path="roles" value="${role.id}"/><i></i><c:out value="${role.name}"/>
					</label>
				</c:forEach>
		</div>
		
	</form:form>


<script>
$(document).ready(function(){
	$(".modalForm").validate(
		{	
			rules :{
				username:{
					required : true,
					minlength : 3,
					remote : {
						url : "${usernameCheckUrl}",
						type : "GET",
						data : {
							username: function(){
								return $("#username").val();
							}
						}
					}
				},
				first_name: {
					required : true,
					minlength : 3
				},
				last_name: {
					required : true,
					minlength : 3
				},
				email: {
					required : true,
					email : true,
					remote : {
						url : "${emailCheckUrl}",
						type : "GET",
						data : {
							email: function(){
								return $("#email").val();
							}
						}
					}
				}
			},
			highlight:function(element){
				$(element).closest(".form-item").removeClass('has-success').addClass('has-error')
			},
			unhighlight:function(element){
				$(element).closest(".form-item").removeClass('has-error').addClass('has-success')
			},
			messages :{
				username : {
					remote : "Such a username already exists"
				}
			}
		}
	);
	
	
});

</script>




