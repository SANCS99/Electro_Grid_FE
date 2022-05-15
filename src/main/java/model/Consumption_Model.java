package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONObject;

import db_connection.DB;

public class Consumption_Model {
	
	private String res;
	
	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public String getConsumption() {
		PreparedStatement ps;
		String data="";
		
		try {
			
			Connection conn = DB.getConn();
			ps = conn.prepareStatement("SELECT * FROM consumption");
			
			ResultSet res_Set = ps.executeQuery();
			
			data = "<table>"
		            +"<tr>"
		            +"<th style='border-style: dotted;'>ID</th>"
	                +"<th style='border-style: dotted;'>Meter Box ID</th>"
	                +"<th style='border-style: dotted;'>Address</th>"
	                +"<th style='border-style: dotted;'>Unit Size</th>"
	                +"<th style='border-style: dotted;'>Admin</th>"
	                +"<th style='border-style: dotted;'>Electric Activity</th>"
	                +"<th style='border-style: dotted;'>Used Units</th>"
	                +"<th style='border-style: dotted;'>House ID</th>"
	                +"<th style='border-style: dotted;'>Meter Reader ID</th>"
	                +"<th style='border-style: dotted;'>Edit/Delete</th>"
	                +"</tr>";
			
			while (res_Set.next()) {
				
				String button = "<button type='button' onclick='edit("+res_Set.getString(1)+")'>Edit</button><button type='button' onclick='deletes("+res_Set.getString(1)+")'>Delete</button>";
				
				data = data+"<tr><td style='border-style: dotted;'>"+res_Set.getString(1)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(2)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(3)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(4)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(5)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(6)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(7)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(8)+"</td>"
						+ "<td style='border-style: dotted;'>"+res_Set.getString(9)+"</td>"
						+ "<td style='border-style: dotted;'>"+button+"</td>"
					  + "</tr>";
				
			}
			
			ps.close();
			conn.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return data+"</table>";
	}
	
	public void addConsumption(String meter_box_id,String address,String unit_size,String admin,String activity,int used_units,int house_id,int meter_reader_id) {
		PreparedStatement ps;
		
		try {
			Connection conn = DB.getConn();
			
			ps = conn.prepareStatement("insert into consumption (meter_box_id, address, unit_size, admin, activity, used_units, house_id, meter_reader_id) values (?,?,?,?,?,?,?,?)");
			ps.setString(1, meter_box_id);
			ps.setString(2, address);
			ps.setString(3, unit_size);
			ps.setString(4, admin);
			ps.setString(5, activity);
			ps.setInt(6, used_units);
			ps.setInt(7, house_id);
			ps.setInt(8, meter_reader_id);
			ps.execute();
			ps.close();
			conn.close();
			setRes("Done");
		
		}catch (ClassNotFoundException | SQLException  e) {
			setRes("Error");
		}
	}

	public void editConsumption(int id,String meter_box_id,String address,String unit_size,String admin,String activity,int used_units,int house_id,int meter_reader_id) {
		PreparedStatement ps;
		
		try {
			Connection conn = DB.getConn();
			
				ps = conn.prepareStatement("UPDATE consumption SET meter_box_id=?, address=?, unit_size=?, admin=?, activity=?, used_units=?, house_id=?, meter_reader_id=? where id=?");
				ps.setString(1, meter_box_id);
				ps.setString(2, address);
				ps.setString(3, unit_size);
				ps.setString(4, admin);
				ps.setString(5, activity);
				
				ps.setInt(6, used_units);
				ps.setInt(7, house_id);
				ps.setInt(8, meter_reader_id);
				ps.setInt(9,id);
				ps.execute();
				ps.close();
				conn.close();
				setRes("Done");
				
		
		}catch (ClassNotFoundException | SQLException  e) {
			setRes("Error");
		}
	}

	public void deleteConsumption(int id) {
		PreparedStatement ps;
		
		try {
			Connection conn = DB.getConn();
			
			ps = conn.prepareStatement("DELETE FROM consumption WHERE id=?");
			ps.setInt(1, id);
			ps.execute();
			setRes("Done");
		
		}catch (ClassNotFoundException | SQLException  e) {
			setRes("Error");
		}
	}
	
	public JSONObject getOneConsumption(int id){
		
		PreparedStatement preparedStatement;
		JSONObject json = new JSONObject();
		
		try {
			Connection conn = DB.getConn();
			
			preparedStatement = conn.prepareStatement("SELECT * FROM consumption where id=?");
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				json.put("id", rs.getInt(1));
				json.put("meter_box_id", rs.getString(2));
				json.put("address", rs.getString(3));
				json.put("unit_size", rs.getString(4));
				json.put("admin", rs.getString(5));
				json.put("activity", rs.getString(6));
				json.put("used_units", rs.getString(7));
				json.put("house_id", rs.getString(8));
				json.put("meter_reader_id", rs.getString(9));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			setRes("Error");
		}
		return json;
	}

	
	
}
