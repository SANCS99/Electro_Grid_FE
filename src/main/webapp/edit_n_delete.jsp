<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<style>
h1 {
    color: black;
    box-shadow: #500e0e 0 0 20px 0px;
    background-color: #ffd700b8;
    padding: 10px;
    text-align: center;
}
        
        
h2{
            color: black;
    box-shadow: #500e0e 0 0 20px 0px;
    background-color: #ffd700b8;
    padding: 10px;
    text-align: center;
        }        
        
        
        
        
  input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #6748481c;
  padding: 20px;
}
        
        
</style>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	
    
    <script src="assets/js/croppie.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
	
</head>
<body>
	
    <div class="container">
		
<br>
<p></p>
	                    <h1>Consumption List</h1>
	                    <div>
	                        <div id="usersDiv">
	                    	
	            			</div>
	                    </div>
	                    
	                   
<div id="hideDiv" style="display: none">

							<br><br><br>
   	                        <form id="userRegister">
   	                        <h2>Edit Consumption...</h2>
							<input type= "hidden" id="edit_id" name="edit_id">
	                            
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
	                                
	                                    <input type="submit" value="Submit">
	                                
	                                
	                            </div>
	                    	</form>
</div> 
	                    
</div>
	
</body>
</html>

<script>

    function deletes(id) {
    	if (confirm("Delete ?") == true) {
        	$.ajax({
                type: "DELETE",
                url: "rest_api/consumption",
                data: JSON.stringify({ 'id' : id}),
                dataType: "json",
    			contentType : 'application/json',
                success: function(data){
                	if(data['success']=="Done"){
                		alert("Delete Successfull!");
    					reload();
    				}else if(data['success']=="0"){
    					alert("Delete Unsuccessful!");
    				}
                },
                failure: function(errMsg) {
                    alert('Error');
                }
            });
    	}
    }

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
                    "id" : $('#edit_id').val(),
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
                    type: "PUT",
                    url: 'rest_api/consumption',
                    dataType : 'json',
    				contentType : 'application/json',
    				data: fromData,
                    success: function(data){
                    	if(data['success']=="Done"){
                    		alert("Edit Successfull!");
                        	document.getElementById("hideDiv").style.display = "none";
                            $("#userRegister")[0].reset();
    						reload();
    					}else{
    						alert("Unsuccessful!");
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

    function reload(){
    	$.ajax({
            type: "GET",
            url: "rest_api/consumption",
            success: function(data){
            	$("#usersDiv").html(data);
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });
    }

    reload();
    
    function edit(id) {
    	document.getElementById("hideDiv").style.display = "block";
    	$.ajax({
            type: "POST",
            url: "rest_api/consumption/get",
            data: JSON.stringify({ 'id' : id}),
            dataType: "json",
			contentType : 'application/json',
            success: function(data){
            	console.log(data),
                $('#edit_id').val(data['id']),
                $('#meter_box_id').val(data['meter_box_id']),
                $('#address').val(data['address']),
                $('#unit_size').val(data['unit_size']),
                $('#activity').val(data['activity']),
                $('#used_units').val(data['used_units']),
                $('#house_id').val(data['house_id']),
                $('#admin').val(data['admin']),
                $('#meter_reader_id').val(data['meter_reader_id'])
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });

    }
    
    
</script>