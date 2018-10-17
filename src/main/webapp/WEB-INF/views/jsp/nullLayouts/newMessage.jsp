<%@ include file="../../layout/taglib.jsp"%>
<c:url var="addMsgUrl" value="/blog/messages/doAdd" />
<h2>Compose Message</h2>
<form:form commandName="message" cssClass="sky-form" action="${addMsgUrl}">

	<fieldset>
		<section>
			<label class="label">To </label> 
			<label class="textarea textarea-expandable"> 
				<textarea name="to"></textarea>
			</label>
		</section>

		<section>
			<label class="label">Message <form:errors path="message" /></label> <label
				class="textarea textarea-expandable"> <form:textarea
					path="message" rows="10" />
			</label>
		</section>


	</fieldset>



</form:form>