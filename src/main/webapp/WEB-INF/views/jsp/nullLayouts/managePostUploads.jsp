<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<c:url var="post_url" value="/posts/addSimple" />

<c:url var="embeddedForm" value="/uploads/embeddedMediaForm" />

<c:url var="embeddedMediaTab" value="/uploads/embeddedMedia/${uuid}?type=${type}" />
<c:url var="savedMediaTab" value="/uploads/savedMedia/${uuid}?type=${type}" />
<c:url var="newMediaTab" value="/uploads/newMedia/${uuid}?type=${type}" />


<c:set var="postUuid" value="${uuid}" />
<div class="tab-v2">


	<ul class="nav nav-tabs">
		<li class="active"><a class="initialactive tabToload" href="#newMedia" data-toggle="tab" data-url="${newMediaTab}"><spring:message
					code="label.uploads.manage.tab1.heading" /></a></li>
		<li><a href="#savedMedia" data-toggle="tab" class="tabToload"
			data-url="${savedMediaTab}" id="redirectTab"><spring:message
					code="label.uploads.manage.tab2.heading" /></a></li>
		<li><a href="#embeddedMedia" data-toggle="tab" class="tabToload"
			data-url="${embeddedMediaTab}"><spring:message
					code="label.uploads.manage.tab3.heading" /></a></li>

	</ul>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="newMedia"></div>
		<div class="tab-pane fade in" id="savedMedia"></div>

		<div class="tab-pane fade in" id="embeddedMedia"></div>

	</div>

</div>

<script type="text/javascript">

var embedded_form_url = '${embeddedForm}';
var savedMedia_form_url = '${savedMediaTab}';

	$(document).ready(function() {
		$("#modalholder .modal-hrefLink").attr('href', "");
		
		var initialTab = $( ".initialactive" );
		var initialurl = initialTab.attr('data-url');
		
		var initialhref =  $( ".initialactive" ).attr('href');

		$(initialhref).load(initialurl, function(result){
			  $('.tab-content').removeClass('loader');
			  initialTab.tab('show');
		});
		

		var loadurl = $("#redirectTab").attr("data-url");
		var loadhref = $("#redirectTab")[0].hash;
		var loadpane = $("#redirectTab");

		$('.tabToload').click(function(e) {
			e.preventDefault();

			$('.tab-content').addClass('loader');

			var url = $(this).attr("data-url");

			var href = this.hash;
			var pane = $(this);

			$(href).load(url, function(result) {
				$('.tab-content').removeClass('loader'); 
				pane.tab('show');
			});
		});

	});
</script>