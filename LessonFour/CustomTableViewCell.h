//
//  CustomTableViewCell.h
//  LessonFour
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image_Tab;
@property (weak, nonatomic) IBOutlet UILabel *label_Value;
@property (weak, nonatomic) IBOutlet UILabel *label_Price;

@end
