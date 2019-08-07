# supra-frontend

Front End for SUPRA

## Getting Started

To be able to run the application one needs the following:

* macOS and Xcode 10.3 or greater

This Application is designed based on Apple's 9.7" iPad. To be able to get correct sizes one should choose the iPad pro 9.7" from list of simulator images in Xcode.

Also, to be able to develop and run the application one should possess an apple developer team which the personal developer team is free of charge and one can use their appleID for this reason.

## Dependencies

To make life easier we have used three different Libraries in this project.

* [ReSwift](https://github.com/ReSwift/ReSwift): Used for Redux based state management.
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON): Used to Parse and handle JSON
* [Alamofire](https://github.com/Alamofire/Alamofire): Used for making requests over the network

And we are managing these dependencies using [cocoapods](https://cocoapods.org).
In case one wants to alter or add any dependencies they can do it through Podfile inside Pods folder.

## Development

I have developed this application based on the Redux architecture which makes lifecycle handling much more manageable compared to MVC pattern. For one to further develop this application they need to alter the reducers and in case they need to add Actions they can simply do so by adding a new type of actions in Actions files. The Logical part of the application resides on the Redux side and one can easily adjust what application do on the case a specific event takes place.

I have collected different parts of the application in their respective folders so one can easily use file structure to get an idea on what are the responsibility and application of each part of the code.

To familiarize oneself with redux architecture one can visit this site which is a quick 10 min read: [link](http://reswift.github.io/ReSwift/master/getting-started-guide.html)
