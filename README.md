# Project-Medilog
#Technogies used -> Microsoft Azure , Java , Html , Css , Javascript

Introduction to the project

Medilog
•	Medilog is online Log Medicines application.
•	It’s an easy to you website which helps you to Log the Medicines Record  ,  View All Previous saved records .
•	We can Edit  , Delete and Update the saved record as well .
•	Being a component based website rendering time has been improved and easy to use user interfaces helps the user can Saved the record of their Medicines. 



Our Idea is : -

It's tough to remember the name of your all medicines and their treatments So, webapp called Medilog’s services include to provide you to log (or add) your medicines details in your account and whenever you need it in future, you just simply search it for on the basis of treatments, medicine name, expiry date or datetime etc. User can also update or delete his medicines details.  In this project we are using MongoDB as database to store user’s data. MongoDB is an open-source NoSQL database management program. NoSQL is used as an alternative to traditional relational databases. NoSQL databases are quite useful for working with large sets of distributed data. MongoDB is a tool that can manage document-oriented information, store or retrieve information. 

 Unique Features  of the System

This WebApp use MongoDB as a backend database which is NoSQL database.
It is quite fast to interact with the data. Records loads very fast in app. We enhance the searching in records, users can search on the basis of not only medicine name but treatment, expiry date and quantity can be used a keyword in search. User can also edit his profile or can change password.


Requirement To Run Our Project :-

Performance Requirement:
Processor : Intel core i3 or above Processor Speed : 2.40 GHz CPU RAM : 2 GB or above
Hard disk utilization : 300 MB or above

Authentication with  Email/Password -> The user is firstly authenticated with MongoDb  ,only then he will be able to perform operations.
![Screenshot 2022-02-05 215436](https://user-images.githubusercontent.com/54720172/152649887-d1a4add4-052c-4103-998b-b906e2940049.png)

Login page :- 

![image](https://user-images.githubusercontent.com/54720172/152650191-77877c08-949f-469f-ade8-50922420df2d.png)

Register Page for new User:-
 
 ![image](https://user-images.githubusercontent.com/54720172/152650213-553156f6-9bd2-46bd-8fd9-3c6b628752eb.png)

Home Page- User Interface with different options to add , edit, view , delete with easily.
![image](https://user-images.githubusercontent.com/54720172/152650104-6a52e2a3-faf1-49d9-a94d-6faef89c64a0.png)

Add Medcine Details:- 
![Screenshot 2022-02-05 223024](https://user-images.githubusercontent.com/54720172/152651122-b74c329b-d827-4a8e-82b5-e79b5c8b9f81.png)


The user can Update or Delete your saved Data  with in no time digitally. The all operatons are done in mongoDB.
![Screenshot 2022-02-05 223114](https://user-images.githubusercontent.com/54720172/152651102-94d6679b-d69e-4d97-98b4-ec6cb6065f37.png)


Azure :

# Docs for the Azure Web Apps Deploy action: https://github.com/Azure/webapps-deploy
# More GitHub Actions for Azure: https://github.com/Azure/actions

name: Build and deploy JAR app to Azure Web App - Medilog

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: windows-latest

    steps:
      - uses: actions/checkout@v2

      - name: Set up Java version
        uses: actions/setup-java@v1
        with:
          java-version: '8'

      - name: Build with Maven
        run: mvn clean install

      - name: Upload artifact for deployment job
        uses: actions/upload-artifact@v2
        with:
          name: java-app
          path: '${{ github.workspace }}/target/*.jar'

  deploy:
    runs-on: windows-latest
    needs: build
    environment:
      name: 'production'
      url: ${{ steps.deploy-to-webapp.outputs.webapp-url }}

    steps:
      - name: Download artifact from build job
        uses: actions/download-artifact@v2
        with:
          name: java-app

      - name: Deploy to Azure Web App
        id: deploy-to-webapp
        uses: azure/webapps-deploy@v2
        with:
          app-name: 'Medilog'
          slot-name: 'production'
          publish-profile: ${{ secrets.AzureAppService_PublishProfile_38300e60c33b418faa0eb62b60cb6498 }}
          package: '*.jar'

