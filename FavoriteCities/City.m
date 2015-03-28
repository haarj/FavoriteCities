//
//  City.m
//  FavoriteCities
//
//  Created by Justin Haar on 3/20/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype) initWithFullName:(NSString *)name andState:(NSString *)state
{
    self = [super init];
    if (self)
    {
        self.cityName = name;
        self.cityState = state;
    }
    return self;
}

@end
