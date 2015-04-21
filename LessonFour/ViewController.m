//
//  ViewController.m
//  LessonFour
//
//  Created by Admin on 08.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"
#import "DatailViewController.h"
#import "CustomTableViewCell.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ArraySnow * arraySnow;

- (IBAction)button_Tab1:(id)sender;
- (IBAction)button_Tab2:(id)sender;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayM = [[NSMutableArray alloc]init];
    self.arraySnow = [ArraySnow new]; //важно не забыть инициировать этот класс, т.к. без него нотификация работать не будет!

    
    if (self.isFirstArray) {
        [self makeFirst];
    }
    else {
        [self makeAnother];
    }

    
}


- (void) makeFirst {
    //метод по срабатыванию кнопки с предыдущего окна (работает через делегат)
    ArraySnow * arraySnow = [[ArraySnow alloc]init];
    [arraySnow setDelegate:self];
    [arraySnow makeFirstArray];
    
    
}

- (void) makeAnother {
    //метод по срабатыванию кнопки с предыдущего окна (работает через делегат)
    ArraySnow * arraySnow = [[ArraySnow alloc]init];
    [arraySnow setDelegate:self];
    [arraySnow makeAnotherArray];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [NSNotificationCenter set_Notif:ARRAY_NOTIF Selector:@selector(makeFirstArray:) Object:self];
    //подписываемся на нотификацию
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //отписываемся от нотификации
}

//возвращает первый массив для таблички (обработанный методом makeFirstArray из класса ArrayInsecta - при нажатии на кнопку Таблица 1 на текущей странице
- (void) makeFirstArray:(NSNotification*)notification {
    
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = [notification.userInfo objectForKey: ARRAY_KEY];
    
    self.isFirstArray = YES;
    [self reloadTableView]; //перегружаем таблицу
    
}

//возвращает второй массив для таблички (обработанный методом makeAnotherArray из класса ArrayInsecta - при нажатии на кнопку Таблица 2 на текущей странице
- (void) makeAnotherArray:(NSNotification*)notification {
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = [notification.userInfo objectForKey: ARRAY_KEY];
    
    self.isFirstArray = NO;
    [self reloadTableView]; //перегружаем таблицу
    
}


    
#pragma mark - UITableViewDelegate
    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.arrayM.count;
}
    
//здесь заполняем таблицу наименование - цена:
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * simpleTaibleIndefir = @"Cell";
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTaibleIndefir];
    cell.label_Value.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"];
    cell.label_Price.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"price"];
    
    //указываем картинку для заполнения в кастомной ячейке:
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"]]];
    cell.image_Tab.image = image;
    
    
    return cell;
}
    

    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    //заполняем наследуемый вьюконтроллер DatailViewController (наименование, цена и описание)
    
    DatailViewController * detal = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    NSDictionary * dict = [self.arrayM objectAtIndex:indexPath.row];
    
    detal.string_MainValue = [dict objectForKey:@"value"];
    detal.string_textView = [dict objectForKey:@"discr"];
    detal.string_MainPrice = [dict objectForKey:@"price"];
        
    [self.navigationController pushViewController:detal animated:YES];
   
}


//кнопка возврата на предыдущую страницу:
- (IBAction)button_Back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



//подписываемся на делегат:
#pragma mark ArraySnowDelegate

- (void) makeArraysFirstArrayReady:(ArraySnow*) makeArrays FirstArray:(NSMutableArray*) firstArray{
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = firstArray; //получаем таблицу по методу протокола
    [self reloadTableView]; //перегружаем таблицу
    
}
- (void) makeArraysSecondArrayReady:(ArraySnow*) makeArrays SecondArray:(NSMutableArray*) secondArray{
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = secondArray; //получаем таблицу по методу протокола
       [self reloadTableView]; //перегружаем таблицу
    
}

//метод, который перезагружает таблицу в текущем окне:
- (void) reloadTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];});
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//метод при нажатии на кнопку Таблица 1 (на текущей странице):
- (IBAction)button_Tab1:(id)sender {
    [self.arraySnow makeAnotherArray];
}

//метод при нажатии на кнопку Таблица 2 (на текущей странице):
- (IBAction)button_Tab2:(id)sender {
    
    [self.arraySnow makeFirstArray];
}

@end
