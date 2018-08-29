<%@ include file="../../layout/taglib.jsp"%>
<div class="tab-v1" ng-app="confettiApp">
	<ul class="nav nav-justified nav-tabs">
		<li><a data-toggle="tab" href="#profileSettings">Edit Profile</a></li>
		<li><a data-toggle="tab" href="#password">Change Password</a></li>
		<li><a data-toggle="tab" href="#payment">Payment Options</a></li>
		<li><a data-toggle="tab" href="#notSettings">Notification
				Settings</a></li>
	</ul>
	<div class="tab-content" ng-controller="profileController">
	
		<div ng-view></div>
	
	
		<div id="profileSettings" class="profile-edit tab-pane fade in active">
			<h2 class="heading-md">Manage your Name, ID and Email Addresses.</h2>
			<p>Below are the name and email addresses on file for your
				account.</p>
			</br>
			<dl class="dl-horizontal">
				<dt>
					<strong>Name</strong>
				</dt>
				<dd>
					<c:out value="${user.first_name}"/> <c:out value="${user.last_name}"/> <span> <a class="pull-right" href="#"> <i class="fa fa-pencil"></i>
					</a>
					</span>
				</dd>
				<hr>
				<dt>
					<strong>Username</strong>
				</dt>
				<dd>
					<c:out value="${user.username}"/> <span> <a class="pull-right" href="#"> <i class="fa fa-pencil"></i>
					</a>
					</span>
				</dd>
				<hr>
				
				<dt>
					<strong>Email Address </strong>
				</dt>
				<dd>
					<c:out value="${user.email}"/> <span> <a class="pull-right" href="#"> <i class="fa fa-pencil"></i>
					</a>
					</span>
				</dd>
				<hr>
				<dt>
					<strong>Phone Number </strong>
				</dt>
				<dd>
					(304) 33-2867-499 <span> <a class="pull-right" href="#">
							<i class="fa fa-pencil"></i>
					</a>
					</span>
				</dd>
				<hr>
				<dt>
					<strong>Address </strong>
				</dt>
				<dd>
					California, US <span> <a class="pull-right" href="#"> <i
							class="fa fa-pencil"></i>
					</a>
					</span>
				</dd>
				<hr>
			</dl>
			<button type="button" class="btn-u btn-u-default">Cancel</button>
			<button type="button" class="btn-u">Save Changes</button>
		</div>

		<div id="password" class="profile-edit tab-pane fade">
			<h2 class="heading-md">Manage your Security Settings</h2>
			<p>Change your password.</p>
			</br>
			<form class="sky-form" id="sky-form4" action="">
				<dl class="dl-horizontal">
					<dt>Username</dt>
					<dd>
						<section>
							<label class="input"> <i class="icon-append fa fa-user"></i>
								<input type="text" placeholder="Username" name="username">
								<b class="tooltip tooltip-bottom-right">Needed to enter the
									website</b>
							</label>
						</section>
					</dd>
					<dt>Email address</dt>
					<dd>
						<section>
							<label class="input"> <i
								class="icon-append fa fa-envelope"></i> <input type="email"
								placeholder="Email address" name="email"> <b
								class="tooltip tooltip-bottom-right">Needed to verify your
									account</b>
							</label>
						</section>
					</dd>
					<dt>Enter your password</dt>
					<dd>
						<section>
							<label class="input"> <i class="icon-append fa fa-lock"></i>
								<input type="password" id="password" placeholder="Password"
								name="password"> <b class="tooltip tooltip-bottom-right">Don't
									forget your password</b>
							</label>
						</section>
					</dd>
					<dt>Confirm Password</dt>
					<dd>
						<section>
							<label class="input"> <i class="icon-append fa fa-lock"></i>
								<input type="password" placeholder="Confirm password"
								name="passwordConfirm"> <b
								class="tooltip tooltip-bottom-right">Don't forget your
									password</b>
							</label>
						</section>
					</dd>
				</dl>
				<label class="toggle toggle-change"><input type="checkbox"
					checked="" name="checkbox-toggle-1"><i></i>Remember
					password</label> </br>
				<section>
					<label class="checkbox"><input type="checkbox" id="terms"
						name="terms"><i></i><a href="#">I agree with the Terms
							and Conditions</a></label>
				</section>
				<button type="button" class="btn-u btn-u-default">Cancel</button>
				<button class="btn-u" type="submit">Save Changes</button>
			</form>
		</div>

		<div id="payment" class="profile-edit tab-pane fade">
			<h2 class="heading-md">Manage your Payment Settings</h2>
			<p>Below are the payment options for your account.</p>
			</br>
			<form class="sky-form" id="sky-form" action="">
				<!--Checkout-Form-->
				<section>
					<div class="inline-group">
						<label class="radio"><input type="radio" checked=""
							name="radio-inline"><i class="rounded-x"></i>Visa</label> <label
							class="radio"><input type="radio" name="radio-inline"><i
							class="rounded-x"></i>MasterCard</label> <label class="radio"><input
							type="radio" name="radio-inline"><i class="rounded-x"></i>PayPal</label>
					</div>
				</section>

				<section>
					<label class="input"> <input type="text" name="name"
						placeholder="Name on card">
					</label>
				</section>

				<div class="row">
					<section class="col col-10">
						<label class="input"> <input type="text" name="card"
							id="card" placeholder="Card number">
						</label>
					</section>
					<section class="col col-2">
						<label class="input"> <input type="text" name="cvv"
							id="cvv" placeholder="CVV2">
						</label>
					</section>
				</div>

				<div class="row">
					<label class="label col col-4">Expiration date</label>
					<section class="col col-5">
						<label class="select"> <select name="month">
								<option disabled="" selected="" value="0">Month</option>
								<option value="1">January</option>
								<option value="1">February</option>
								<option value="3">March</option>
								<option value="4">April</option>
								<option value="5">May</option>
								<option value="6">June</option>
								<option value="7">July</option>
								<option value="8">August</option>
								<option value="9">September</option>
								<option value="10">October</option>
								<option value="11">November</option>
								<option value="12">December</option>
						</select> <i></i>
						</label>
					</section>
					<section class="col col-3">
						<label class="input"> <input type="text"
							placeholder="Year" id="year" name="year">
						</label>
					</section>
				</div>
				<button type="button" class="btn-u btn-u-default">Cancel</button>
				<button class="btn-u" type="submit">Save Changes</button>
				<!--End Checkout-Form-->
			</form>
		</div>

		<div id="notSettings" class="profile-edit tab-pane fade">
			<h2 class="heading-md">Manage your Notifications.</h2>
			<p>Below are the notifications you may manage.</p>
			</br>
			<form class="sky-form" id="sky-form" action="">
				<label class="toggle"><input type="checkbox" checked=""
					name="checkbox-toggle-1"><i></i>Email notification</label>
				<hr>
				<label class="toggle"><input type="checkbox" checked=""
					name="checkbox-toggle-1"><i></i>Send me email notification
					when a user comments on my blog</label>
				<hr>
				<label class="toggle"><input type="checkbox" checked=""
					name="checkbox-toggle-1"><i></i>Send me email notification
					for the latest update</label>
				<hr>
				<label class="toggle"><input type="checkbox" checked=""
					name="checkbox-toggle-1"><i></i>Send me email notification
					when a user sends me message</label>
				<hr>
				<label class="toggle"><input type="checkbox" checked=""
					name="checkbox-toggle-1"><i></i>Receive our monthly
					newsletter</label>
				<hr>
				<button type="button" class="btn-u btn-u-default">Reset</button>
				<button class="btn-u" type="submit">Save Changes</button>
			</form>
		</div>
	</div>
</div>
<!-- End Tab v1 -->

<%-- <script src="<c:url value='/ng/lib/angular/angular.js' />"></script> --%>

<script src="<c:url value='/ng/app.js' />"></script>
<script src="<c:url value='/ng/services.js' />"></script>
<script src="<c:url value='/ng/controllers/profileController.js' />"></script>
<script src="<c:url value='/ng/filters.js' />"></script>
<script src="<c:url value='/ng/directives.js' />"></script>