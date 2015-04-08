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
    
    
    self.label_MainValue.text = self.string_MainValue;
    self.label_textView.text = self.string_textView;
    self.label_MainPrice.text = [NSString stringWithFormat:@"Цена со скидкой - %@", self.string_MainPrice];
    

    UIImage * image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg", self.string_MainValue]];
    self.label_imageView.image = image;
    
 //планирую еще на кнопку технические характеристики привязать еще один вьюконтроллер с табличкой, подумаю оставшееся до следующего занятия время. 
    
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
