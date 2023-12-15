# ExerciseTracker

This repository hosts the iOS ExerciseTracker app

## Getting Started

### Required Software

You will need to use a Mac and download Xcode in order to run this app.

You'll need an Apple ID in order to download Xcode. Download it using [this link](https://developer.apple.com/download/applications). You will need to become an Apple Developer (you will be prompted to do this, and agree to their terms and conditions) - this is free.

NOTE: We suggest downloading via the link above and not via the App Store to have more control over the Xcode version, due to how the App Store handles version updates with Xcode.

Select the latest stable version of Xcode (i.e not a beta release), then click Download Xcode XX.X.X (X.XXGB) to download a compressed file:

![Screenshot of the Apple Developer website to select the version of Xcode](docs/assets/xcode-website-selection.png)

Select a location to save the file:

![Screenshot showing the desired save location for Xcode](docs/assets/download-xcode.png)

Once Xcode has downloaded, go to the folder where you saved the download (Downloads by default) and double click on Xcode_XX.X.XX.xip to extract the contents from the compressed file:

![Screenshot showing Finder extracting Xcode from the compressed download](docs/assets/xcode-extraction.png)

Once complete, you can launch Xcode from that location, however you can move it to the Applications if you desire by dragging Xcode to Applications (on the left hand side of Finder), however this may require Administrator permission:

![Screenshot showing Finder extracting Xcode from the compressed download](docs/assets/finder-admin-permissions.png)

![Screenshot showing Finder extracting Xcode from the compressed download](docs/assets/xcode-in-applications.png)

When launching Xcode for the first time, you might be prompted to enter the administrator's name and password to continue:

![Screenshot showing Xcode is being downloaded](docs/assets/xcode-admin.png)

You'll need to accept the terms and conditions that Apple present in order for Xcode to run:

![Screenshot showing Xcode's Terms and Conditions](docs/assets/xcode-terms.png)

A dialog will be presented showing which additional simulators and SDKs you want to install. Check the box for iOS (watchOS and tvOS can remain unchecked):

![Screenshot showing Xcode SDK installation selection](docs/assets/xcode-install-sdk.png)

Xcode will download and install the additional iOS SDK:

![Screenshot showing Xcode's installation progress](docs/assets/xcode-installing.png)

Your Xcode installation and setup is now complete. Depending on your internet speeds, the iOS SDK might be downloading still. Either way, the Xcode welcome screen should be showing, along with the What's New in Xcode screen:

![Screenshot showing Xcode's completed installation](docs/assets/xcode-open-project.png)

![Screenshot showing Xcode's completed installation](docs/assets/xcode-whats-new.png)


### Conventional Commits
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) are required for each pull request to ensure that release versioning can be managed automatically.
Please ensure that you have enabled the Git hooks, so that you don't get caught out!:
```
git config core.hooksPath hooks
```
