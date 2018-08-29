<%@ include file="../../layout/taglib.jsp"%>

<c:url var="uploadLink" value="/uploads/post?type=${type}" />
<c:url var="uploadDeleteLink" value="/uploads/profileDelete" />
<c:url var="embeddedMediaTab" value="/uploads/embeddedMedia/${uuid}?type=${type}" />
<c:url var="savedMediaTab" value="/uploads/savedMedia/${uuid}?type=${type}" />

<c:set var="postUuid" value="${uuid}" />

<h4>
	<spring:message code="label.posts.add.upload.manage.heading" />
</h4>

<div class="row" id="uploadDelegationDropzone">



	<div class="panel panel-warning">
		<div class="panel-body">
			<p>
				<spring:message code="label.posts.addImage.explanation" />
			</p>
		</div>
	</div>

	<!--    ************************************************************************************************************************************* -->

	<div class="row">

		<div class="col-lg-7" id="adderLink">
			<!-- The fileinput-button span is used to style the file input field as button -->
			<span class="btn btn-success fileinput-button"> <i
				class="glyphicon glyphicon-plus"></i> <span><spring:message
						code="label.posts.add.addImage" /></span>
			</span>

		</div>

		<!--    ************************************************************************************************************************************* -->

		<div class="col-lg-5">
			<!-- The global file processing state -->
			<span class="fileupload-process">
				<div id="total-progress" class="progress progress-striped active"
					role="progressbar" aria-valuemin="0" aria-valuemax="100"
					aria-valuenow="0">
					<div class="progress-bar progress-bar-success" style="width: 0%;"
						data-dz-uploadprogress></div>
				</div>
			</span>
		</div>

		<!--    ************************************************************************************************************************************* -->

	</div>

	<div class="table table-striped" class="files" id="previews">

		<div id="delegationUploadSpace" class="file-row">
			<!-- This is used as the file preview template -->
			<div>
				<span class="preview"><img data-dz-thumbnail /></span>
			</div>

			<div>
				<p class="name" data-dz-name></p>
				<strong class="error text-danger" data-dz-errormessage></strong>
			</div>

			<div>
				<p class="size" data-dz-size></p>
				<div class="progress progress-striped active" role="progressbar"
					aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
					<div class="progress-bar progress-bar-success" style="width: 0%;"
						data-dz-uploadprogress></div>
				</div>
			</div>

			<div>

				<button data-dz-remove class="btn btn-danger delete">
					<i class="glyphicon glyphicon-trash"></i> <span><spring:message
							code="label.posts.add.addImage.delete" /></span>
				</button>
			</div>
		</div>

	</div>

</div>
<!--    ************************************************************************************************************************************* -->

<script type="text/javascript" src="<c:url value='/js/dropzone-4.0.0/dist/dropzone.js'/>"></script>
<script>
	Dropzone.autoDiscover = false;

	var uploadedId = "";

	var upload_target_url = '${uploadLink}';
	var upload_delete_target_url = '${uploadDeleteLink}';

	var embedded_form_url = '${embeddedForm}';
	var savedMedia_form_url = '${savedMediaTab}';

	var previewNode = document.querySelector("#delegationUploadSpace");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);

	var loadurl = $("#redirectTab").attr("data-url");
	var loadhref = $("#redirectTab")[0].hash;
	var loadpane = $("#redirectTab");

	var myDropzone = new Dropzone("div#uploadDelegationDropzone", { // Make the whole body a dropzone
		url : upload_target_url, // Set the url,
		method : "post",
		thumbnailWidth : 80,
		thumbnailHeight : 80,
		parallelUploads : 20,
		maxFilesize : 1,
		maxFiles : 1,
		maxfilesexceeded : function(file) {
			this.removeAllFiles();

		},
		acceptedFiles : "image/*, .pdf, .doc, .docx",
		accept : function(file, done) {
		},
		previewTemplate : previewTemplate,
		autoQueue : false, // Make sure the files aren't queued until manually added
		previewsContainer : "#previews", // Define the container to display the previews
		clickable : ".fileinput-button", // Define the element that should be used as click trigger to select files.
		success : function(file, returnValue) {

			if (returnValue.code == 1) {
				/* $("#adderLink").hide(); */
				uploadedId = returnValue.extra;
				var message = returnValue.message.replace(/ /g, "%20");
				$(loadhref).load(loadurl + "?message=" + message,
						function(result) {
							loadpane.tab('show');
						});
			} else {
				alert(response.message);
				myDropzone.removeFile(file);
			}

		},
		sending : function(file, xhr, formData) {
			formData.append("uuid", "${postUuid}");
			xhr.setRequestHeader(header, token);
		},
		removedfile : function(file) {
			$.ajax({
				type : 'POST',
				url : upload_delete_target_url,
				data : {
					type : 1
				},
				success : function(file, response) {
					$("#adderLink").show();
					uploadedId = "";
				},
			});
			var _ref;
			return (_ref = file.previewElement) != null ? _ref.parentNode
					.removeChild(file.previewElement) : void 0;
		}
	});

	myDropzone.on("addedfile", function(file) {
		myDropzone.processFile(file);
	});

	// Update the total progress bar
	myDropzone
			.on(
					"totaluploadprogress",
					function(progress) {
						document.querySelector("#total-progress .progress-bar").style.width = progress
								+ "%";
					});

	myDropzone.on("sending", function(file) {
		// Show the total progress bar when upload starts
		document.querySelector("#total-progress").style.opacity = "1";
		// And disable the start button
		//   file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
	});

	// Hide the total progress bar when nothing's uploading anymore
	myDropzone.on("queuecomplete", function(progress) {
		document.querySelector("#total-progress").style.opacity = "0";
	});
	
</script>
