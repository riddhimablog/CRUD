<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				User List <small></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">User List</li>
			</ol>
		</div>
		<button type="submit" class="btn btn-medium btn-primary"
		name="operation" value="Delete" ng-click='addNewUser()'>New User</button>
		    
		  <form class="navbar-form navbar-right" role="searchString">
         <div class="form-group">
        <label class="control-label">Filter:</label>
        <input type="text" class="form-control" ng-model="searchString" placeholder="Search">
      </div>
    </form>
	</div>
 
	<div class="row">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr class="warning">
						<th>#</th>
						<th>Email Id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>User Name</th>
						<th>Operation</th>
					</tr>
				</thead>

				<tbody ng-repeat="user in users | filter:searchString">
					<tr>
						<td>{{((10*(currentPage-1))+ ($index +1))}}</td>
						<td>{{user.emailId}}</td>
						<td>{{user.firstName}}</td>
						<td>{{user.lastName}}</td>
						<td>{{user.userName}}</td>
						<td><button type="button" class="btn btn-danger btn-xs"
								ng-click="deleteUser(user.id)">delete</button> |
							<button type="button" class="btn btn-primary btn-xs"
								ng-click="updateUser(user.id)">edit</button></td>
					</tr>
				</tbody>

			</table>
		</div>
	 
	</div>
</div>