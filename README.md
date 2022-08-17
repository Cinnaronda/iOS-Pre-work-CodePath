# Pre-work - iOS Tip Calculator

iOS Tip Calculator is a tip calculator application for iOS.

Submitted by: Sharonda Daniels

Time spent: 12.8 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added automatic calculation - when the user types it automatically calculates!
- [x] Added different UI colors - pick what color you want the app and have it remembered!

## Video Walkthrough

Here's a walkthrough of implemented user stories:
![](https://i.imgur.com/ca2aXH7.gif)

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
- After getting the keyboard to stay up I had a problem with my viewWillDisappear and my viewDidDisappear methods not working, I was never able to figure out how to fix them but I noticed when I take out the keyboard as first responder it works again
- This wasn't necessarily a challenge, but I was wondering if the built-in Source Control on XCode is recommended.

## License

    Copyright 2022 Sharonda Daniels

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
