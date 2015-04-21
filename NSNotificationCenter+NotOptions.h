//
//  NSNotificationCenter+NotOptions.h
//  LessonFour
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSNotificationCenter (NotOptions)



+ (void) set_Notif: (NSString*) name_Notif Selector: (SEL) name_Metod Object: (UIViewController*) controller;
+ (void) call_Notif: (NSString*) name_Notif Dictionary:(NSDictionary *)dictionary;
+ (void) delete_Notif;

@end
