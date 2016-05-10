//
//  ViewController.m
//  TestPlist
//
//  Created by dean on 2016/5/10.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "ViewController.h"
#import "MyItem.h"

@interface ViewController ()
{
    NSMutableDictionary *listDict;
    NSMutableDictionary *date1;
    NSMutableDictionary *addItemDic;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    listDict = [NSMutableDictionary new];
    date1 = [NSMutableDictionary new];
    addItemDic = [NSMutableDictionary new];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //先取得已經複製好的路徑
    NSString *path = [NSString stringWithFormat:@"%@/Documents/myList.plist",NSHomeDirectory()];
    //read
    listDict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    date1 = [listDict objectForKey:@"date1"];
    NSString *major= date1[major];
    NSLog(@"major: %@",major);
    
    //write
    NSLog(@"listDic: %@",listDict);
    
    
}
- (IBAction)addBtnAction:(id)sender {
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/myList.plist",NSHomeDirectory()];
    [date1 setValue:@"898" forKey:@"major"];
    [date1 setValue:@"ggf" forKey:@"minor"];
    //在plist檔案，沒有設置這個key，但是也可以動態加入，讓他存入，刪除也是一樣，都是依照key，value
    [date1 setValue:@"ooj" forKey:@"klo"];
    //展示包入Singleton資料物件
    MyItem *item = [MyItem new];
    item.stringA = @"ppokok";
    NSMutableDictionary *newDic = [NSMutableDictionary new];
    [newDic setObject:item forKey:@"kkk"];
    [date1 setObject:newDic forKey:@"newDic"];
    
    
    [listDict writeToFile:path atomically:YES];
    NSLog(@"listDic: %@",listDict);
    
    
}
- (IBAction)deletBtnAction:(id)sender {
    [date1 removeObjectForKey:@"minor"];
    NSLog(@"listDic: %@",listDict);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
