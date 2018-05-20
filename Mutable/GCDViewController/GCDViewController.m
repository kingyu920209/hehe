//
//  GCDViewController.m
//  Mutable
//
//  Created by 嘚嘚以嘚嘚 on 2018/5/18.
//  Copyright © 2018年 嘚嘚以嘚嘚. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//多线程进入离开
- (void)group_enter{
    
    dispatch_group_t group =dispatch_group_create();
    dispatch_queue_t globalQueue=dispatch_get_global_queue(0, 0);
    
    
    dispatch_group_enter(group);
    
    //模拟多线程耗时操作
    dispatch_group_async(group, globalQueue, ^{
        sleep(5);
        NSLog(@"%@---block1结束。。。",[NSThread currentThread]);
        dispatch_group_leave(group);
    });
    NSLog(@"%@---1结束。。。",[NSThread currentThread]);
    
    dispatch_group_enter(group);
    //模拟多线程耗时操作
    dispatch_group_async(group, globalQueue, ^{
        sleep(3);
        NSLog(@"%@---block2结束。。。",[NSThread currentThread]);
        dispatch_group_leave(group);
    });
    NSLog(@"%@---2结束。。。",[NSThread currentThread]);
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@---全部结束。。。",[NSThread currentThread]);
    });
    NSLog(@"111");
}
//栅栏
-(void)barrier_async{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue2 = dispatch_queue_create("com.iOSChengXuYuan.queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queue2, ^{
        sleep(4);
        NSLog(@"1111");
    });
    
    dispatch_barrier_async(queue2, ^{
        
    });
    dispatch_group_async(group, queue2, ^{
        NSLog(@"222");
        
    });
    
    NSLog(@"333");
    
}
//信号量
-(void)semaphore_t{
    dispatch_queue_t queue1 = dispatch_queue_create("com.iOSChengXuYuan.queue1", DISPATCH_QUEUE_CONCURRENT);
    
    
    //信号量
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);//创建
    
    dispatch_async(queue1, ^{
        sleep(3);
        NSLog(@"------");
        dispatch_semaphore_signal(semaphore);//发送信号量+1
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//等待 -1
    
    dispatch_async(queue1, ^{
        NSLog(@"任务 1 ： queue 1...");
        sleep(1);
        NSLog(@"✅完成任务 1");
    });
    NSLog(@"====");
}

-(void)gcd{
    
    
    //    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_queue_t queue1 = dispatch_queue_create("com.iOSChengXuYuan.queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("com.iOSChengXuYuan.queue2", DISPATCH_QUEUE_CONCURRENT);
    //    dispatch_queue_t queue3 = dispatch_queue_create("com.iOSChengXuYuan.queue3", 0);
    
    //    dispatch_queue_t mianqueue = dispatch_get_main_queue();
    
    
    dispatch_group_t group = dispatch_group_create();
    
    
    dispatch_async(queue1, ^{
        NSLog(@"任务 1 ： queue 1...");
        sleep(1);
        NSLog(@"✅完成任务 1");
    });
    
    dispatch_async(queue2, ^{
        NSLog(@"任务 1 ： queue 2...");
        sleep(1);
        NSLog(@"✅完成任务 2");
    });
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"🚫正在暂停 1");
        dispatch_suspend(queue1);//挂起
    });
    
    dispatch_group_async(group, queue2, ^{
        NSLog(@"🚫正在暂停 2");
        dispatch_suspend(queue2);
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"＝＝＝＝＝＝＝等待两个queue完成, 再往下进行...");
    dispatch_async(queue1, ^{
        NSLog(@"任务 2 ： queue 1");
    });
    dispatch_async(queue2, ^{
        NSLog(@"任务 2 ： queue 2");
    });
    sleep(3);
    NSLog(@"🔴为什么这个NSLog会在上面两个NSLog之前打印❓❓答：dispatch_suspend的作用‼️");
    
    dispatch_resume(queue1);//恢复
    dispatch_resume(queue2);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
