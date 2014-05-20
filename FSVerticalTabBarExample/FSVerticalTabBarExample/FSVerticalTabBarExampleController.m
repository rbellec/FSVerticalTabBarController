//
//  FSViewController.m
//  FSVerticalTabBarExample
//
//  Created by Truman, Christopher on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSVerticalTabBarExampleController.h"
#import "FSVerticalTabBarController.h"

@interface FSVerticalTabBarExampleController () {
    NSArray* viewControllers;
}
    
@end

@implementation FSVerticalTabBarExampleController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    
    // Create view controllers
    NSMutableArray* controllersToAdd = [[NSMutableArray   alloc] init];
    for (int i=0; i<4; i++) {
        // Do it the usual way : a controller with title and a tabBarItem
        NSString            * title  = [NSString stringWithFormat:@"tab %d", i+1];
        UIViewController    * view   = [[UIViewController alloc] init];
        view.tabBarItem              = [[UITabBarItem     alloc] initWithTitle:title image:[UIImage imageNamed:@"magnifying-glass.png"] tag: 0];
        
        [controllersToAdd addObject:view];
    }
    
    // Set a background color to each view
    [((UIViewController*)[controllersToAdd objectAtIndex:0]).view setBackgroundColor:[UIColor blueColor     ]];
    [((UIViewController*)[controllersToAdd objectAtIndex:1]).view setBackgroundColor:[UIColor redColor      ]];
    [((UIViewController*)[controllersToAdd objectAtIndex:2]).view setBackgroundColor:[UIColor greenColor    ]];
    [((UIViewController*)[controllersToAdd objectAtIndex:3]).view setBackgroundColor:[UIColor purpleColor   ]];
    

    viewControllers = [NSArray arrayWithArray:controllersToAdd];
    
    //set the view controllers of the the tab bar controller
    [self setViewControllers:viewControllers];
        
    //set the background color to a texture
    //[[self tabBar] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ios-linen.png"]]];
    NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,(id)[UIColor lightGrayColor].CGColor, nil];
    self.tabBar.backgroundGradientColors = colors;
    
    self.selectedViewController = ((UIViewController*)[viewControllers objectAtIndex:1]);
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

-(BOOL)tabBarController:(FSVerticalTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([viewControllers indexOfObject:viewController] == 3) {
        return NO;
    }
    return YES;
}

@end
