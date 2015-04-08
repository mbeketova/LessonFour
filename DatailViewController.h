//
//  DatailViewController.h
//  LessonFour
//
//  Created by Admin on 08.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatailViewController : UIViewController

@property (weak, nonatomic) NSString *string_MainValue;
@property (weak, nonatomic) NSString *string_textView;
@property (weak, nonatomic) NSString *string_MainPrice;

@property (weak, nonatomic) IBOutlet UILabel *label_MainValue;
@property (weak, nonatomic) IBOutlet UITextView *label_textView;
@property (weak, nonatomic) IBOutlet UIImageView *label_imageView;
@property (weak, nonatomic) IBOutlet UILabel *label_MainPrice;
@property (weak, nonatomic) IBOutlet UIButton *detailDescript;


@end
