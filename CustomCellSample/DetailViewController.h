//
//  DetailViewController.h
//  CustomCellSample
//
//  Created by Roy on 9/25/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic,weak)IBOutlet UILabel *desTextLabel;
@property (nonatomic,strong)NSString *detail;

@end
