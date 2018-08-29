<%@ include file="../../layout/taglib.jsp"%>

<div class="panel panel-grey margin-bottom-40">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-user"></i>List of Users</h3>
		</div>
		<div class="panel-body">
		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
						<th>Roles</th>
						<th>Profiles</th>
					</tr>
				</thead>
				<tbody>
				
				
				
				<tr>
					<td>
						${user.id}
					</td>
					<td>
						${user.first_name}
					</td>
					<td>
						${user.last_name}
					</td>
					
					<td>
						${user.username}
					</td>
					
					<td>	
						<ul class="list">
						<c:forEach items="${user.roles}" var="role">
							<li><c:out value="${role.name}"></c:out></li>
						</c:forEach>
						</ul>
					</td>
					<td>
						<ul class="list">
						<c:forEach items="${user.profiles}" var="profile">
							<li><c:out value="${profile.name}"></c:out></li>
						</c:forEach>
						</ul>
					</td>
				</tr>
				
				</tbody>
			</table>
			
		</div>
		
	</div>