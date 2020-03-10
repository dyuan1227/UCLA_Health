## Introduction
As the amount of applications in the UCLA health system increase rapidly, the DIAAG team decided to develop an independent system with RESTful API to manage user access to specific applications as well as their permissions with the application. My project within the team focuses on the graphical interface to this system such as adding, deleting and searching users, as well as modifying their permissions. My contribution to the team will enable the DIAAG man- agement team to alter user permissions from a web-based interface. In addition, non-programmer members of the team will be able to make adjustments based on the permissions of any specific user. Previously, this can only be done by directly talking with the programmers and let them manually perform those tasks in the SQL database. This web service removes the barrier of program- ming knowledge, and anyone can perform the above tasks independently and efficiently.

## Core functionalities
- Log-in will be restricted to users with an elevated permission
- The system will present a view that allows authorized personnel to view what
people are given which permission for a given application
- The system will present a view that allows authorized personnel to view all permissions a given user has
- The system will allow authorized personnel to perform CRUD operations (Create, Read, Update, Delete) for user’s and their permissions.
- The system will allow authorized personnel to perform CRUD operations to application permissions.


## Views
### index.gsp
This is the interface that guides users to log in with their UCLA Health credentials

### home.gsp
On the home page, one can create and search new users as well as assign permissions from any applications. When searching, one can type the informa- tion in the email field, which is the same as a user’s username. The data in the following data tables will change correspondingly to the new information entered. Entering information in the first name and last name fields update the User data table solely, but not the UserRole data table. There is a but- ton that navigate people to the permission page, but only when this person is given the access. One can also choose to log out directly back to the log in page.

### permission.gsp
On the permission page, one can create and search permissions from any applications. The search feature is also available by entering the information in the permission id field. This page is designed specifically for the programmers to create and delete new applications and permissions.




## Controllers
### LoginController
In the LoginController, the credentials are verified through the UCLA val- idation services. One can only successfully log in by entering valid username and password.

### HomeController
The HomeController takes care of many functionalities as followings:
1. Checking whether the visitor has the permission to visit the home page. 2. Logging out.
3. Create a new user and save it to the User database.
4. Create a new permission and save it to the Role database.
5. Combine the new user and permissions and save it to the UserRole table. 6. Checking whether the visitor has the access to the permission page.
7. Adding multiple permissions to one user in one step.
