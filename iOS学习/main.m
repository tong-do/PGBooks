//
//  main.m
//  07_NSDictionary
//
//  Created by tong on 2020/01/05.
//  Copyright © 2020 tong. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
    //创建字典数组类型三种方式，这种方式创建出来的字典数组中没有任何元素，所以没有意义
    NSDictionary *dic1 = [NSDictionary new];
    NSDictionary *dic2 = [[NSDictionary alloc] init];
    NSDictionary *dic3 = [NSDictionary dictionary];
    
    //一般创建方式
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"jack", @"name",@"北京市",@"address",nil];
    NSLog(@"%@",dict1);
    
    //简单创建方式
    NSDictionary *dict2 = @{@"name":@"rose",@"age":@"18",@"adress":@"BeijingCity"};
    
    //遍历数组；无法通过下标取值，普通for循环无法作用；增强for in循环只能取键的值
    //无法确定元素类型，可用id万能类型代替
    for (id item in dict2) {
        NSLog(@"%@ = %@",item,dict2[item]);
    }
    
    NSLog(@"----------------------");
    
    //通过block方式遍历
    [dict2 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@ = %@",key,obj);
    }];
    
    //可变字典创建方式
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"tom",@"name",@"19",@"age", nil];
    [mutDic setObject:@"china" forKey:@"country"];
    NSLog(@"~~~~~~~%@",mutDic);
    for (id pDic in mutDic) {
        NSLog(@"%@ = %@",pDic,mutDic[pDic]);
    }
    
    //循环运行
    while (1) {
        //先拿到文件夹中的子目录
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = @"/Users/tongyiming/Desktop/待删除文件夹/";
        NSArray *arr = [fileManager contentsOfDirectoryAtPath:path error:nil];
        
        if (arr.count > 0) {
            
            //删除存在的文件
            for (NSString *p in arr) {
                
                NSString *newP = [NSString stringWithFormat:@"%@%@",path,p];
                if ([fileManager isDeletableFileAtPath:newP]) {
                    [fileManager removeItemAtPath:newP error:nil];
                }
            }
        }
        NSLog(@"扫描完成！");
        //每三秒扫描删除文件
        [NSThread sleepForTimeInterval:3];
    }
    
    return 0;
}
