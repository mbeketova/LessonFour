//
//  NSNotificationCenter+NotOptions.m
//  LessonFour
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "NSNotificationCenter+NotOptions.h"

@implementation NSNotificationCenter (NotOptions)

+ (void) set_Notif: (NSString*) name_Notif Selector: (SEL) name_Metod Object: (UIViewController*) controller {
    
    [[NSNotificationCenter defaultCenter] addObserver:controller selector:name_Metod name:name_Notif object:nil];
}

+ (void) call_Notif:(NSString*) name_Notif Dictionary:(NSDictionary *)dictionary {
    [[NSNotificationCenter defaultCenter]postNotificationName:name_Notif object:nil userInfo:dictionary];
}

+ (void) delete_Notif {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end