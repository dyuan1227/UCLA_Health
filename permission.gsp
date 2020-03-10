<!DOCTYPE html>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-1.9.0.js"> </script>
		<asset:javascript src="dependencies/dataTables.min.js"/>
    	<asset:javascript src="dependencies/dataTables.bootstrap.min.js"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <asset:stylesheet src="permission.css"/>
		<title>Permission Page</title>
	</head>
	<body>
	<div id="main_container">
		<form class="search_users" method="post" action="CreatePermission">
			<fieldset>
						<legend><b>Create New Permission </b></legend>
						<label> ID</label> <input type="text" name="idx"/> <br/>				
						<label> Application</label> <input type="text" name="application"/> <br/>
						<label> Permission</label> <input type="text" name="privilegename"/> <br/>
						<input type="submit" value="Create Permission" /><br/>
            </fieldset>
			<br/>
            <fieldset>
                        <legend><b>Search Permission </b></legend>
						<label> Application </label> 
						<select id="application"> 
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
						<label> Access Privileges</label> 
						<select id="application"> 
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
							<option> AuthCanView </option>
							<option> AuthCanChange </option><br/>
						</select><br/> <br/>	
				
			</fieldset>
		</form>
	</div>
	<br/>	
	<div id="feedback_container">
		<fieldset>
			<legend><b>Returned results</b></legend>
			<table id="permissiontable">
				<thead>
					<tr>
					<!--	<th> Delete Privilege</th>
						<th> ID</th>
						<th> Application</th>
						<th> Privileges</th>   -->

						<th> ID</th>
						<th> Application</th>
						<th> Permission</th>
					
					</tr>
				</thead>	
			</table>
		</fieldset>
	</div>
	

	
	<form class="login" method="post" action="backtohome">
		<input type="submit" value="Back to Search Page" />
	</form>
	<br/>
	<form class="login" method="post" action="logout">
		<input type="submit" value="Log Out" />
	</form>


	<script>
	$(document).ready(function() {
			$('#permissiontable').DataTable( {
				"processing": true,
				"serverSide": true,
				"ajax": {
						url:"${createLink(controller:'home', action:'takeRoleTableData')}",
						dataSrc: "tableData",
						type: "post"

				},
				"columns": [
					{ "allids": "id" },
					{ "allids": "application" },
					{ "allids": "permission" },
				]

			} );
		} );

	
	</script>
	</body>
</html>