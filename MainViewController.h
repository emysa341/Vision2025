//
//  MainViewController.h
//  Vision2025
//
//  Created by Ammad iOS on 16/04/2014.
//  Copyright (c) 2014 Emy Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentsItemCell.h"


@interface MainViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewController;




@property (nonatomic,strong) IBOutlet UIWebView *webview;

@property (nonatomic,retain) IBOutlet UITableView *table_view;
@end
