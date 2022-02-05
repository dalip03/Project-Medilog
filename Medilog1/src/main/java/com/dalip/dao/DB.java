package com.dalip.dao;

import java.util.ArrayList;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.dalip.Model.Medicine;
import com.dalip.Model.User;
import com.mongodb.BasicDBObject;
import com.mongodb.CreateIndexCommitQuorum;
import com.mongodb.DBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import com.mongodb.client.model.Updates;


public class DB {
	MongoClient mongoClient;
	
	public DB() {

		try {
			String connectionUrl = "mongodb+srv://dalip:dalip12@cluster0.9dudc.mongodb.net/medilogdb?retryWrites=true&w=majority";
			mongoClient = MongoClients.create(connectionUrl);

			System.out.println(getClass().getSimpleName()
					+ " MongoDB Connection Created and Reference to Client Object obtained ");

		} catch (Exception e) {
			System.out.println("Something went wrong: " + e);

		}

	}
	
	public boolean registerUser(User user) {
		// MongoDB Document which converts HashMap to Document | BOXING
		Document document = new Document(user.toMap());

		// Insert into DataBase
		mongoClient.getDatabase("medilogdb").getCollection("users").insertOne(document);
		System.out.println(user.getName() + " Register in MongoDB");
		user._id = document.getObjectId("_id").toString();
		System.out.println("userid: "+user._id + " Register in MongoDB");

		return true;
	}

	public boolean loginUser(User user) {

		System.out.println("[DB] USER DATA: " + user);

		BasicDBObject query = new BasicDBObject();
		query.put("email", user.email);
		query.put("password", user.password);

		MongoCursor<Document> cursor = mongoClient.getDatabase("medilogdb").getCollection("users").find(query)
				.iterator();
//    	while(cursor.hasNext()) {
//    		System.out.println(cursor.next().toJson());
//    		

//    	}

		boolean flag = cursor.hasNext();
		if (flag) {
			// System.out.println(cursor.next().toJson());
			Document document = cursor.next();
			System.out.println(document.getObjectId("_id"));
			System.out.println(document.getString("name"));

			user._id = document.getObjectId("_id").toString();
			user.name = document.getString("name");
			user.gender = document.getString("gender");
			user.age = document.getString("age");

			System.out.println("[DB] User Data After Successfull login: " + user);

		}
		return flag;
	}

	public boolean logMedicine(Medicine medicine) {
		// MongoDB Document which converts HashMap to Document | BOXING
		Document document = new Document(medicine.toMap());

		// Insert into DataBase
		mongoClient.getDatabase("medilogdb").getCollection("medicines").insertOne(document);
		System.out.println(medicine.userId + " " + medicine.mdName + " medicine saved in MongoDB");

		return true;
	}

	
	
	public ArrayList<Medicine> fetchMedicines(String userId) {

		ArrayList<Medicine> medicineRecords = new ArrayList<Medicine>();

		BasicDBObject query = new BasicDBObject();
		query.put("userId", userId);

		try {
			MongoCursor<Document> cursor = mongoClient.getDatabase("medilogdb").getCollection("medicines").find(query)
					.iterator();
			while (cursor.hasNext()) {
				Document document = cursor.next();
				Medicine medicine = new Medicine();

				medicine._id = document.getObjectId("_id").toString();
				medicine.userId = document.getString("userId");
				medicine.dateTimeStamp = document.getString("dateTimeStamp");
				medicine.mdName = document.getString("mdName");
				medicine.mdExpiryDate = document.getString("mdExpiryDate");
				medicine.mdTreatments = document.getString("mdTreatments");
				medicine.mdQuantity = document.getString("mdQuantity");
				
				medicineRecords.add(medicine);

			}
		} catch (Exception e) {
			System.out.println("Something went wrong: " + e);
		}

		return medicineRecords;
	}
	
	public void deleteMedicine(String medicineId) {

		System.out.println("[DB] Deleting Medicine " + medicineId);

		BasicDBObject query = new BasicDBObject();
		query.put("_id", new ObjectId(medicineId) );

	    mongoClient.getDatabase("medilogdb").getCollection("medicines").deleteOne(query);
	}
	
	public void updateMedicine(String medicineName, String medicineExpiryDate, String medicineTreatments, String medicineQuantity, String medicineId) {
		// MongoDB Document which converts HashMap to Document | BOXING
		
		System.out.println("[DB] Updating Medicine  " + medicineId);
		
		
		BasicDBObject query = new BasicDBObject();
		query.put("_id", new ObjectId(medicineId) );
		
		MongoCursor<Document> cursor = mongoClient.getDatabase("medilogdb").getCollection("medicines").find(query).iterator();
		
		Document document = cursor.next();
		
//		DBObject update = new BasicDBObject();
		
		document.put("mdName", medicineName);
		document.put("mdExpiryDate", medicineExpiryDate);
		document.put("mdTreatments", medicineTreatments);
		document.put("mdQuantity", medicineQuantity);
		
//		update.put("$set", document);
		ObjectId oId = new ObjectId(medicineId);
		
		System.out.println("[DB] "+document.toJson());
		
//		mongoClient.getDatabase("medilogdb").getCollection("medicines").updateOne(query, document);
		// Insert into DataBase
		mongoClient.getDatabase("medilogdb").getCollection("medicines").updateOne(Filters.eq("_id", oId),
	                                                                 Updates.combine(Updates.set("mdName", medicineName), Updates.set("mdExpiryDate", medicineExpiryDate), Updates.set("mdTreatments", medicineTreatments), Updates.set("mdQuantity", medicineQuantity))  );
		System.out.println("Medicine Updated");

	}
	
	
	public ArrayList<Medicine> searchMedicines(String searchTreatment, String userId) {

		ArrayList<Medicine> searchMedicineRecords = new ArrayList<Medicine>();

		BasicDBObject query = new BasicDBObject();
		query.put("userId", userId);
		
		MongoDatabase database = mongoClient.getDatabase("medilogdb");
		MongoCollection<Document> collection = database.getCollection("medicines");
		
		try {
				MongoCursor<Document> cursor1 = collection.find(query).iterator();

				while(cursor1.hasNext()) {
					
					Document document = cursor1.next();
					Medicine medicine = new Medicine();
					
					String mdtreatments = document.getString("mdTreatments");
					String mdname = document.getString("mdName");
					String mdquantity = document.getString("mdQuantity");
					
					if(mdtreatments.contains(searchTreatment) || mdname.contains(searchTreatment) || mdquantity.contains(searchTreatment)) {
					medicine._id = document.getObjectId("_id").toString();
					medicine.userId = document.getString("userId");
					medicine.dateTimeStamp = document.getString("dateTimeStamp");
					medicine.mdName = document.getString("mdName");
					medicine.mdExpiryDate = document.getString("mdExpiryDate");
					medicine.mdTreatments = document.getString("mdTreatments");
					medicine.mdQuantity = document.getString("mdQuantity");
					
					searchMedicineRecords.add(medicine);
					
					}
					
				}

		} catch (Exception e) {
			System.out.println("Something went wrong: " + e);
		}

		return searchMedicineRecords;
	}
	
	
	public void updateUser(String userName, String userEmail, String userNewPassword, String userId) {
		// MongoDB Document which converts HashMap to Document | BOXING
		
		System.out.println("[DB] Updating User  " + userId);
		
		
		BasicDBObject query = new BasicDBObject();
		query.put("_id", new ObjectId(userId) );
		
		MongoCursor<Document> cursor = mongoClient.getDatabase("medilogdb").getCollection("users").find(query).iterator();
		
		Document document = cursor.next();
		
//		DBObject update = new BasicDBObject();
		
		document.put("name", userName);
		document.put("email", userEmail);
		document.put("password", userNewPassword);
		
//		update.put("$set", document);
		ObjectId oId = new ObjectId(userId);
		
		System.out.println("[DB] "+document.toJson());
		
//		mongoClient.getDatabase("medilogdb").getCollection("medicines").updateOne(query, document);
		// Insert into DataBase
		mongoClient.getDatabase("medilogdb").getCollection("users").updateOne(Filters.eq("_id", oId),
	                                                                 Updates.combine(Updates.set("name", userName), Updates.set("email", userEmail), Updates.set("password", userNewPassword))  );
		System.out.println("User Updated");

	}
	



	public void fetchUsers() {
		try  {
			MongoCursor<Document> cursor = mongoClient.getDatabase("medilogdb").getCollection("users").find().iterator();
			while (cursor.hasNext()) {
				
//	    		System.out.println(cursor.next());
				System.out.println(cursor.next().toJson());
				
				
			}
		}  catch (Exception e) {
			System.out.println(" Something went wrong: " + e);
		}
	}
	
}