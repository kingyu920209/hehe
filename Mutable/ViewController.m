//
//  ViewController.m
//  Mutable
//
//  Created by 嘚嘚以嘚嘚 on 2018/5/13.
//  Copyright © 2018年 嘚嘚以嘚嘚. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
//@property(nonatomic,strong)NSMutableArray *mutableArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    id array = [[NSMutableArray alloc] init];
//    printf("retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(array)));


//    NSArray * array = [[NSArray alloc]initWithObjects:@"1",@"2", nil];
//    self.mutableArray  = [array mutableCopy];
//    NSLog(@"%@",self.mutableArray);
//    NSLog(@"%@",array);
//    array = [array arrayByAddingObject:@"3"];
//    NSLog(@"---%@",self.mutableArray);
//    NSLog(@"---%@",array);
//    [self.mutableArray insertObject:@"4" atIndex:0];
//    NSLog(@"----%@",self.mutableArray);
//


    // Do any additional setup after loading the view, typically from a nib.
}

-(void)imageView{
        NSString * path = [[NSBundle mainBundle]pathForResource:@"xp_06@2x" ofType:@"png"];//获取地址
    
    
        NSString * patho = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"xp_06.png"];//获取相对路径自动适配2x,3x
    
    
        NSString * bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"image.bundle"];//获取相对路径
    //    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource:@"image" ofType:@"bundle"];
        NSString *imgPath= [bundlePath stringByAppendingPathComponent :@"xp_06.png"];
    
    
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor yellowColor];
        imageView.image = [UIImage imageWithContentsOfFile:imgPath];
    
        imageView.frame = CGRectMake(0, 0, 300, 100);
 
    
        [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
