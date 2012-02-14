# What are these categories for?

While building a kids math game for iOS, I needed a custom UIButton that would make the user's profile picture look like a bordered photo that was naturally taped or paperclipped to the notebook. 

![screenshot](https://github.com/remotevision/CurledViews/blob/master/screenshot.png?raw=true)


# Using the library

You'll need to import the CurledViewBase and either UIButton+Curled or UIImageView+Curled files into your project:

To use it: 

	// instantiate your UIButton or UIImageView (outlet or programatically, doesn't matter)
	// if UIButton, specify the UIControlState
	[photoButton setImage:[UIImage imageNamed:@"raptor_face.png"] borderWidth:5.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0 forState:UIControlStateNormal];
	
	
That's it! Feel free to fork and add pull requests so we can incorporate your changes for everyone.