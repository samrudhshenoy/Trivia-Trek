Trivia Trek 
by Homestead FBLA
Mobile Application Development 2019
https://www.github.com/arthurlafrance/MustangGame

Created by Arthur Lafrance, Raj Raghulan, and Samrudh Shenoy

[IMPORTANT NOTES]:
- When running, a network connection must be present, so that Trivia Trek can successfully access its online resources
- Our app is thoroughly debugged and error-free, but should one be discovered: 
	- Restart the app if necessary
	- Please feel free to utilize the bug reporting system integrated into the app to alert us about the issue

Overview

Trivia Trek is designed to provide an entertaining and educational interface to test a member's knowledge in 5 distinct categories of FBLA: 
- Competitions
- Conferences
- Projects
- FBLA History
- Officers

However, rather than solely implementing a basic question-answer system, we integrated this traditional method into a digital board game to provide a more refreshing, entertaining, and engaging experience for the user.

This app was written in Apple’s Swift language, version 4.2.1, using Xcode version 10. In addition, dependencies were installed using Cocoapods, written in Ruby. Finally, the app’s backend was implemented via a CloudKit database, with the accompanying code written in Swift as well.


Key Features

	⁃	Secure and powerful Cloudkit database to store necessary information both publicly and privately
	⁃	Documented and straightforward code
	⁃	Multiple tutorial/instruction pages within the app to help guide users through its features when necessary
	⁃	Clean user interface designed with both visual appeal and convenience in mind
	⁃	Flexible infrastructure, allowing users to choose between different maps and avatars for a unique experience every game
	⁃	Feedback system to ensure that the user can notify developers of any comments or concerns, such as the discovery of a bug
	⁃	Full Facebook integration to allow users to connect to social media, as well as share their experiences via post, update, or story
	⁃	Customized avatar images offered by the app


Using the app

The following are the recommended methods to use Trivia Trek for various platforms.

Prerequisites

To view the code
Xcode (recommended, requires macOS)
- Can be downloaded from the Mac App Store
Standard text editor (e.g. AppCode, Atom, or Sublime)
- Alternative if a computer with macOS is not available

To run the application on your computer
Device that runs macOS (natively or through a VM)
Xcode/iOS Simulator (Simulator is automatically installed with Xcode)

To run the application on your personal device
iOS 9.0 or newer
- Device that runs macOS
- Xcode
- Apple Developer Account
	- Available to create at developer.apple.com
- Cable to connect mobile device to computer (Lightning to USB-A to USB-C)

Viewing the code

Assuming the prerequisites are met, the following details how to open and view the application’s source code:

 Open Xcode and select "Open another project…"
￼
 Locate and enter the submission folder, and select the white “TriviaTrek.xcworkspace” file
￼
 After opening the workspace, select the uppermost blue “Trivia Trek” file. You may see red stop signs indicating the presence of errors.
￼
 Change the provisioning profile to your own developer account.
 	It may say “Failed to create provisioning profile.”
 Edit the bundle identifier by adding a number to the end and click “Try Again.”
￼
 You can now view all the application’s classes and storyboards.
￼
 Make sure the iOS Simulator is testing the app on an iPhone 6 or newer.
*Note: It is recommended to run Trivia Trek on the iPhone 8 simulator
￼

￼
 To directly download the app onto your phone, plug your own phone into the computer and select your phone as the desired target to download the app on your phone.
 Note: You must have an Apple Developer ID and you may have to approve the application on your iPhone
￼

To run, press the Run button or press Command+R
￼
The build & run status is indicated on Xcode’s menu bar
￼
After the application opens, you will be directed to the home screen after the loading screen passes.
Feel free to browse the app!


App Walkthrough
*For visual references of these pages, please refer to the included app screenshot .pdf files
Pages
	•	Title Page: The main menu screen containing all main navigation options which is presented upon app launch (after the loading screen)
	•	Setup Page: Game configuration page which opens after the Play button on the title screen is tapped
	•	Game Page: Gameplay screen, which launches when the Ready button on the setup page is tapped
	•	Basic Help Pages: 4 adjacent pages which present the user with a brief overview of the application which open when the Help button on the title screen is tapped
	•	Detailed Instruction Page: A scrolling page which presents the user with detailed app usage instructions, and opens when the Full Game Tutorial button on the last basic help page is tapped
	•	Feedback Page: A page where the user can input the details of a bug they find into our database (in the case that one is discovered) which pops up when the Report a Bug button on the title screen is tapped, or when the Submit Feedback button is pressed on the game end screen
	•	Final Page: The page which pops up after a user has successfully completed the game, with options to share their score on Facebook, submit any feedback, or return to the main menu
	•	Facebook Pages: Pages respective to the Facebook feature accessed when a user presses a login or share button on the screen.

Game Mechanics
The game board is comprised of 40 equidistant spaces, and is designed to resemble a choice of either a spring or winter setting, which can be selected by the user. The player moves around the game board, from the start to the finish, by answering questions. Questions are shown, along with 4 multiple choice answers, in a window which pops up at the appropriate time in the game. Based on the answer chosen by the user, the question window will either show the user that they are correct, or reveal the correct answer if the user answers incorrectly. 

Movements are dependent on an answer streak, which is built by answering questions correctly and consecutively. The answer streak is the current number of questions that the user has gotten correct in a row, and is broken when a user incorrectly answers a question. If a user correctly answers a question, their avatar moves half as many spaces as the length of their current streak, rounded up. Should they answer incorrectly, they will not advance on the board. Thus, a lesser score is a better score.


Backend Implementation

Database
Trivia Trek’s database uses Apple’s Cloudkit framework to host and access information about the game’s question and feedback data. It is hosted on Apple’s iCloud servers, with all necessary queries integrated into our application’s code in Swift.


Authors

 Arthur Lafrance (arthurlafrance) - App structure, game technicality, and backend
 Raj Raghulan (rajraghulan) - Graphic design and animations
 Samrudh Shenoy (samrudhshenoy) - App structure, game mechanics, social media integration, and tutorials



Copyright Information

The App Store, iOS, iPhone, iPad, Xcode, and Swift are all registered trademarks of Apple Inc.
Following image acknowledgements are consistent with the organizations’ terms of use
["Stopwatch Icon"](https://www.shareicon.net/tag/timers) image designed by [SHAREICON](shareicon.net)

["CPUPicMale"](https://bcdcog.com/wp-content/uploads/2016/05/profile-default-02.png) image designed by [bcdcog](bcdcog.com)

["CPUPicFemale"](https://bcdcog.com/wp-content/uploads/2016/05/profile-default-03.png) image designed by [bcdcog](bcdcog.com)

["SnapchatLogo"](https://www.vexels.com/png-svg/preview/137411/snapchat-icon-logo) image designed by [vexels](vexels.com)

["FacebookLogo"](https://www.iconfinder.com/icons/278448/blue_facebook_facebook_facebook_logo_like_icon) image designed by [ICONFINDER](iconfinder.com)

["Gift Icon"] (http://freeiconshop.com/icon/gift-icon-flat/) image designed by [ICONSHOP](freeiconshop.com)

["Game Icon"] (https://housing.umn.edu/files/game-icon) image designed by [University of Minnesota](housing.umn.edu)

All other images and icons are completely original["Stopwatch Icon"](https://www.shareicon.net/tag/timers) image designed by [SHAREICON ](shareicon.net)

["CPUPicMale"](https://bcdcog.com/wp-content/uploads/2016/05/profile-default-02.png) image designed by [bcdcog] (bcdcog.com)

["CPUPicFemale"](https://bcdcog.com/wp-content/uploads/2016/05/profile-default-03.png) image designed by [bcdcog] (bcdcog.com)

["SnapchatLogo"](https://www.vexels.com/png-svg/preview/137411/snapchat-icon-logo) image designed by [vexels] (vexels.com)

["FacebookLogo"](https://www.iconfinder.com/icons/278448/blue_facebook_facebook_facebook_logo_like_icon) image designed by [ICONFINDER] (iconfinder.com)

["Gift Icon"] (http://freeiconshop.com/icon/gift-icon-flat/) image designed by [ICONSHOP] (freeiconshop.com)

["Game Icon"] (https://housing.umn.edu/files/game-icon) image designed by [University of Minnesota] (housing.umn.edu)

["Base Resource"](https://www.rpgmakerweb.com/support/information/eula) image designed by [RPGMAKER MV](rpgmakerweb.com)

["Play Icon"] (https://www.flaticon.com/free-icon/play-button_375) image designed by [Flaticon] (flaticon.com)

["Help Icon"] (https://thenounproject.com/term/help/28807/) image designed by [Noun Project] (thenounproject.com)

["Help Icon"] (https://thenounproject.com/term/help/28807/) image designed by [Noun Project] (thenounproject.com)

["Instructions Icon"] (https://www.flaticon.com/free-icon/view-details_1755) image designed by [Flaticon] (flaticon.com)

["Bug Icon"] (https://pngtree.com/free-icon/bug-fixes_412454) image designed by [pngtree] (pngtree.com)

All other images and icons are completely original


Note: Trivia Trek gains access to basic and publicly available social media information through a user log-in, but in no way stores or shares such information.
