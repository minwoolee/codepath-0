//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Min Lee on 1/17/17.
//  Copyright © 2017 Min Lee. All rights reserved.
//

#import "SettingsViewController.h"

NSString * const kDefaultTipIndex = @"DEFAULT_TIP";

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipValueControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber *defaultTipIndex = [SettingsViewController getDefaultTipValueIndex];
    if (defaultTipIndex != nil) {
        self.defaultTipValueControl.selectedSegmentIndex = [defaultTipIndex integerValue];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDefaultTipValueChange:(UISegmentedControl *)sender {
    NSNumber *index = @(self.defaultTipValueControl.selectedSegmentIndex);
    [self changeDefaultTipValueIndex:index];
}

- (void)changeDefaultTipValueIndex:(NSNumber*)index;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:index forKey:kDefaultTipIndex];
    [defaults synchronize];
}

+ (NSNumber*)getDefaultTipValueIndex;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *index = [defaults objectForKey:kDefaultTipIndex];
    return index;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
