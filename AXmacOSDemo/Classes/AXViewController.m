//
//  AXViewController.m
//  macOS_demo
//
//  Created by 小星星吃KFC on 2020/10/14.
//

#import "AXViewController.h"
#import <Masonry/Masonry.h>
#import "AXUserInfoDao.h"
@interface AXViewController ()

@end

@implementation AXViewController
- (void)loadView{
    NSRect frame = [[[NSApplication sharedApplication] mainWindow] frame];
    self.view = [[NSView alloc] initWithFrame:frame];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = NSColor.whiteColor.CGColor;
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES ).firstObject;
    NSLog(@"path = %@",path);
    NSButton *btn =[[NSButton alloc]init];
    [btn setTitle:@"按钮"];
    /**
    - 1、6 类型（NSButtonTypePushOnPushOff、NSButtonTypeOnOff），选中状态是蓝色，再次点击才会恢复到原来的颜色。
    - 0、2、7（NSButtonTypeMomentaryLight、NSButtonTypeToggle、NSButtonTypeMomentaryPushIn） 点击时会有背景色（高亮状态）。
    - 5（NSButtonTypeMomentaryChange） 点击时会有高亮状态，文字一闪，但是没有高亮的背景色。
    - 3（NSButtonTypeSwitch） 适合做多选
    - 4 （NSButtonTypeRadio） 适合做单选。
     */
    [btn setButtonType:NSButtonTypeSwitch];
    btn.cell.backgroundStyle = 1;
    [btn.cell setBackgroundColor:[NSColor orangeColor]];
//    btn.cell.backgroundColor =NSColor.orangeColor;
    btn.cell.font = [NSFont systemFontOfSize:50];
//    btn.layer.backgroundColor = NSColor.orangeColor.CGColor;
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(50);
        make.top.mas_offset(50);
//        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    //YES-有三种状态，-1、1、0
    //NO-2种状态，1、0
//    btn.allowsMixedState = YES;
    [btn setTarget:self ];
    [btn setAction: @selector(buttonClick:)];
    
    NSView *lastView = btn;
    {
        NSButton *btn =[[NSButton alloc]init];
        [btn.cell setBackgroundColor:[NSColor orangeColor]];
        [btn setTitle:@"打开网页"];
//        [btn setButtonType:NSButtonTypeAccelerator];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(50);
            make.top.equalTo(lastView.mas_bottom).mas_offset(10);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
        
        [btn setTarget:self ];
        [btn setAction: @selector(buttonClick1:)];
    }

}
-(void)buttonClick:(NSButton *)btn{
    NSLog(@"buttonClick %ld",(long)btn.state);
    BOOL valeu = btn.state;
    
    NSApplication.sharedApplication.mainWindow.title = @"AAA";
    
//    NSWindowCloseButton,
//    NSWindowMiniaturizeButton,
//    NSWindowZoomButton,
//    NSWindowToolbarButton,
//    NSWindowDocumentIconButton
    
    [NSApplication.sharedApplication.mainWindow standardWindowButton:NSWindowCloseButton].hidden = valeu;
    
    [NSApplication.sharedApplication.mainWindow standardWindowButton:NSWindowZoomButton].hidden = valeu;
    
    [NSApplication.sharedApplication.mainWindow standardWindowButton:NSWindowMiniaturizeButton].hidden = valeu;
    
   
}
-(void)buttonClick1:(NSButton *)btn{
    NSLog(@"buttonClick1");
    /// 浏览器打开
//    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
    
    AXUserInfo *model = [AXUserInfo.alloc init];
//    model.userId = 9;
    model.name = @"tom-3";
    model.icon = @"https://www.baidu.com/1.png";
    model.headUrl = @"https://www.baidu.com/";
    model.registerDate = [NSDate date];
    [AXUserInfoDao.sharedDao insertWithModel:model];
    
//    [AXUserInfoDao.sharedManager insertOrUpdateWithModel:model];
//    [AXUserInfoDao.sharedManager updateWithModel:model];
//    [AXUserInfoDao.sharedManager getOneById:1];
    
}

@end
