<%@ include file="../../layout/taglib.jsp"%>
<c:url var="homeTabUrl" value="/profile/homeTab" />
<c:url var="profileTabUrl" value="/profile/profileTab" />
<c:url var="messagesTabUrl" value="/profile/messagesTab" />
<c:url var="settingsTabUrl" value="/profile/settingsTab" />
<c:url var="profileSettingsURL" value="/profile/settings" />
<!--Profile Body-->

<div class="" style="margin-left: 20px;">
	<div class="row">

		<!-- Tab v1 -->
		<div class="tab-v2">
			<ul class="nav nav-tabs" id="rowTab">
				<li class="active"><a href="#home" class="initialactive" data-toggle="tab" data-url="${homeTabUrl}"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="#profile" data-toggle="tab" data-url="${profileTabUrl}"><i class="fa fa-cloud"></i> Profile</a></li>
				<li><a href="#messages" data-toggle="tab" data-url="${messagesTabUrl}"><i class="fa fa-comments"></i> Messages</a></li>
				<li><a href="#settingsR" data-toggle="tab" data-url="${profileSettingsURL}"><i class="fa fa-gear"></i> Settings - React</a></li>
				<li><a href="#settings" data-toggle="tab" data-url="${settingsTabUrl}"><i class="fa fa-gear"></i> Settings</a></li>
			</ul>
			<div class="tab-content">
				<div class="profile-edit tab-pane fade in active" id="home">
					<div class="row">
						
					</div>
				</div>
				<div class="profile-edit tab-pane fade in" id="profile">
					
				</div>
				<div class="profile-edit tab-pane fade in" id="messages">
					
				</div>
				<div class="profile-edit tab-pane fade in" id="settingsR">
				
					<div id="settingsReactContent"></div>
					
				</div>
				
				<div class="profile-edit tab-pane fade in" id="settings">
					
				</div>
			</div>
		</div>
		<!-- End Tab v1 -->

	</div>


</div>
<!--End Profile Body-->

<script type="text/babel">
$(document).ready(function(){
	
	var initialTab = $( "a[class='initialactive']" );
	var initialurl = initialTab.attr('data-url');
	var initialhref =  $( "a[class='initialactive']" ).attr('href');
	
	$(initialhref).load(initialurl, function(result){
		  initialTab.tab('show');
	});
	
	  
});



$('#rowTab a').click(function (e) {
  	e.preventDefault();

  	$('.tab-content').addClass('loader');

 	var url = $(this).attr("data-url");
  	var href = this.hash;
  	var pane = $(this);
  	
  	if(href == "#settingsR"){
  		$('.tab-content').removeClass('loader');
  		pane.tab('show');
  		
  		


	  		var CommentBox = React.createClass({
	  		  render: function() {
	  		    return (
	  		      <div className="commentBox">
	  		        Hello, world! I am a CommentBox.
	  		      </div>
	  		    );
	  		  }
	  		});
	  		ReactDOM.render(
	  		  <CommentBox />,
	  		  document.getElementById('settingsReactContent')
	  		);
  		
  		
  	}else{
  		$(href).load(url,function(result){
  	  		$('.tab-content').removeClass('loader'); 
  		    pane.tab('show');
  		});
  	}
  	

  	
});
</script>






