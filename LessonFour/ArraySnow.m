//
//  ArraySnow.m
//  LessonFour
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ArraySnow.h"

@implementation ArraySnow



- (void) makeFirstArray {


NSString * stringValue = @"Ride Hellcat, Nitro Mystique, USD Pro Devilfish";
NSString * stringPrice = @"22 869 руб., 17 160 руб.,  8 316 руб.";

NSString * stringDisHellcat = @"Женский флагман коллекции для горячих кошечек, знающих толк в досках. Сложные и совершенные технологии позволят все без исключения, учитывая особенности девушек. Инженеры Ride делали упор на универсальность катания и способность доски выдерживать самые высокие нагрузки, устраивая настоящий ад на склоне!";
NSString * stringDisMystique = @"Форма Directional Twin, сердечник Powercore II, прогиб Gullwing и радиальный боковой вырез должны развеять ваши страхи, родившиеся с момента выхода с подъёмника до первого полёта в попытке освоить катание по целине. Узкая форма доски делает ваши повороты более естественными и плавными. Эта доска станет лучшим другом, поможет в самосовершенствовании.";
NSString * stringDevilfish = @"Дерзкая и яркая Devilfish станет надежным проводником для любой девушки, которая хочет попробовать фрирайд.";


NSString * stringBrand = @"Ride, Nitro, USD";
NSString * stringArtikle = @"1240011, 835854, USB14W1P";
NSString * stringYear = @"2014/2015, 2014/2015, 2014/2015";
NSString * stringGrowth = @"142 - 146, 142 - 146 - 149, 139 - 144 - 149 - 154";
NSString * stringForm = @"Twin, Directional Twin, Directional";
NSString * stringRadius = @"9,2/6,7/9,2 - 9,3/6,8/9,3, 6.2 - 6.5 - 6.8, 7,7 - 7,9 - 8,1 - 8,3 ";
NSString * stringRidingStyle = @"Freestyle / Freeride, All mountain, Freestyle / Freeride";
NSString * stringHardness = @"5, N/A, Moderate";




//заносим в массив значения из строки без символов запятая и пробел:

NSArray* arrayPrice = [stringPrice componentsSeparatedByString:@", "];
NSArray* arrayValue = [stringValue componentsSeparatedByString:@", "];
NSArray* arrayBrand = [stringBrand componentsSeparatedByString:@", "];
NSArray* arrayArtikle = [stringArtikle componentsSeparatedByString:@", "];
NSArray* arrayYear = [stringYear componentsSeparatedByString:@", "];
NSArray* arrayGrowth = [stringGrowth componentsSeparatedByString:@", "];
NSArray* arrayForm = [stringForm componentsSeparatedByString:@", "];
NSArray* arrayRadius = [stringRadius componentsSeparatedByString:@", "];
NSArray* arrayRidingStyle = [stringRidingStyle componentsSeparatedByString:@", "];
NSArray* arrayHardness = [stringHardness componentsSeparatedByString:@", "];
NSMutableArray* arrayDict =[[NSMutableArray alloc]initWithObjects:stringDisHellcat, stringDisMystique, stringDevilfish, nil];


NSMutableArray* arrayM = [[NSMutableArray alloc]init];

//данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:

for (int i = 0; i < arrayPrice.count; i++) {
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[arrayValue objectAtIndex:i] forKey:@"value"];
    [dict setObject:[arrayPrice objectAtIndex:i] forKey:@"price"];
    [dict setObject:[arrayDict objectAtIndex:i] forKey:@"discr"];
    [dict setObject:[arrayBrand objectAtIndex:i] forKey:@"brand"];
    [dict setObject:[arrayArtikle objectAtIndex:i] forKey:@"artikle"];
    [dict setObject:[arrayYear objectAtIndex:i] forKey:@"year"];
    [dict setObject:[arrayGrowth objectAtIndex:i] forKey:@"growth"];
    [dict setObject:[arrayForm objectAtIndex:i] forKey:@"form"];
    [dict setObject:[arrayRadius objectAtIndex:i] forKey:@"radius"];
    [dict setObject:[arrayRidingStyle objectAtIndex:i] forKey:@"riding"];
    [dict setObject:[arrayHardness objectAtIndex:i] forKey:@"hardness"];
  
    
    [arrayM addObject:dict];
  
}

//здесь сортируем массив по цене:
NSSortDescriptor * sorter = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
NSArray * descriptors = [NSArray arrayWithObjects:sorter, nil];
[arrayM sortUsingDescriptors:descriptors];
    
    
    [self.delegate makeArraysFirstArrayReady:self FirstArray:arrayM];

    NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys: arrayM, ARRAY_KEY, nil];
   [NSNotificationCenter call_Notif:ARRAY_NOTIF Dictionary:dict];


}


- (void) makeAnotherArray {
    
    
    NSString * stringValue = @"USD Pro Fleur, Bataleon Push up, Nitro Runaway";
    NSString * stringPrice = @"7 656 руб., 19 074 руб., 19 074 руб.";
    
    
    NSString * stringFleur = @"Яркая и стильная доска Fleur не оставит незамеченной свою хозяйку. Эта доска покажет вам мир снега и не оставит равнодушной к этому замечательному виду спорта.";
    NSString * stringPush = @"Push Up станет любимой доской у каждой девушки, и не важно первая ли она в коллекции, или же пришла на смену неповортоливой предшественицы, в этой доске применяется главная фишка Bataleon-технология TBT, которая поможет девушкам не \"ловить\" кант и существенно проще входить в поворот, а небольшой вес скрасит ваши пешие подъёмы в гору.";
    NSString * stringRunaway = @"Модель предназначена для любительниц преимущественно паркового катания. Сердечник Powercore II гарантирует прочность и хорошую отдачу, а биаксиальный ламинат обеспечивает лёгкость и гибкость. Симметричная форма и мягкий городской прогиб делают эту модель идеальной для техничного фанового катания. Прогиб Gullwing располагает камберные зоны прямо у вас под ногами, что увеличивает стабильность при загрузе носа или хвоста. Зона с обратным прогибом между креплениями позволяет уменьшить давление в контактных точках, что облегчит вам разучивание новых технических приёмов.";
    
    NSString * stringBrand = @"USD, Bataleon, Nitro";
    NSString * stringArtikle = @"USB14W2P, 10.15.PUS, 835853";
    NSString * stringYear = @"2014/2015, 2014/2015, 2014/2015";
    NSString * stringGrowth = @"138 - 140 - 144 - 148, 146 - 149, 142 - 146 - 149";
    NSString * stringForm = @"Twin, Twin, Twin";
    NSString * stringRadius = @"5 - 5,5 - 6 - 6,5; 7,55 - 7,65; 11.1/5.8/11.1 - 11.2/6.2/11.2";
    NSString * stringRidingStyle = @"All mountain, All mountain, Freestyle / Freeride";
    NSString * stringHardness = @"Soft - Moderate, 4, N/A";
    
    
    
    
    //заносим в массив значения из строки без символов запятая и пробел:
    
    NSArray* arrayPrice = [stringPrice componentsSeparatedByString:@", "];
    NSArray* arrayValue = [stringValue componentsSeparatedByString:@", "];
    NSArray* arrayBrand = [stringBrand componentsSeparatedByString:@", "];
    NSArray* arrayArtikle = [stringArtikle componentsSeparatedByString:@", "];
    NSArray* arrayYear = [stringYear componentsSeparatedByString:@", "];
    NSArray* arrayGrowth = [stringGrowth componentsSeparatedByString:@", "];
    NSArray* arrayForm = [stringForm componentsSeparatedByString:@", "];
    NSArray* arrayRadius = [stringRadius componentsSeparatedByString:@"; "];
    NSArray* arrayRidingStyle = [stringRidingStyle componentsSeparatedByString:@", "];
    NSArray* arrayHardness = [stringHardness componentsSeparatedByString:@", "];
    NSMutableArray* arrayDict =[[NSMutableArray alloc]initWithObjects:stringFleur, stringPush, stringRunaway, nil];
    
    
    NSMutableArray* arrayM = [[NSMutableArray alloc]init];
    
    //данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:
    
    for (int i = 0; i < arrayPrice.count; i++) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        [dict setObject:[arrayValue objectAtIndex:i] forKey:@"value"];
        [dict setObject:[arrayPrice objectAtIndex:i] forKey:@"price"];
        [dict setObject:[arrayDict objectAtIndex:i] forKey:@"discr"];
        [dict setObject:[arrayBrand objectAtIndex:i] forKey:@"brand"];
        [dict setObject:[arrayArtikle objectAtIndex:i] forKey:@"artikle"];
        [dict setObject:[arrayYear objectAtIndex:i] forKey:@"year"];
        [dict setObject:[arrayGrowth objectAtIndex:i] forKey:@"growth"];
        [dict setObject:[arrayForm objectAtIndex:i] forKey:@"form"];
        [dict setObject:[arrayRadius objectAtIndex:i] forKey:@"radius"];
        [dict setObject:[arrayRidingStyle objectAtIndex:i] forKey:@"riding"];
        [dict setObject:[arrayHardness objectAtIndex:i] forKey:@"hardness"];
        
        
        [arrayM addObject:dict];
        
        
    }
  
    
    //здесь сортируем массив по цене:
    NSSortDescriptor * sorter = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    NSArray * descriptors = [NSArray arrayWithObjects:sorter, nil];
    [arrayM sortUsingDescriptors:descriptors];
    
    
    [self.delegate makeArraysSecondArrayReady: self SecondArray:arrayM];

    
        NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys: arrayM, ARRAY_KEY, nil];
       [NSNotificationCenter call_Notif:ARRAY_NOTIF Dictionary:dict];
    
    
}




@end