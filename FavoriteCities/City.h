//
//  City.h
//  FavoriteCities
//
//  Created by Justin Haar on 3/20/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property (nonatomic) NSString *cityName;
@property (nonatomic) NSString *cityState;
@property (nonatomic) UIImage *cityImage;


-(instancetype)initWithFullName:(NSString *)name andState:(NSString *)state;


@end
