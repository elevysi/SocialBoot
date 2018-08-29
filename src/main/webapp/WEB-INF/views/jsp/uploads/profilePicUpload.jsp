<%@ include file="../../layout/taglib.jsp"%>
<c:url var="uploadLink" value="/ui/uploads/profile?type=${type}" />
<c:url var="uploadDeleteLink" value="/ui/uploads/profileDelete" />

<hr>
		
		<div class="row" id="profilePicUploadsaveCommunication" style="display: hidden;"></div>
		
		<c:choose>
		<c:when test="${type == 'profilePicture'}">
		<h3>Edit Profile Picture</h3>
			<c:if test="${actingProfile.profilePicture.iterator().hasNext()}">
				<img class="img-responsive profile-img margin-bottom-20" src="<c:url value='/ui/uploads/download?key=${actingProfile.profilePicture.iterator().next().keyIdentification}'/>" alt="${actingProfile.profilePicture.iterator().next().altText}">
			</c:if>
		</c:when>
		<c:when test="${type == 'coverUpload'}">
		<h3>Edit Cover Picture</h3>
			<c:if test="${actingProfile.coverUploads.iterator().hasNext()}">
				<img class="img-responsive profile-img margin-bottom-20" src="<c:url value='/ui/uploads/download?key=${actingProfile.coverUploads.iterator().next().keyIdentification}'/>" alt="${actingProfile.coverUploads.iterator().next().altText}">
			</c:if>
		</c:when>
		</c:choose>
		
<div class="row" id="uploadDelegationDropzone">
		
		<div class="panel panel-warning">
			  <div class="panel-body">
				    <p>You can upload a file from your computer.</p>
			  </div>
		</div>
		
		<!--    ************************************************************************************************************************************* -->
		
		<div class="row">
	
	      <div class="col-lg-7" id="adderLink">
	        <!-- The fileinput-button span is used to style the file input field as button -->
	        <span class="btn btn-success fileinput-button">
	            <i class="glyphicon glyphicon-plus"></i>
	            <span>Browse new Image</span>
	        </span>
	        
	      </div>
	      
	      <!--    ************************************************************************************************************************************* -->
	
	      <div class="col-lg-5">
	        <!-- The global file processing state -->
	        <span class="fileupload-process">
	          <div id="total-progress" class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
	            <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
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
			        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
			          <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
			        </div>
			    </div>
			    
			    <div>
			      
			      <button data-dz-remove class="btn btn-danger delete">
			        <i class="glyphicon glyphicon-trash"></i>
			        <span>Delete</span>
			      </button>
			    </div>
		  </div>
		
		</div>
		
	</div>
	<!--    ************************************************************************************************************************************* -->
<script type="text/javascript" src="<c:url value='/js/dropzone-4.0.0/dist/dropzone.js'/>"></script>	
<script type="text/javascript">
Dropzone.autoDiscover = false;

var upload_target_url = '${uploadLink}';
var upload_delete_target_url = '${uploadDeleteLink}';

var previewNode = document.querySelector("#delegationUploadSpace");
previewNode.id = "";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);

var myDropzone = new Dropzone("div#uploadDelegationDropzone", { // Make the whole body a dropzone
  url: upload_target_url, // Set the url,
  method : "post",
  data : "type="+1,
  thumbnailWidth: 80,
  thumbnailHeight: 80,
  parallelUploads: 20,
  maxFilesize : 100,
  maxFiles: 1,
  maxfilesexceeded: function(file) {
      this.removeAllFiles();
     
  },
  acceptedFiles : "image/*, .pdf, .doc, .docx",
  accept: function(file, done){},
  previewTemplate: previewTemplate,
  autoQueue: false, // Make sure the files aren't queued until manually added
  previewsContainer: "#previews", // Define the container to display the previews
  clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
  success: function(file, returnValue) {
	  
	  if(returnValue.code == 1){
		  $("#adderLink").hide();
		  $("#profilePicUploadsaveCommunication").attr("class", "row alert alert-success");
	  }else{
		
		$("#profilePicUploadsaveCommunication").attr("class", "row alert alert-danger");
		myDropzone.removeFile(file);
	  }
	  
	  var _closeButton = '<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>';
      var _message =_closeButton+returnValue.message;
      $("#profilePicUploadsaveCommunication").html(_message);
      $("#profilePicUploadsaveCommunication").show();
	  
	},
	sending: function(file, xhr, formData){
		xhr.setRequestHeader(header, token);
		formData.append("type", 1);
	},	
	removedfile: function(file) {
	    $.ajax({
	        type: 'POST',
	        url: upload_delete_target_url,
	        data: {type : 1},
	        beforeSend:function(xhr){
	             xhr.setRequestHeader(header, token);
	        },
	        success: function(file, response) {
	     	   $("#adderLink").show();
	     	},
	    });
		var _ref;
		return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;        
   }
});

myDropzone.on("addedfile", function(file){
	myDropzone.processFile(file);
});




// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
  document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
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