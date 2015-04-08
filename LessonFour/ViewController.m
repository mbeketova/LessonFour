//
//  ViewController.m
//  LessonFour
//
//  Created by Admin on 08.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"
#import "DatailViewController.h"


@interface ViewController ()

//Условия задания: Развить предыдущий проект и реализовать детализированное окно с передачей данных.
//Реализовать выведение изображения.
//NSDictionary должен содержать больше данных, чем отображается в TableView

@property NSMutableArray * arrayM;

@property NSArray * arrayPrice;
@property NSArray * arrayValue;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


        
    NSString * stringValue = @"Ride Hellcat, Nitro Mystique, USD Pro Devilfish, USD Pro Fleur, Bataleon Push up, Nitro Runaway";
    NSString * stringPrice = @"22 869 руб., 17 160 руб.,  8 316 руб.,  7 656 руб., 19 074 руб., 19 074 руб.";
    
    NSString * stringDisHellcat = @"Женский флагман коллекции для горячих кошечек, знающих толк в досках. Сложные и совершенные технологии позволят все без исключения, учитывая особенности девушек. Инженеры Ride делали упор на универсальность катания и способность доски выдерживать самые высокие нагрузки, устраивая настоящий ад на склоне!";
    NSString * stringDisMystique = @"Форма Directional Twin, сердечник Powercore II, прогиб Gullwing и радиальный боковой вырез должны развеять ваши страхи, родившиеся с момента выхода с подъёмника до первого полёта в попытке освоить катание по целине. Узкая форма доски делает ваши повороты более естественными и плавными. Эта доска станет лучшим другом, поможет в самосовершенствовании.";
    NSString * stringDevilfish = @"Дерзкая и яркая Devilfish станет надежным проводником для любой девушки, которая хочет попробовать фрирайд.";
    NSString * stringFleur = @"Яркая и стильная доска Fleur не оставит незамеченной свою хозяйку. Эта доска покажет вам мир снега и не оставит равнодушной к этому замечательному виду спорта.";
    NSString * stringPush = @"Push Up станет любимой доской у каждой девушки, и не важно первая ли она в коллекции, или же пришла на смену неповортоливой предшественицы, в этой доске применяется главная фишка Bataleon-технология TBT, которая поможет девушкам не \"ловить\" кант и существенно проще входить в поворот, а небольшой вес скрасит ваши пешие подъёмы в гору.";
    NSString * stringRunaway = @"Модель предназначена для любительниц преимущественно паркового катания. Сердечник Powercore II гарантирует прочность и хорошую отдачу, а биаксиальный ламинат обеспечивает лёгкость и гибкость. Симметричная форма и мягкий городской прогиб делают эту модель идеальной для техничного фанового катания. Прогиб Gullwing располагает камберные зоны прямо у вас под ногами, что увеличивает стабильность при загрузе носа или хвоста. Зона с обратным прогибом между креплениями позволяет уменьшить давление в контактных точках, что облегчит вам разучивание новых технических приёмов.";
    

    self.arrayM = [[NSMutableArray alloc]init];//инициализируем массив, куда будем записывать данные
    
    
    
    //заносим в массив значения из строки без символов запятая и пробел:
    
    self.arrayPrice = [stringPrice componentsSeparatedByString:@", "];
    
    self.arrayValue = [stringValue componentsSeparatedByString:@", "];
    
        

        
        
    //данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:
        
    for (int i = 0; i < self.arrayPrice.count; i++) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        [dict setObject:[self.arrayPrice objectAtIndex:i] forKey:@"price"];
        [dict setObject:[self.arrayValue objectAtIndex:i] forKey:@"value"];

        
        
        NSString * value = [self.arrayValue objectAtIndex:i];
      
        
    //добавление описаний по ключу discr:
        if ([value isEqualToString:@"Ride Hellcat"]) {
            [dict setObject:stringDisHellcat forKey:@"discr"];
            
        }
        
        else if ([value isEqualToString:@"Nitro Mystique"]){
            [dict setObject:stringDisMystique forKey:@"discr"];
        }
        
        else if ([value isEqualToString:@"USD Pro Devilfish"]){
            [dict setObject:stringDevilfish forKey:@"discr"];
        }
        
        else if ([value isEqualToString:@"USD Pro Fleur"]){
            [dict setObject:stringFleur forKey:@"discr"];
        }
        
        else if ([value isEqualToString:@"Bataleon Push up"]){
            [dict setObject:stringPush forKey:@"discr"];
        }
        
        else if ([value isEqualToString:@"Nitro Runaway"]) {
            [dict setObject:stringRunaway forKey:@"discr"];
        }
        
            
            
        [self.arrayM addObject:dict]; //записываем полученную запись из коллекции в массив
            
            
            
    }
    //здесь сортируем массив по цене:
    NSSortDescriptor * sorter = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    NSArray * descriptors = [NSArray arrayWithObjects:sorter, nil];
    [self.arrayM sortUsingDescriptors:descriptors];
    
    
    NSLog(@"%@",self.arrayM); //выводим на печать полученный массив с наименованиями и ценами
        
    }
    
    
    
#pragma mark - UITableViewDelegate
    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.arrayM.count;
}
    
//здесь заполняем таблицу наименование - цена:
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString * simpleTaibleIndefir = @"Cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTaibleIndefir];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTaibleIndefir];

        }
    
    cell.textLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"];
    cell.detailTextLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"price"];

    
        
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
    
    NSLog(@"indexPath %li", (long)indexPath.row);
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
