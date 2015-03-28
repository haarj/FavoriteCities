//
//  DetailViewController.h
//  FavoriteCities
//
//  Created by Justin Haar on 3/20/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol CityTitleMethod <NSObject>
@required
-(void) CityDelegateMethod:(UIButton *)sender;

@end

@interface DetailViewController : UIViewController

@property id<CityTitleMethod>delegate;
@property City *city;

@end
