# Hazel Website
Our project is the web component of the Hazel mobile app by 412 Technology. Using the website in conjuction with the app, 
users can explore various ways to offset their carbon footprint. 

## Release Notes

### Version 0.3.0

#### New Features
* Impact Page added
* Cart Page added
* New filters to search projects with added
* Projects can be searched by exact name


#### Bug Fixes
*  Overflow in Navigation Bar design has been fixed
*  Filters can now be cleared
*  Retrieving projectsnow automatically updates the UI
*  Other filters aside from favorites can now be applied

#### Known Issues
* Navigation Bar displays wrong tab in highlighted color
* Could find a better solutionto updating the UI for filterinf projects in search
* Shopping and cart will need to be updated to be more dynamic
* Widget usage and renderflex errors


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


### Version 0.1.0

#### New Features
* Login screen user authentication 
* User profile page now added 
* User settings page now added 

#### Bug Fixes 
* N/A
