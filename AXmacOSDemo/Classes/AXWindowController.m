//
//  AXWindowController.m
//  macOS_demo
//
//  Created by 小星星吃KFC on 2020/10/14.
//

#import "AXWindowController.h"
#import "AXViewController.h"

@interface AXWindowController ()

@end

@implementation AXWindowController

- (id)init
{
    self=[super init];
    if(self)
    {
        NSUInteger style =  NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskFullSizeContentView|NSWindowStyleMaskResizable;
      
        CGSize mainSize = [NSScreen mainScreen].frame.size;
        
        NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, mainSize.width/2, mainSize.height/2) styleMask:style backing:NSBackingStoreBuffered defer:YES];

        window.backgroundColor = NSColor.greenColor;
        window.contentMinSize =NSMakeSize(mainSize.width/3, mainSize.height/3);
        [window center];
        window.excludedFromWindowsMenu = true;
        self.window =window;
        
    }
    return self;
}
-(void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)showWindow:(id)sender {
    [super showWindow:sender];
    AXViewController *vc = AXViewController.alloc.init;
    self.contentViewController = vc;
    [self addMenu];
}

- (void)addMenu{

    //获取主目录
    NSMenu *mainMenu = [[NSMenu alloc] init];
    NSLog(@"%@ - %@",mainMenu,[mainMenu itemArray]);

    {
        //添加一级目录
        NSMenuItem *oneItem = [[NSMenuItem alloc] init];
        [oneItem setTitle:@"第一个"];
        [mainMenu addItem:oneItem];

        //添加二级目录项
        NSMenu *subMenu = [[NSMenu alloc] initWithTitle:@"第一个A"];
        
        [subMenu addItemWithTitle:@"Load1"action:@selector(load) keyEquivalent:@"E"];
        [subMenu addItem:[NSMenuItem separatorItem]];
        [subMenu addItemWithTitle:@"Load2"action:@selector(load2) keyEquivalent:@"R"];
       
        [oneItem setSubmenu:subMenu];


    }
    {


        //添加一级目录
        NSMenuItem *oneItem = [[NSMenuItem alloc] init];
        [oneItem setTitle:@"第二个"];

        //添加二级目录项
        NSMenu *subMenu = [[NSMenu alloc] initWithTitle:@"第二个A"];

        [subMenu addItemWithTitle:@"Load1"action:@selector(load) keyEquivalent:@"E"];
        [subMenu addItem:[NSMenuItem separatorItem]];
        [subMenu addItemWithTitle:@"Load2"action:@selector(load2) keyEquivalent:@"R"];
        {
            NSMenuItem *oneItem = [[NSMenuItem alloc] init];
            [oneItem setTitle:@"第二个"];
            /// 快捷键 使用 Option + R
            [oneItem setKeyEquivalentModifierMask:NSEventModifierFlagOption];
            [oneItem setKeyEquivalentModifierMask:NSEventModifierFlagShift|NSEventModifierFlagOption];
            [oneItem setKeyEquivalent:@"R"];
            [subMenu addItem:oneItem];
        }
        
        oneItem.submenu =subMenu;

        [mainMenu addItem:oneItem];
        
        
        NSMenuItem *item3 = [[NSMenuItem alloc]initWithTitle:@"Load3" action:@selector(load2) keyEquivalent:@"T"];
        
        
        
        [subMenu addItem:item3];
        
        

        //4、添加三级目录
        NSMenu *subMenu3 = [[NSMenu alloc] initWithTitle:@"三级目录"];
        [item3 setSubmenu:subMenu3];
        
        [subMenu3 addItemWithTitle:@"Load1"action:@selector(load) keyEquivalent:@"E"];
        [subMenu3 addItem:[NSMenuItem separatorItem]];
        [subMenu3 addItemWithTitle:@"Load2"action:@selector(load2) keyEquivalent:@"R"];
        

//
//        {
//            NSMenuItem *oneItem1 = [[NSMenuItem alloc] init];
//            [oneItem1 setTitle:@"三级"];
//            [subMenu addItem:oneItem];
//
//
//            [oneItem.submenu addItem:oneItem1];
//        }

    } {
        //添加一级目录
        NSMenuItem *oneItem = [[NSMenuItem alloc] init];
        [oneItem setTitle:@"第三个"];
        [mainMenu addItem:oneItem];

        //添加二级目录项
        NSMenu *subMenu = [[NSMenu alloc] initWithTitle:@"第三个A"];

        [subMenu addItemWithTitle:@"Load1"action:@selector(load) keyEquivalent:@"E"];
        [subMenu addItem:[NSMenuItem separatorItem]];
        [subMenu addItemWithTitle:@"Load2"action:@selector(load2) keyEquivalent:@"R"];

        [oneItem setSubmenu:subMenu];
    }

    [NSApp setMainMenu:mainMenu];
}

//- (void)addMenu{
//
//    NSImageView *imgView = [[NSImageView alloc]initWithFrame:NSMakeRect(100, 100, 100, 100)];
//    [self.window.contentView addSubview:imgView];
////    imgView.image = [NSImage imageNamed:@"apple"];
//
//    //1.获取主目录
//    NSMenu *mainMenu = [[NSMenu alloc] init];
//
//    NSLog(@"%@ - %@",mainMenu,[mainMenu itemArray]);
//
//    //2.添加一级目录
//    NSMenuItem *oneItem = [[NSMenuItem alloc] initWithTitle:@"一级目录" action:nil keyEquivalent:@"O"];
//    [oneItem setTitle:@"Load_TEXT"]; //设置文字无效
//    [mainMenu addItem:oneItem];
//
//    //3.添加二级目录项
//    NSMenu *subMenu = [[NSMenu alloc] initWithTitle:@"一级目录"]; //这里设置一级目录的名字有效
//    [oneItem setSubmenu:subMenu];
//
//    [subMenu addItemWithTitle:@"Load1"action:@selector(load) keyEquivalent:@"E"];
//    [subMenu addItemWithTitle:@"Load2"action:@selector(load2) keyEquivalent:@"T"];
//
//    NSMenuItem *item3 = [[NSMenuItem alloc]initWithTitle:@"Load3" action:@selector(load2) keyEquivalent:@"T"];
//
//    [subMenu addItem:item3];
//
//    //4、添加三级目录
//    NSMenu *subMenu3 = [[NSMenu alloc] initWithTitle:@"三级目录"];
//    [item3 setSubmenu:subMenu3];
//
//    //5、给三级目录添加子目录
//    NSMenuItem *item30 = [[NSMenuItem alloc]initWithTitle:@"-30" action:@selector(load2) keyEquivalent:@"T"];
//    NSMenuItem *item31 = [[NSMenuItem alloc]initWithTitle:@"-31" action:@selector(load2) keyEquivalent:@"T"];
//
//    [subMenu3 addItem:item30];
//    [subMenu3 addItem:item31];
//
//     //更新
//    [NSApp setMainMenu:mainMenu];
//}
-(void)load2{}
@end
