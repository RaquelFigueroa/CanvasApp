# Lab 7 - *CanvasApp*

**CanvasApp** is an app that allows users to use gestures in order to create fun pictures using a variety of images.

Time spent: **5** hours spent in total

## User Stories
ls
The following **required** user stories are complete:

- [x] Add and Configure View Elements (+1pt)
- [x] User can use a pan gesture to move the position of the tray (+1pt)
- [x] The tray will continue to the up or down position based on the direction the user was last panning (+1pt)
- [x] User can use a pan gesture to drag faces from the image tray to the canvas (+1pt)
- [x] User can pan faces on the canvas (+1pt)

The following **stretch** user stories are implemented:

- [x] Tray bounces when returning to it's up or down positions (+1pt)
- [ ] User sees as new face scale up and back down to simulate a "picking up and dropping" appearance (+1pt)
- [x] User can use a pinch gesture to scale faces up or down (+1pt)
- [x] User can use a rotation gesture to rotate the position of faces on the canvas (+1pt)
- [x] User sees the tray arrow adjust to point up or down in relation to the position of the tray (+1pt)
- [ ] If the user releases a face in the tray area, the face animates back to it's original position on the tray (+1pt)
- [x] User can use a double tap gesture to delete a face (+1pt)
- [x] If the user attempts to drag the tray above the open position, it should began a "frictional drag" (+1pt)
- [ ] App tray features custom images (different from the supplied image assets) (+1pt)
- [ ] User can choose between different canvas backgrounds (+1pt)
- [ ] User can can swipe horizontally in the image tray to access more images (+1pt)
- User can snap a photo to create...
- [ ] a custom canvas background (1pt)
- [ ] custom images in the image tray (1pt)
- [ ] User can double tab the canvas to "reset" the Canvas (1pt)
- [ ] User can triple tap an image on the canvas to see a custom animation sequence (1pt)
- [ ] User can save an image of the canvas to the camera role (1pt)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I am wondering where my peers find resources for learning about different ways of designing their apps. What are their inspirations?
2. I am also wondering if my peers rely on the Xcode interface to add layout specifications or is it done in code?

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/RaquelFigueroa/CanvasApp/master/images/CanvasAppDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I had some trouble with assigning the pan gesture recognizer to the newly created image. I mistakenly added it to the original emoji image in the tray, so the tray images would leave the tray and move instead of the new images. It was an easy fix, but one that was too easy to overlook and cause some stress!

## License

Copyright 2018 R. Figueroa

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
