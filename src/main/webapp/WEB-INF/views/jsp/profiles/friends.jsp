<%@ include file="../../layout/taglib.jsp"%>

<c:url var="baseUrl" value="/profiles/friends?page=" />
<tiles:putAttribute name="basePaginationUrl" value="${baseUrl}" cascade="true"/>

<c:url var="allBucketUrl" value="/profile/profileBucketNetworkAjax/1/" />
<c:url var="myBucketUrl" value="/profile/profileBucketNetworkAjax/2/" />
<c:url var="includeBucketUrl" value="/profile/profileBucketNetworkAjax/3/" />
<c:url var="mutualBucketUrl" value="/profile/profileBucketNetworkAjax/4/" />



<h1><c:out value='${actingProfile.name}'/> - Network Bucket</h1>
<div class="clearfix margin-bottom-20"><hr></div>

<div class="tab-v2">
	<ul class="nav nav-tabs" id="rowTab">
		<li class="active"><a href="#allBucket" data-toggle="tab" aria-expanded="true" class="initialactive" data-url="${allBucketUrl}">All</a></li>
		<li><a href="#myBucket" data-toggle="tab" aria-expanded="true" data-url="${myBucketUrl}">My Bucket</a></li>
		<li class=""><a href="#includeMeBucket" data-toggle="tab" aria-expanded="true" data-url="${includeBucketUrl}">Include Me Bucket</a></li>
		<li class=""><a href="#mutualBucket" data-toggle="tab" aria-expanded="false" data-url="${mutualBucketUrl}">Mutual Bucket</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade active in" id="allBucket">
			
		</div>
		<div class="tab-pane fade" id="myBucket">
			
		</div>
		
		<div class="tab-pane fade" id="includeMeBucket">
			
		</div>
		
		<div class="tab-pane fade" id="mutualBucket">
			
		</div>
	</div>
</div>

<script type="text/javascript">
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
  	
  	
	$(href).load(url,function(result){
 	  	$('.tab-content').removeClass('loader'); 
 		pane.tab('show');
	});
  	
});


</script>	
	  