# Job Applications Tracker
 An application to maintain your jobs pipeline
 
 Readme file - Job Application Tracking system
Team Members: Kripa Shankar, Gaurav Deep, Gabrielle Taylor, and Blair Caton


Explanation of process flow:

System Design:

Design:
This application follows an MVC pattern. For example, the model will be the job data records, views will be the categories and home page, and controllers will control each module (Applied, Offer and home page search).

Modules:

Home/Dashboard:
It contains the statistics of the user’s applications so far: the number of offers, rejections and more. Below the stats, we have a widget to add a new application to the pipeline and a small search function that will enable the user to search for the existing company and change the category.

Categories/Navigation Bar:
Under applied, the user will find the applied jobs so far, and have the ability to modify, filter, and delete application listings. 






 
Job Application Tracking system
Team Members: Kripa Shankar, Blair Caton, Gaurav Deep, and Gabrielle Taylor

Introduction:
The job application tracking system helps job applicants/candidates to streamline their applications pipeline. Even though there are applications like excel, a separate web application can help us categorize and navigate with improved clarity. 
To explain the workflow of the application, let’s consider a person that applies for a job (J1). After he applies, he records the activity to the system and labels the category as applied. If he gets an interview call scheduled, he moves J1 to a new category interview-scheduled. After attending the interview, if he gets an offer, he will move J1 to a new category offer; otherwise, he will move J1 to rejected-category. Thus, the pipeline could help us visualize and track our progress efficiently. Our aim is to build this system in such a way that people can maintain their application pipeline with fewer efforts.

Design:
This application will follow an MVC pattern. For example, the model will be the job data records, views will be the categories and home page, and controllers will control each module (Applied, Offer and home page search).

Modules:
Home/Dashboard: It contains the statistics of the applications so far: the number of offers, rejections and more. Below the stats, we have a small search function that will enable the user to search for the existing company and change the category. For example, a user can search for a company and retrieve its current label; then, he can change and hit submit. The changes will get saved.

Categories/Navigation bar: Under applied, the user will find the applied jobs so far, and likewise in other categories.


Technology:
We will used XML, JSP, Spring/Hibernate, and Redis






 
Web App Semester Group Project Technical Proposal
Team Members:  Kripa Shankar, Blair Caton, Gaurav Deep, and Gabrielle Taylor

Design Summary:

The Job Application Tracking (JAT) system helps job applicants/candidates to streamline their applications pipeline. Even though there are applications like excel, a separate web application can help us categorize and navigate with improved clarity. In order to meet full project requirements within the given timeframe, we will implement features including: Log in/Register, Home/Dashboard, Categories/Navigation bar. In general terms, our application will use Java Server Pages (JSPs), Extensible Markup Language (XML), Spring/Hibernate, react, Apache solr and Redis technologies.

Functionality/Views: 

Log in/Register: 

New users register a spot in the application, and the return users would log in.

Home/Dashboard:

It contains the statistics of the applications so far: the number of offers, rejections and more. Below the stats, we have a widget to add a new application to the pipeline and a  small search function that will enable the user to search for the existing company and change the category.

Categories/Navigation Bar:

Under applied, the user will find the applied jobs so far, and likewise in other categories


Architecture: 

Our Job Application Tracking (JAT) web application uses a three-tiered approach, where application components can be conceptually separated into three separate tiers: Presentation Tier, Application Tier, Data Tier. It provides a way to maintain code more flexible and efficiently.

 

Model-View-Controller: 

The three-tiered architecture allows the Job Application Tracking (JAT) system to employ the principles of model-view-controller design. 


System Design:

 



Explanation:

1.	Application Tracking System:  This system helps job applicants/candidates to streamline their applications pipeline. 

2.	Create jobs pipeline: This module helps to create jobs based on the applicants/candidates profile, which helps the system to create customized and/or specified jobs.
3.	Search job/modify: If the potential applicants/candidates would not be able to find their jobs in the “Create jobs pipeline” module, then the applicants have the options to switch to the “Search job/modify” module, which assists the applicants to find and modify their jobs, so that they should be able to find alternatives.

4.	Modify jobs pipeline: This module comes into play based on the potential applicants modifications in the job  search module. If the applicant made any change/modification in their job, then this module makes changes in the database accordingly. If there is no such modification occurs, then the “Create job pipeline” module streamlines the jobs and saves into the database directly.  

5.	Update stats pipeline: As all the applications are stored in the database and after processing all the potential applicants would be able to get a status on their applications. In the “Update stats pipeline” module, all the applications are categorized: applied, interview-scheduled, offer, rejected. It helps to streamline the update status on the potential applications.

6.	Update views: This module will show the final updated change made by the applicant on the application before the “Modify jobs pipeline” module saves their changes permanently into the database.

7.	ATS DB: It is a Database Management System or Database Server, which stores the data of all potential applicants and their applications. Generally, it structures data with the redis and Spring boot.

Data design/Backend:

We use Backend as Spring boot. We create REST services using spring and connect it to the frontend.
We collect company names available through XML data and connect it to the system.

We use Redis DB, a no sql database, for this system. We choose this as Redis is extremely fast, works well with the large data and blends well with Spring boot. As this is not like a relational database, we decided just to show the general code snippets and idea of Redis.

Redis is a key-value datastore. Thus, we create a redis template in our spring application, and through hashoperations, we do the CRUD (create, read, update and delete).


Let’s say we have an object jobApplication, and it has attributes:

Private class JobApplication{
Private String jobId;
Private String category;
Private String company;
Private String description;
………...

}

private RedisTemplate<String, jobApplication> redisTemplate;

    private HashOperations hashOperations;

 //REDIS initialization
    public JobsRepositoryImpl(RedisTemplate<String, User> redisTemplate) {
        this.redisTemplate = redisTemplate;

        hashOperations = redisTemplate.opsForHash();
    }



//Save a job application post
    @Override
    public void save(User user) {
        hashOperations.put("jobApplication", user.getId(), user);
    }

    @Override
    public Map<String, User> findAll() {
        return hashOperations.entries("jobApplication");
    }

//Find jobs by id
    @Override
    public User findById(String id) {
        return (User)hashOperations.get("jobApplication", id);
    }


//Save a  job
    @Override
    public void update(jobApplication job) {
        save(job);
    }

//Delete a job
    @Override
    public void delete(String id) {

        hashOperations.delete("jobApplication", id);
    }



As above, we work with the database through objects, and we create necessary REST services to get and send the JSON response.



