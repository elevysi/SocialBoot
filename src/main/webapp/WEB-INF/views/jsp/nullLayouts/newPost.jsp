<%@ include file="../../layout/taglib.jsp"%>
<c:url var="addPostUrl" value="/posts/addModal" />
<h2>New Post</h2>
<form:form commandName="post" cssClass="sky-form modalForm" action="${addPostUrl}" method="post">


	<fieldset>
		<section>
			<label class="label">Title <form:errors path="title" /></label> <label
				class="input"> <form:input path="title" />
			</label>
		</section>

		<section>
			<label class="label">Post</label> <label
				class="textarea textarea-expandable"> <form:textarea
					path="content" rows="10" />
			</label>
		</section>


	</fieldset>



</form:form>