<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				User <small>Add/Update user!</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">User</li>
			</ol>
		</div>

	</div>
	<div class="row">
		<div class="col-md-6">

			<div ng-class="msgClass">{{ message }}</div>

			<form role="form" name="userform" novalidate>

				<div class="form-group">
					<label for="exampleInputEmail1">First Name:</label> <input
						class="form-control" id="firstName" name="firstName"
						ng-model="user.firstName" placeholder="Enter First Name" required>

					<div class="alert alert-danger"
						ng-show="userform.firstName.$dirty && userform.firstName.$invalid">
						<span class="text-error"
							ng-show="userform.firstName.$error.required">Required!</span>
					</div>
				</div>
				<div class="form-group">
					<label for="lastname">Last Name:</label> <input type="text"
						class="form-control" type="text" id="lastname" name="lastname"
						ng-model="user.lastName" placeholder="Enter Last Name" required>

					<div class="alert alert-danger"
						ng-show="userform.lastname.$dirty && userform.lastname.$invalid">
						<span class="text-error"
							ng-show="userform.lastname.$error.required">Required!</span>
					</div>
				</div>

				<div class="form-group">
					<label for="emailid">Email:</label> <input type="email"
				class="form-control" id="emailId" name="emailId" ng-model="user.emailId"  placeholder="Enter email" required>
          
					<div class="alert alert-danger"
						ng-show="userform.emailId.$dirty && userform.emailId.$invalid">
						<span ng-show="userform.emailId.$error.required">Enter your
							email.</span> <span ng-show="userform.emailId.$error.email">This is
							not a valid email.</span>
					</div>
				</div>


				<div class="form-group">
					<label for="username">Login Id:</label> <input type="text"
						name="username" class="form-control" type="text" id="username"
						ng-model="user.userName" placeholder="Enter Login Id" required>

					<div class="alert alert-danger"
						ng-show="userform.username.$dirty && userform.username.$invalid">
						<span class="text-error"
							ng-show="userform.username.$error.required">Required!</span>
					</div>
				</div>

				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" type="password" id="password" name="password"
						ng-model="user.password" ng-minlength="5" ng-maxlength="10" placeholder="Enter Password " required>

						<div class="alert alert-danger"
							ng-show="userform.password.$dirty && userform.password.$invalid">
							<span class="text-error"
								ng-show="userform.password.$error.required">Required!</span>
							<span class="text-error" ng-show="userform.password.$error.minlength">
								The password must be minimum length 5! </span>
						     <span class="text-error" ng-show="userform.password.$error.maxlength">
								 The password must be maximum length 10!</span>
					       </div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-medium btn-primary"
						ng-disabled="userform.$invalid" name="operation" value="Add"
						ng-click='AddUser()'>Save</button>
					<button type="submit" class="btn btn-medium btn-danger"
						ng-disabled="userform.$invalid" name="operation" value="Delete"
						ng-click='deleteUser()'>Delete</button>
					<button type="submit" class="btn btn-medium btn-primary"
						name="operation" value="Delete" ng-click='GetUser()'>Get</button>
					<button type="submit" class="btn btn-medium  btn-primary"
						name="operation" value="List" ng-click='viewUserlist()'>List</button>
					<button type="submit" class="btn btn-medium  btn-primary"
					name="operation" value="List" ng-click='newUser()'>New</button>
				</div>

			</form>
		</div>
	</div>
</div>
