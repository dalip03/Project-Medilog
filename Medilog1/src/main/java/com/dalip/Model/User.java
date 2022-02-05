package com.dalip.Model;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

public class User {

	public String _id;
	public String name;
	public String gender;
	public String age;
	public String email;
	public String password;
	
	public User() {
		
	}
	
	
	public User(String name, String gender, String age, String email, String password) {
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.email = email;
		this.password = password;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		if(name.length()<2) {
			System.out.println("Invalid Name !");
		}else {
			this.name = name;
		}

	}
	
	public void makePasswordSecure() {
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] byteOfSHA = digest.digest(password.getBytes(StandardCharsets.UTF_8));
			
			BigInteger number = new BigInteger(1, byteOfSHA);
			
			StringBuilder passwordHexString = new StringBuilder(number.toString(16));
			
			while (passwordHexString.length() < 32) {
				
				passwordHexString.insert(0, '0');
			}
			
			password = passwordHexString.toString();
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	
	public String makePasswordSecure(String password) {
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] byteOfSHA = digest.digest(password.getBytes(StandardCharsets.UTF_8));
			
			BigInteger number = new BigInteger(1, byteOfSHA);
			
			StringBuilder passwordHexString = new StringBuilder(number.toString(16));
			
			while (passwordHexString.length() < 32) {
				
				passwordHexString.insert(0, '0');
			}
			
			password = passwordHexString.toString();
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return password;
	}
	

	public Map toMap() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("gender", gender);
		map.put("age", age);
		map.put("email", email);
		map.put("password", password);
 
		return map;
	}


	@Override
	public String toString() {
		return "User [_id=" + _id + ", name=" + name + ", gender=" + gender + ", age=" + age + ", email=" + email
				+ ", password=" + password + "]";
	}
	
	
	
	

}