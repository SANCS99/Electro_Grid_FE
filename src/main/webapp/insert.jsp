<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">

<style>
 			.row{
                margin-top: 2em;
            }
            .heading{
                margin-top: 0.5em;
            } 

     h1 {
    color: black;
    box-shadow: #500e0e 0 0 20px 0px;
    background-color: #ffd700b8;
    padding: 10px;
    text-align: center;
}
        
        
        .button2 {
				    padding: 11px 115px;
				    background-color: #0d6efd;
				    margin-left: 37%;
				    margin-top: 5%;
				    color: white;
				}
        
        div {
			  border-radius: 5px;
			  background-color: #6748481c;
			  padding: 20px;
			}

        .button3 {
				    padding: 11px 104px;
				    background-color: #4caf50;
				    margin-left: 8%;
				    margin-top: 5%;
				    color: white;
				}
        
        a {
    color: #ffffff;
    text-decoration: underline;
}
        
</style>
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

	                    <h1>Consumption Register</h1>
	                    <br><br><br>
	                    
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
	                                <button class="button3" type="submit" class="btn btn-success">
	                                    Submit
	                                </button >
	                                <button class="button2"  >
	                                <a href="edit_n_delete.jsp" >
	                                    List
	                                </a>
	                                </button>
	                            </div>
	                    	</form>
	                    </div>
	                    <br>

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
        	id: "ID Required!",
        	meter_box_id:"box_id Required!",
            address: "Address Required!",
            unit_size: "Unit_size Required!",
            admin: "Admin Required!",
            activity: "Activity Required!",
            used_units: "Used_units Required!",
            house_id: "House_id Required!",
            meter_reader_id: "Meter_reader_id Required!"
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