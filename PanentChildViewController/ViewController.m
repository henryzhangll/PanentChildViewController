//
//  ViewController.m
//  PanentChildViewController
//
//  Created by apple on 2020/4/21.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *vc = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
