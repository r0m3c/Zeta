# Welcome to: Zeta

<img src="https://user-images.githubusercontent.com/71786791/151467472-0b6e3a6c-15a0-48f7-a350-b5b45473ecfb.png" alt="drawing" style="width: 200px; height 200px;"/>

## Table of Content
- [App Description](#App-Description)
- [App Background](#App-Background)
- [Figma Design](#Figma-Design)
- [App Technology](#App-Technology)
- [App Features](#App-Features)
    - [Profile View](#Profile-View)
    - [Feed View](#Feed-View)
    - [Upload View](#Upload-View)
    - [Sign Out](#Sign-Out)
- [Firebase Database](#Firebase-Database)
    - [Authentication](#Authentication)
    - [Saved Data](#Saved-Data)
    - [Storage](#Storage)
- [Future Features](#Future-Features)
- [Wrap Up](#Wrap-Up)
- [License](#License)


## App Description
<p>
    Hello 👋, my name is Leandro Gamarra. Welcome to my newest iOS Application project, Zeta. Zeta is a social media Application, where a user will be able to sign into the app, through Firebase Verification, and begin posting/uploading posts, with comments, to the main screen page. On top of this, anyone who has the app installed will be able to view each users posts, and will be able to comment on other people's posts. Furthermore, the user will be able to manag their account, change their profile picture, change their bio description and so much more. Read more below to learn about all of the app's features.
</p>

## App Background
I first began this project during the Fall semester of 2021. During this semester I was a CodePath iOS Development Tech Fellow. In short, with another peer, one day a week, I taught a group of 15 students how to build iOS Applications on Zoom for about 1 hr each day. During the second half of the semester, the 15 students were split into groups of 3-4 to build their own app as a team. This is when I decided to build this app, so I could join my peers in this challenge. This then led me to begin designing on a Figma page, and below you'll see the final product.

## Figma Design
Below is the Figma Design that I started from scratch as I thought of features to add to my application.
<img src="https://i.imgur.com/bpMQV4A.png" alt="drawing" style="width: 700px; height 350px;"/>

## App Technology
- Front-end: SwiftUI
- Back-end: Firebase Database
        - Firebase Analytics
        - Firebase Core
        - Firebase Auth
        - Firebase Firestore
        - Firebase Storage
- Google Sign In
- Apple Sign In
- Lottie Animations
- Git/github
- CocoaPods

## App Features

### Profile View
- <b>Profile View</b>: is used as the users very own Profile page.
        - Let's first begin with signing into the app, via Google:
            - <img src= "https://i.imgur.com/cYMNjPT.gif" style="width: 200px; height 200px;">
        - Next, the user is also able to sign in via Apple, but I'm not able to display it here, because Apple Sign In isn't allowed via a Simulator
        - Next, after signing in, the user will be able to see their profile picture, profile bio description, see how many posts they have, how many people liked their posts, and will have a Settings button, which I'll go into in a second.
            - <img src= "https://i.imgur.com/00UoyI2.gif" style="width: 200px; height 200px;">
        - Settings Page: at the top right in the Profile view, the user will be able to click on it, and in their they will have many options, which include changing their bio name, bio description, uploading a new profile image, signing out and much more.
            - <img src= "https://i.imgur.com/Kt0FHj1.gif" style="width: 200px; height 200px;">


### Feed View
- <b>Feed View</b>: used as the main page of the app.
        - Here is a quick view of the Feed View:
            - <img src="https://i.imgur.com/ZCv8KD0.gif" alt="drawing" style="width: 200px; height 200px;"/>
        - Next, the user will be able to comment on another users post and Firebase will instantly download/save/and post the comment.
            - <img src="https://i.imgur.com/3ZyIXQA.gif" alt="drawing" style="width: 200px; height 200px;"/>
        - Moreover, the user also has the ability to click on another user's name and look at their profile.
            - <img src="https://i.imgur.com/szGmzg2.gif
" alt="drawing" style="width: 200px; height 200px;"/>
        - Furthermore, the user will also be able to share any posts with their friends, as well as liking the photo.
            - <img src="https://i.imgur.com/COtfERy.gif" alt="drawing" style="width: 200px; height 200px;"/>
        - Lastly, the user will also be able to report a users post if it is innapropriate. This report will be sent to my Firebase Database.
            - <img src="https://i.imgur.com/uplXOAH.gif" alt="drawing" style="width: 200px; height 200px;"/>
            
- <b>Search View</b>: Discover new posts.
        - The user will be able to discover new posts by anyone who uses the application.
            - <img src="https://i.imgur.com/PbSEwR3.gif" alt="drawing" style="width: 200px; height 200px;"/>

### Upload View
- <b>Upload View</b>: Upload a new post to the Feed View and database.
        - The user can upload a photo directly from their photo library. Afterwards, the user will be able to edit and enter a description to that chosen photo.
            - <img src="https://i.imgur.com/hBQvyh7.gif" alt="drawing" style="width: 200px; height 200px;"/>
        - Here is the uploaded image.
                - <img src="https://i.imgur.com/0sIwSZf.gif" alt="drawing" style="width: 200px; height 200px;"/>

### Sign Out
- <b>Sign Out</b>: To sum up, all the data in the app will be saved through my Firebase Database and all the information will be uploaded/downloaded.
        - <img src="https://i.imgur.com/iXjncSp.gif" alt="drawing" style="width: 200px; height 200px;"/>


## Firebase Database

### Authentication
- Here you can get a view of the Firebase Database, but more specifically, the current users who have signed into the app and have an account. 
        - <img src="https://i.imgur.com/Y9I5awT.png" style="width: 600px; height: 300px">

### Saved Data
- <b>Posts</b>: Here you can see all the saved posts that users have posted in the app.
        - <img src="https://i.imgur.com/ZhFMqx0.png" style="width: 600px; height: 300px">

- <b>Reports</b>: Here you can see all the saved reports that users have reported in the app.
        - <img src="https://i.imgur.com/j2e2AhV.png" style="width: 600px; height: 300px">

- <b>Users</b>: Here you can see all the saved users that have signed up in the app.
        - <img src="https://i.imgur.com/z4SmT2w.png" style="width: 600px; height: 300px">

### Storage
- <b>Storage</b>: Here you can see where all images that are uploaded by users and the posts are stored.
        - ![](https://i.imgur.com/MhBz4jw.gif)

## Future Features
In the future, I would like to add a feature where the user will be able to follow any users that they would like, the user can search for specific users, make a separate tab to show app activitiy of users they follow, and a feature where the user would be able to upload short videos. If I do, add these features, then that's when I would publish this app into the App Store.

## Wrap Up
I hope you enjoyed my project. I'll continue working on it.


## License
Copyright [2022] [Leandro Gamarra Montero]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
