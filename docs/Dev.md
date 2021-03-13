# Developer Docs

### Authors:

CIS 422 @ University of Oregon  
Fetch: The Tinder for Doggy Playdates  
Ronny Fuentes, Kyra Novitzky, Jack Sanders, Stephanie Schofield, Callista West

Last Modified March 12, 2021

## Setup

Please follow the [setup instructions](https://github.com/JackSanders1998/CIS422Proj2/install.md) for developers.

## A high level overview

Fetch consists of four main components: User account information, a login screen, a deck of other profiles, and the match page, to see all of the matches you have made. User account information and the login screen are meant to set up profiles, whether that be for existing or new users. User account information is meant for new users who need to add their dog’s information such as a profile picture, personal details, etc. While the login screen is for users who would like to access their previously created account, including previously stored information, data, and activity. The Deck and matching features are components of the system that allow for the logistics behind matching to occur, or in some cases to not occur. Matching with a user will provide the current user with their match’s email to allow for communication outside of the application. 

## File directories and functionality

### Login & Sign-UP

The login or sign-up page is where users will have the option to either create a new account with Fetch or return to their existing account. If the user is new, they’ll be asked to supply a valid email address and password to gain access to the application. Otherwise, if the user has an account, they’ll return to it, where they’ll have access to all their history within the application. 
Incorrect email and password will give the user a notification that their credentials do not match an existing user.

### Profile

The profile is initially visited if a new user has just created an account. Before they can begin to find compatible matches, they must first enter all of their dog’s information. The information entered will be appended into the FireBase entity “Users”. Their information will be stored into separate arrays to separate specific information such as dog breed. Users will always be able to access, and/or edit their information (profile) at any point in time, provided they’ve made an account. By pressing the update button on the profile page, the information will be updated in the FireBase.

### Matches

The Deck is the core functionality that allows for Fetch to create matches for various users. The operation can be visualized similar to a deck of cards that are all facing up. A user will go through each card, or in this case dog profile, 1 by 1 and determine whether they think this owner and pup will make a good fit for a future playdate. Once a user has made a decision on a profile by accepting or declining, that profile will leave the deck and enter one of two database entities: Matched and Declined..

