//
//  FTPManager.h
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

#import <Foundation/Foundation.h>


#include <CFNetwork/CFNetwork.h>
enum {
    kSendBufferSize = 32768
};

@protocol FTPManagerDelegate <NSObject>
- (void)ftpUploadFinishedWithSuccess:(BOOL)success;
- (void)ftpDownloadFinishedWithSuccess:(BOOL)success;
- (void)directoryListingFinishedWithSuccess:(NSArray *)arr;
-(void)ftpError:(NSString *)err;
@end

@interface FTPManager : NSObject<NSStreamDelegate>
- (id)initWithServer:(NSString *)server user:(NSString *)username password:(NSString *)pass;
- (void)downloadRemoteFile:(NSString *)filename localFileName:(NSString *)localname;
- (void)uploadFileWithFilePath:(NSString *)filePath;
- (void)createRemoteDirectory:(NSString *)dirname;
- (void)listRemoteDirectory;
 

@property (nonatomic, assign) id<FTPManagerDelegate>       delegate;

@end
