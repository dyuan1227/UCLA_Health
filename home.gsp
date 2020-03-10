<!DOCTYPE html>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-1.9.0.js"> </script>
		<asset:javascript src="dependencies/dataTables.min.js"/>
    	<asset:javascript src="dependencies/dataTables.bootstrap.min.js"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <asset:stylesheet src="home.css"/>
		<title>Home Page</title>
	</head>
	<body>
	<div id="main_container">
		<form class="create_new_users" id="create_new_users" method="post" action="CreateUser">
			<fieldset>
						<legend><b>Create/Search New Users</b></legend>
						<label> Email</label> <input type="text" name="email"/> @mednet.ucla.edu<br/>
						<label> First Name</label> <input type="text" name="firstname"/> <br/>
						<label> Last Name</label> <input type="text" name="lastname"/> <br/><br/>
					
						<label> Application </label> 
						<select id="application" name="application"> 
							<option> LIVER_DATA_ENTRY </option>
							<option> LIVER_DASHBOARD </option>
							<option> KIDNEY_DATA_ENTRY </option>
							<option> KIDNEY_DASHBOARD </option>
							<option> LUNG_DATA_ENTRY </option>
							<option> LUNG_DASHBOARD </option>
							<option> PROSTATE_DATA_ENTRY </option>
							<option> PROSTATE_DASHBOARD </option>
							<option> TDABC </option>
							<option> HELP_TICKET </option>
							<option> AUTH_SERVICE </option>
						</select><br/>
						<br/>
						<label> Access Permission</label>
						<select id="application" name="accesspermission"> 
							<option> liverDataEntryUser </option>
							<option> liverDashboardPHI </option>
							<option> liverDataEntryAdmin </option>
							<option> liverDataEntryUser </option>
							<option> liverDataEntryDataMgr </option>
							<option> kidneyDataEntry </option>
							<option> kidneyDash </option>
							<option> lungDataEntryIDX </option>
							<option> lungDataEntryIR </option>
							<option> lungDataEntryEdit </option>
							<option> lungDashboardPHI </option>
							<option> tdabc </option>
							<option> helpTicketUser </option>
							<option> liverDataEntryUser </option>
							<option> helpTicketAdmin </option>
							<option> authCanView </option>
							<option> authCanEdit </option><br/>
						</select><br/><br/>	
						<input type="submit" value="Add permission to the User" />
				
			</fieldset>
		</form>
	</div>
		
	<div id="feedback_container">
		<fieldset>
			<legend><b>Returned results</b></legend>
			<div class="table-container">
				<table id="usertable">
					<thead>
						<tr>
						<!--	<th> Delete Permission</th>
							<th> Username</th>
							<th> Email</th>
							<th> First Name</th>
							<th> Last Name</th>
							<th> Domain Access</th>
							<th> Permissions</th> -->

							<th> Username</th>
							<th> Email</th>
							<th> First Name</th>
							<th> Last Name</th>
							<th> Application</th>
							<th> Access Permissions</th>
							
						</tr>
					</thead>				
				</table>
			</div>
			
		</fieldset>
	</div>
	
	
	 <form class="login" method="post" action="permission">
		<input type="submit" value="Go to Permission Page" />
	 </form>
	 <br/>
	 <form class="login" method="post" action="logout">
		<input type="submit" value="Log Out" />
	 </form>

	<script>
		$(document).ready(function() {
				$('#usertable').DataTable( {
					"processing": true,
					"serverSide": true,
					"ajax": {
						 url:"${createLink(controller:'home', action:'takeTableData')}",
						 dataSrc: "tableData",
						 type: "post"

					},
					"columns": [
						{ "allusers": "user_id" },
						{ "allusers": "email" },
						{ "allusers": "first_name" },
						{ "allusers": "last_name" } 
					]

				} );
			} );

		$(form).change(function() {
				$('#usertable').DataTable( {
					"processing": true,
					"serverSide": true,
					"ajax": {
						 url:"${createLink(controller:'home', action:'takeUserPermissionTableData')}",
						 dataSrc: "tableData",
						 type: "post"

					},
					"columns": [
						{ "user_permissions": "user_id" },
						{ "user_permissions": "email" },
						{ "user_permissions": "first_name" },
						{ "user_permissions": "last_name" },
						{ "user_permissions": "application" },
						{ "user_permissions": "accesspermissions" }
					]

				} );
			} );
	</script>

	</body>
</html>