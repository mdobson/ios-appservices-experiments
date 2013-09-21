//
//  MSDDetailViewController.h
//  ApigeeExperiments
//
//  Created by Matthew Dobson on 9/20/13.
//  Copyright (c) 2013 Matthew Dobson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
