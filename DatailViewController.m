//
//  DatailViewController.m
//  LessonFour
//
//  Created by Admin on 08.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "DatailViewController.h"

@interface DatailViewController ()


@end

@implementation DatailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.label_Value.text = self.string_MainValue;
    self.label_TextView.text = self.string_textView;
    self.label_Price.text = [NSString stringWithFormat:@"Цена со скидкой - %@", self.string_MainPrice];
    

    UIImage * image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg", self.string_MainValue]];
    self.label_ImageView.image = image;
    

    
    
        
}

- (IBAction)button_Back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

    
@end