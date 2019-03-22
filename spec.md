# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
  -used has_many, belongs_to, and has_many_through in Model classes
- [x] Include more than one model class (e.g. User, Post, Category)
  -6 Model classes: Nomad, Residence, Landlord, Roommate, RoommateToNomadLoan, NomadToRoommateLoan
  -This number of classes allows for feature expansion
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  -11 has_many relationships in 4 classes
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  -7 belongs_to relationships in 4 classes
- [x] Include user accounts with unique login attribute (username or email)
  -user logs in with username
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  -user(Nomad) can delete Residences, NomadToRoommateLoans, and RoommateToNomadLoans directly, and Roommates via Residences.
- [x] Ensure that users can't modify content created by other users
  -validation prevents user from accessing any data without logging in, and profiles only display data from current user.
- [x] Include user input validations
  -validations present on login and all controller actions not POST, PATCH, or DELETE.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  -Sinatra Flash enabled.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
  -not as many as I should have--see below.
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
  -Some commits, particularly commit 0f66f370d35c2b80f7d2311fcdb5e539bdb4ec9a, include far too much work for a single commit.  In 1 or 2 cases I even forgot to commit between coding sessions overnight.
