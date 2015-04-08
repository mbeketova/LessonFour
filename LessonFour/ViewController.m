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
@property NSArray * arrayPrice;
@property NSArray * arrayValue;
@property NSMutableArray * arrayM;
@property NSDictionary * dictSnow;

@property NSArray * arrayBrand;
@property NSArray * arrayArtikle;
@property NSArray * arrayYear;
@property NSArray * arrayGrowth;
@property NSArray * arrayForm;
@property NSArray * arrayRadius;
@property NSArray * arrayRidingStyle;
@property NSArray * arrayHardness;


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
    
    NSString * stringBrand = @"Ride, Nitro, USD, USD, Bataleon, Nitro";
    NSString * stringArtikle = @"1240011, 835854, USB14W1P, USB14W2P, 10.15.PUS, 835853";
    NSString * stringYear = @"2014/2015, 2014/2015, 2014/2015, 2014/2015, 2014/2015, 2014/2015";
    NSString * stringGrowth = @"142 - 146, 142 - 146 - 149, 139 - 144 - 149 - 154, 138 - 140 - 144 - 148, 146 - 149, 142 - 146 - 149";
    NSString * stringForm = @"Twin, Directional Twin, Directional, Twin, Twin, Twin";
    NSString * stringRadius = @"9,2/6,7/9,2 - 9,3/6,8/9,3, 6.2 - 6.5 - 6.8, 7,7 - 7,9 - 8,1 - 8,3, 5 - 5,5 - 6 - 6,5, 7,55 - 7,65, 11.1/5.8/11.1 - 11.2/6.2/11.2 ";
    NSString * stringRidingStyle = @"Freestyle / Freeride, All mountain, Freestyle / Freeride, All mountain, All mountain, Freestyle / Freeride";
    NSString * stringHardness = @"5, N/A, Moderate, Soft - Moderate, 4, N/A";
    
    self.dictSnow = [[NSDictionary alloc]init];//инициализируем массив, куда будем записывать данные
    
    
    
    //заносим в массив значения из строки без символов запятая и пробел:
    
    self.arrayPrice = [stringPrice componentsSeparatedByString:@", "];
    self.arrayValue = [stringValue componentsSeparatedByString:@", "];
    
    self.arrayBrand = [stringBrand componentsSeparatedByString:@", "];
    self.arrayArtikle = [stringArtikle componentsSeparatedByString:@", "];
    self.arrayYear = [stringYear componentsSeparatedByString:@", "];
    self.arrayGrowth = [stringGrowth componentsSeparatedByString:@", "];
    self.arrayForm = [stringForm componentsSeparatedByString:@", "];
    self.arrayRadius = [stringRadius componentsSeparatedByString:@", "];
    self.arrayRidingStyle = [stringRidingStyle componentsSeparatedByString:@", "];
    self.arrayHardness = [stringHardness componentsSeparatedByString:@", "];
    
    self.arrayM = [[NSMutableArray alloc]init];
    
    //данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:
    
    for (int i = 0; i < self.arrayPrice.count; i++) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        [dict setObject:[self.arrayPrice objectAtIndex:i] forKey:@"price"];
        [dict setObject:[self.arrayValue objectAtIndex:i] forKey:@"value"];
        
        [dict setObject:[self.arrayBrand objectAtIndex:i] forKey:@"brand"];
        [dict setObject:[self.arrayArtikle objectAtIndex:i] forKey:@"artikle"];
        [dict setObject:[self.arrayYear objectAtIndex:i] forKey:@"year"];
        [dict setObject:[self.arrayGrowth objectAtIndex:i] forKey:@"growth"];
        [dict setObject:[self.arrayForm objectAtIndex:i] forKey:@"form"];
        [dict setObject:[self.arrayRadius objectAtIndex:i] forKey:@"radius"];
        [dict setObject:[self.arrayRidingStyle objectAtIndex:i] forKey:@"riding"];
        [dict setObject:[self.arrayHardness objectAtIndex:i] forKey:@"hardness"];
        
        
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
        
        
        
        [self.arrayM addObject:dict];
        
        
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
