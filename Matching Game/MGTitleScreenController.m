//
//  MGTitleScreenController.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/23/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGTitleScreenController.h"

@interface MGTitleScreenController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameBoardSelector;

@end

@implementation MGTitleScreenController

- (void)viewDidLoad {
    self.gameBoardSelector.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"segmentedIndex"        ];
}

- (IBAction)dealButtonClicked:(id)sender {
    int segmentedControllerIndex = [self.gameBoardSelector selectedSegmentIndex];
    [[NSUserDefaults standardUserDefaults] setInteger:segmentedControllerIndex forKey:@"segmentedIndex"];
    
    if (segmentedControllerIndex == 0) {
        [[NSUserDefaults standardUserDefaults] setInteger:4 forKey:@"numberOfCards"];
        [self performSegueWithIdentifier:@"2by2segue" sender:sender];
    } else if (segmentedControllerIndex == 1) {
        [[NSUserDefaults standardUserDefaults] setInteger:16 forKey:@"numberOfCards"];
        [self performSegueWithIdentifier:@"4by4segue" sender:sender];
    } else if (segmentedControllerIndex == 2) {
        [[NSUserDefaults standardUserDefaults] setInteger:36 forKey:@"numberOfCards"];
        [self performSegueWithIdentifier:@"6by6segue" sender:sender];
    }
}

@end
