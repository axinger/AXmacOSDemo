//
//  AppDelegate.m
//  AXmacOSDemo
//
//  Created by 小星星吃KFC on 2020/10/14.
//

#import "AppDelegate.h"
#import "AXWindowController.h"
#import "AXViewController.h"
@interface AppDelegate ()

@property(nonatomic,strong)NSWindow *window;
//@property(nonatomic,strong)NSWindow *window;
//@property(nonatomic,strong)AXWindowController *windowController;
@property(nonatomic,strong)NSWindowController *windowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

//
////    //窗口 关闭，缩小，放大等功能，根据需求自行组合
//    NSUInteger style =  NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskFullSizeContentView;
//    float w = [[NSScreen mainScreen] frame].size.width/2;
//    float h = [[NSScreen mainScreen] frame].size.height/2;
//    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, w, h) styleMask:style backing:NSBackingStoreBuffered defer:YES];
//
//    CGSize mainSize = [NSScreen mainScreen].frame.size;
//    self.window.backgroundColor = NSColor.orangeColor;
//    self.window.contentMinSize =NSMakeSize(mainSize.width/2, mainSize.height/2);
//
////        self.window.titlebarAppearsTransparent = YES;
////        self.window.titleVisibility = NSWindowTitleHidden;
//
////        self.window.movableByWindowBackground = YES;
//
//
//    self.window.title = @"hello";
//    [self.window makeKeyAndOrderFront:nil];
//    [self.window center];
//    self.window.contentViewController =[[AXViewController alloc] init];
    
    
    self.windowController = [[AXWindowController alloc] init];
    [self.windowController showWindow:self];
//    self.windowController.window.menu = @"";
//    [self.windowController.window makeKeyAndOrderFront:self];
    
//        self.windowController = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];
//        [self.windowController showWindow:nil];
    
    
    
    
//    [self defaultMenu];
//    NSLog(@"mainMenu == %@",[NSApp mainMenu]);
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



@end
