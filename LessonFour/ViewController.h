//
//  ViewController.h
//  LessonFour
//
//  Created by Admin on 08.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArraySnow.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ArraySnowDelegate>

@property (nonatomic, strong) NSMutableArray * arrayM;
@property (nonatomic, assign) BOOL isFirstArray;



@end

