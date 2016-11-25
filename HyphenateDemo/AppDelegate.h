//
//  AppDelegate.h
//  HyphenateDemo
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

