## Requirements


* Xcode 12.4

* iOS 14.4+

* CocoaPods

## Installation


#### Xcode 12.4 (mac)


This environment must be installed in order to run Fetch. The download can be found at [Xcode 12](https://developer.apple.com/xcode/)


#### iOS 14.4+


This application has not yet been deployed, but devices must be on version 14.4+ at the minimum in order to run this app.


#### CocoaPods


The Fetch project relies on dependencies through a Podfile. Therefore, CocoaPods must be installed on your local machine, which can be found at [CocoaPods](https://cocoapods.org). 


Pull the repo:
```
"git pull "https://github.com/JackSanders1998/CIS422Proj2/tree/main/Fetch"
```

After the Fetch project is pulled, and CocoaPods is installed, open `terminal` and navigate to where the `Fetch` folder is located. Go into the Fetch folder and run:  
```
pod deintegrate
pod install  
```  

A list of Firebase dependencies should be installed.


While still in the Fetch folder (in terminal) run:  
`open Fetch.xcworkspace`  

This should open the workspace file in Xcode.  

Note: A warning on the left panel will appear 
```
click "update to recommened settings"
click "Perform Changes"
close Xcode
run: open Fetch.xcworkspace
```

#### Running The Simulator  
`XCode > Product > Run`


If any issues occur while running the application, please contact <ronnyf@uoregon.edu>. 

