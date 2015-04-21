//
//  ArraySnow.h
//  LessonFour
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol ArraySnowDelegate;


@interface ArraySnow : NSObject

@property (nonatomic, strong) NSMutableArray * arrayM;

- (void) makeFirstArray;
- (void) makeAnotherArray;


@property (weak, nonatomic) id <ArraySnowDelegate> delegate;

@end


@protocol ArraySnowDelegate <NSObject>


@optional

- (void) makeArraysFirstArrayReady:(ArraySnow*) makeArrays FirstArray:(NSMutableArray*) firstArray;
- (void) makeArraysSecondArrayReady:(ArraySnow*) makeArrays SecondArray:(NSMutableArray*) secondArray;


@end