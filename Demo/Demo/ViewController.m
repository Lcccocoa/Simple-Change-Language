//
//  ViewController.m
//  Demo
//
//  Created by Lcccocoa on 2017/6/26.
//  Copyright © 2017年 Lcccocoa. All rights reserved.
//

#import "ViewController.h"

#import "NSBundle+Language.h"

#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSLocalizedString(@"hello", nil);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [NSBundle setLanguage:LanguageCN];
    } else if (indexPath.row == 1) {
        [NSBundle setLanguage:LanguageEN];
    } else {
        [NSBundle setLanguage:LanguageDefault];
    }
    
    // reload
    AppDelegate *appDelegate = (id)[UIApplication sharedApplication].delegate;
    [appDelegate reloadRootController];
}

@end
