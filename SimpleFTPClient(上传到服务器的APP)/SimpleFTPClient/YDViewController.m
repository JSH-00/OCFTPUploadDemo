//
//  YDViewController.m
//  SimpleFTPClient
//  This file is part of source code lessons that are related to the book
//  Title: Professional IOS Programming
//  Publisher: John Wiley & Sons Inc
//  ISBN 978-1-118-66113-0
//  Author: Peter van de Put
//  Company: YourDeveloper Mobile Solutions
//  Contact the author: www.yourdeveloper.net | info@yourdeveloper.net
//  Copyright (c) 2013 with the author and publisher. All rights reserved.
//

#import "YDViewController.h"
#include <CFNetwork/CFNetwork.h>
@interface YDViewController ()

@end

@implementation YDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *caches =  [[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"];
    NSString * path=[caches stringByAppendingPathComponent:@"test.txt"];
    NSString * strTest=@"这是测试字符串";
    [strTest writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    // 打印沙盒路径
    NSString *preferences =  [[NSHomeDirectory() stringByAppendingPathComponent:@"Library"]stringByAppendingPathComponent:@"Caches"];
    NSLog(@"==>%@",preferences);
    
    dispatch_queue_t defQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(defQueue, ^{
        ftpmanager=[[FTPManager alloc] initWithServer:@"192.168.3.172:23333"
                                                 user:@""
                                             password:@""];
        
        ftpmanager.delegate=self;
    });
    
}
-(IBAction)uploadFile:(id)sender
{
    [ftpmanager listRemoteDirectory];
}
- (IBAction)listCon:(id)sender {
    NSString *preferences =  [[NSHomeDirectory() stringByAppendingPathComponent:@"Library"]stringByAppendingPathComponent:@"Caches"];
    NSLog(@"==>%@",preferences);
    //    CFReadStreamRef CFReadStreamCreateWithFTPURL(NULL, @"ftp://192.168.3.174:20000");
    [ftpmanager uploadFileWithFilePath:[NSString stringWithFormat:@"%@/test.txt",preferences]];
    //    //解析文件或目录的格式化数据
    //    CFIndex CFFTPCreateParsedResourceListing(CFAllocatorRef __nullable alloc, const UInt8 *buffer, CFIndex bufferLength, CFDictionaryRef __nullable *  __nullable parsed);
    //    //根据URL创建一个FTP写入流对象 用来进行文件上传
    //    CFWriteStreamRef CFWriteStreamCreateWithFTPURL(CFAllocatorRef __nullable alloc, CFURLRef ftpURL);
    
}
- (void)ftpDownloadFinishedWithSuccess:(BOOL)success
{
    if (!success)
    {
        //handle your error
        NSLog(@"===>%s",__func__);
    }
}
-(void)ftpError:(NSString *)err
{
    //handle your error
    NSLog(@"===>%s",__func__);
    
}
-(void)directoryListingFinishedWithSuccess:(NSArray *)arr
{
    //use the array the way you need it
    NSLog(@"===>%s",__func__);
    
}
- (void)ftpUploadFinishedWithSuccess:(BOOL)success
{
    if (!success)
    {
        //handle your error
        NSLog(@"===>%s",__func__);
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"===>%s",__func__);
    
    
}





@end
