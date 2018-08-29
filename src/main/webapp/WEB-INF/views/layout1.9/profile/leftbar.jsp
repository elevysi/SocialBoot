<%@ include file="../../layout/taglib.jsp"%>
<c:if test="${not empty profile.profilePicture && not empty profile.profilePicture.iterator().hasNext()}">
<img class="img-responsive profile-img margin-bottom-20" src="<c:url value='/ui/uploads/download?key=${profile.profilePicture.iterator().next().keyIdentification}'/>" alt="${profile.profilePicture.iterator().next().altText}">
</c:if>

<div class="margin-bottom-50"></div>

<ul class="list-group sidebar-nav-v1 margin-bottom-40"
	id="sidebar-nav-1">
	<li class="list-group-item"><a href="<spring:url value='/ui/profile/'/>"><i class="fa fa-group"></i> My Bucket</a></li>
	<li class="list-group-item"><a href="<spring:url value='/ui/uploads/profile?type=profilePicture'/>"><i class="fa fa-user"></i>Avatar</a></li>
	<li class="list-group-item"><a href="<spring:url value='/ui/uploads/profile?type=coverUpload'/>"><i class="fa fa-user"></i>Cover</a></li>
	<li class="list-group-item"><a href="<spring:url value='/ui/conversations/messages/'/>"><i class="fa fa-comments"></i> My Messages</a></li>
	<li class="list-group-item"><a href="<spring:url value='/ui/profile/${profile.name}/settings/'/>"><i class="fa fa-cog"></i> My Settings</a></li>
	<li class="list-group-item"><a href="<spring:url value='/ui/profile/updatePassword'/>"><i class="fa fa-cog"></i> Password</a></li>
</ul>

<!--Notification-->

<!--End Notification-->

<div class="margin-bottom-50"></div>

<!--Datepicker-->
<form action="#" id="sky-form2" class="sky-form">
	<div id="inline-start"></div>
</form>
<!--End Datepicker-->