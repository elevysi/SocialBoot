<%@ include file="../../layout/taglib.jsp"%>
<%-- <c:url var="uploadLink" value="/profile/picture" />
<form action="${uploadLink}" method="post">
	<input name="image" type="file" /> <input type="submit" value="Upload">
</form> --%>

<form:form method="POST" commandName="fileUpload"	enctype="multipart/form-data">
 
		Upload your file please: 
		
		<form:errors path="file" cssStyle="color: #ff0000;" />
		<form:input path="file" type="file" />
		<input type="submit" value="upload" />
		
</form:form>