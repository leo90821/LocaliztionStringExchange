//
//  ViewController.m
//  LocaliztionStringExchange
//
//  Created by 倪瑶 on 15/10/9.
//  Copyright © 2015年 nycode. All rights reserved.
//

#import "ViewController.h"
#import "BLL.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tip;

- (IBAction)changeLanguage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.button setTitle:NSLocalizedStringFromTable(@"Change", @"MyString", nil) forState:UIControlStateNormal];
    self.tip.text = NSLocalizedStringFromTable(@"Hello", @"MyString", nil);

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addObservers];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeObservers];
}

- (void)addObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUI) name:NOTIFICATION_CHANGE_LANGUAGE object:nil];
}

- (void)removeObservers {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_CHANGE_LANGUAGE object:nil];
}

- (void)refreshUI {
    
    [self.button setTitle:[[BLL bundle] localizedStringForKey:@"Change" value:nil table:@"MyString"] forState:UIControlStateNormal];
    self.tip.text = [[BLL bundle] localizedStringForKey:@"Hello" value:nil table:@"MyString"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLanguage:(id)sender {
    NSString *language = [[BLL currentLogic] getCurrentLanguage];
    
    if ([language rangeOfString:@"en"].location != NSNotFound) {
        [[BLL currentLogic] setUserLanguageWithLanguage:@"zh-Hans"];
    } else {
        [[BLL currentLogic] setUserLanguageWithLanguage:@"en"];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGE_LANGUAGE object:nil
     ];
}
@end
