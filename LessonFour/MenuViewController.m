//
//  MenuViewController.m
//  LessonFour
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIView *bG_Tab1;
@property (weak, nonatomic) IBOutlet UIView *bG_Tab2;
@property (weak, nonatomic) IBOutlet UIButton *button_Tab1;
@property (weak, nonatomic) IBOutlet UIButton *button_Tab2;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bG_Tab1.layer.borderWidth = 1.0;
    self.bG_Tab1.layer.cornerRadius = 7.0;
    
    self.bG_Tab2.layer.borderWidth = 1.0;
    self.bG_Tab2.layer.cornerRadius = 7.0;
    
    [self.button_Tab1 addTarget:self action:@selector(go_First) forControlEvents:UIControlEventTouchUpInside];
    [self.button_Tab2 addTarget:self action:@selector(go_Another) forControlEvents:UIControlEventTouchUpInside];
    
  

}


- (void) go_First {
    
    ViewController * view = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
    [self.navigationController pushViewController:view animated:YES];
    view.isFirstArray = YES;
    
}

- (void) go_Another {

    ViewController * view = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
    [self.navigationController pushViewController:view animated:YES];
    view.isFirstArray = NO;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
