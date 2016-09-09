//
//  MasterViewController.h
//  SplitViewController
//
//  Created by vignesh on 9/8/16.
//  Copyright © 2016 vignesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController
@property (nonatomic, retain) NSArray *siteNames;
@property (nonatomic, retain) NSArray *siteAddresses;

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

