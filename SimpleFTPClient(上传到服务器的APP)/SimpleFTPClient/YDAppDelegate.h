//
//  YDAppDelegate.h
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

#import <UIKit/UIKit.h>

@class YDViewController;

@interface YDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) YDViewController *viewController;

@end
