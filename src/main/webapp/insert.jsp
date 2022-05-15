<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	
    <script src="assets/js/croppie.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
	
</head>
<body>
	
    <div class="container">
		
<br>
<p></p>

	                    <div>User Register</div>
	                        <form id="userRegister">
	                            <div>
	                                <label>ID</label>
	                                <div>
	                                    <input type="text" id="id" class="form-control" name="id">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Meter box ID</label>
	                                <div>
	                                    <input type="text" id="meter_box_id" class="form-control" name="meter_box_id">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Address</label>
	                                <div>
	                                    <input type="text" id="address" class="form-control" name="address">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Unite size</label>
	                                <div>
	                                    <input type="text" id="unit_size" class="form-control" name="unit_size">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Admin</label>
	                                <div>
	                                    <input type="text" id="admin" class="form-control" name="admin">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Activity</label>
	                                <div>
	                                    <select name="activity" class="form-control" id="activity">
	                                		<option value="">Select</option>
	                                		<option value="0">Repair</option>
	                                		<option value="1">Maintainance</option>
	                                		<option value="2">Other</option>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Used Unites</label>
	                                <div>
	                                    <input type="number" id="used_units" class="form-control" name="used_units">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>House ID</label>
	                                <div>
	                                    <input type="number" id="house_id" class="form-control" name="house_id">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <label>Meter Reader ID</label>
	                               <div>
	                                    <input type="number" id="meter_reader_id" class="form-control" name="meter_reader_id">
	                                </div>
	                            </div>
	                            
	                            <div>
	                                <button type="submit" class="btn btn-success">
	                                    Add
	                                </button>
	                                <a href="edit_n_delete.jsp" class="btn btn-success">
	                                    List
	                                </a>
	                            </div>
	                    	</form>
	                    </div>

</body>
</html>
<script>

$(document).ready(function () {

    $("#userRegister").validate({
        rules: {
        	id: "required",
        	meter_box_id: "required",
        	address: "required",
        	unit_size: "required",
        	admin: "required",
        	activity: "required",
        	used_units: "required",
        	house_id: "required",
        	meter_reader_id: "required"
        },
        messages: {
        	id: "N Required!",
        	meter_box_id:"format",
            address: "n Required!",
            unit_size: "p Required!",
            admin: "a Required!",
            activity: "p Required!",
            used_units: "p Required!",
            house_id: "p Required!",
            meter_reader_id: "p Required!"
        },
        submitHandler: function () {
        	var fromData = JSON.stringify({
                "id" : $('#id').val(),
                "meter_box_id" : $('#meter_box_id').val(),
                "address" : $('#address').val(),
                "unit_size" : $('#unit_size').val(),
                "admin" : $('#admin').val(),
                "activity" : $('#activity').val(),
                "used_units" : $('#used_units').val(),
                "house_id" : $('#house_id').val(),
                "meter_reader_id" : $('#meter_reader_id').val()
            });
        	
        	console.log(fromData);

            $.ajax({
                type: "POST",
                url: 'rest_api/consumption',
                dataType : 'json',
				contentType : 'application/json',
				data: fromData,
                success: function(data){
                	console.log(data);
                	if(data['success']=="Done"){
                		alert("Added Successfull!");
                        $("#userRegister")[0].reset();
					}else{
						alert("Unsuccessfull!");
					}
                },
                failure: function(errMsg) {
                	alert("Connection Error!");
                }
            });
        }
    });

    $("#userRegister").submit(function(e) {
        e.preventDefault();
    });

});

</script>