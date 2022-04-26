# Hazel Website
Our project is the web component of the Hazel mobile app by 412 Technology. Using the website in conjuction with the app, 
users can explore various ways to offset their carbon footprint. 

[Installation Guide](https://github.com/ntjim/1330-HazelSite#installation-guide) | [Release Notes](https://github.com/ntjim/1330-HazelSite#release-notes)

-----
## Installation Guide 

#### Prerequisites 

 1. Flutter SDK to run the web app. Follow instructions [here](https://docs.flutter.dev/get-started/install) to install.
 2. Chrome to debug. Download [here.](https://www.google.com/chrome/downloads/)
 3. Optionally an IDE such as [Visual Studio Code](https://code.visualstudio.com/) or [IntelliJ IDEA](https://www.jetbrains.com/idea/) that supports Flutter and Dart and their corresponding plugins.

#### Cloning the GitHub Repository 

 1.	Go to the repository link [here](https://github.com/ntjim/1330-HazelSite)
 2.	Follow the instructions [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) for your machine’s OS and your preferred method of cloning 

#### Setting Up A Firebase Project

- If you already have a Firebase project you would like to use, skip to step 3
- If you already have Node.js installed on your machine, skip to step 4
- If you already have the Flutterfire CLI installed, skip to step 5

 1. Log in to or create an account at https://firebase.google.com/ 
 2. Click "Go to console" and then "Add project"
 3. Install the most recent version of Node.js that is compatible with your machine from [here](https://nodejs.org/en/download/)
 4. Follow the " Set up or update the CLI" directions here to install the Flutterfire CLI via the npm option for your machine's OS
 5. Navigate via Terminal/Powershell (depending on your OS) to the folder with the Hazel repository in it, where you would like to have the Firebase Project then continue
 6. Proceed to follow the "Initialize a Firebase project" instructions [here](https://firebase.google.com/docs/cli#initialize_a_firebase_project) (same site as in step 4 but further down the page)
    - During the `firebase init` step, select “Authentication”, “Firestore Database”, and  Storage”
    - During the `firebase init` step, select "Use an existing project" and select the project you made in ealier steps
 8. Run the command `flutter run –d chrome` to deploy locally 
 9. Host the project via your preferred hosting platform

#### Troubleshooting

* Check Flutter docs for difficulties running Flutter commands
* If neither Terminal or Powershell recognizes the `flutter` or `firebase` commands, try to run then from the project directory via Git Bash

-----

## Release Notes

### Version 1.0.0

#### New Features 
* About Us Page added
* Impact History Page added
* FAQ added

#### Bug Fixes 
* Fixed misalignment of title text in navigation bar 
* Fixed rounding of total price in cart, now rounds to two decimal places 
* Hazel coins and Hazel trees now calculate in cart 
* Back buttons aligned to the left on all subpages of account settings 
* Graphs show x-axis on community page 

#### Known Issues
* When page size is too narrow, renderflex issues occur  
* Profile picture alignment is slightly off center  
* Subtraction of all products in cart sometimes displays negative zero  
* Each individual project page does not have a unique URL 

-----
### Version 0.4.0

#### New Features
* Community Page added
* Redesigned shopping and cart pages  
* Product price sum displayed in cart summary 
* Implemented routing 


#### Bug Fixes
* ParentDataWidget error on Login click fixed  
* Products can be added/removed from cart  
* Navigation Bar (NavBar) now highlights correct tab in white 
* Reloading the site no longer reroutes to homepage 
* User data is now being pulled into the Me Page 
* Project Image is now in a fixed size rather than taking up the entire projects card on the Me Page 
* Project search force reloading resolved 

#### Known Issues
* Sum of products prices does not correctly update when user goes back to a non-empty cart from shopping page (only when no new products are added)  
* Current products in cart not reflected on reloaded shopping page  
* Importing project images on the Me Page using the ProjImg() class causes a flash of red when loading the image 
* Pages requiring passed in parameters use different navigation and do not get unique URLs 
* Selecting favorite project defaults to project number 1 once project search page is reloaded  
* Searching UI doesn’t update  
* New NavBar overflows  

-----
### Version 0.3.0

#### New Features
* Impact Page added
* Cart Page added
* New filters to search projects with added
* Projects can be searched by exact name
* Navigation Bar logo routes all pages to Home 


#### Bug Fixes
*  Overflow in Navigation Bar design has been fixed
*  Filters can now be cleared
*  Retrieving projectsnow automatically updates the UI
*  Other filters aside from favorites can now be applied

#### Known Issues
* Navigation Bar displays wrong tab in highlighted color
* Could find a better solutionto updating the UI for filtering projects in search
* Shopping and cart will need to be updated to be more dynamic
* Widget usage and renderflex errors

-----
### Version 0.2.0

#### New Features
* Project Search page
  * See all available projects
  * Click on a project to learn more about it
  * Filters are availalble (but not usable, see Known Issues)
* Individual Projects page
  * Foundation for the page used to display more information about a given project
  * Currently shows only the Project name (image format issues, see Known Issues)
* Sign Up page
  * User can create an account if they do not have one
* Account Settings page
  * UI for seeing user's account information (email, password, payment information)
  * UI for ability to change password

#### Bug Fixes
*  A default profile image was previously not displaying; the image now displays correctly

#### Known Issues
* Asynchronous updating and retrieval of  user's favorite projects list requires manual refresh of projects search page to update the UI. This needs to be made automatic
* Filters only work for the Favorites filter
* There is no button to clear filters
* Image formatting issues (cropping) for the specific project images need to be resolved
* Navigation Bar displays wrong tab in highlighted color

-----
### Version 0.1.0

#### New Features
* Login screen user authentication 
* User profile page now added 
* User settings page now added 

#### Bug Fixes 
* N/A
