//
//  DVMJoke.m
//  ChuckNorrisJokeOfTheDay
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import "DVMJoke.h"

@implementation DVMJoke

- (instancetype)initWithJoke:(NSString *)joke
{
    self = [super init];
    if (self)
    {
        _joke = joke;
    }
    return self;
}

@end

@implementation DVMJoke (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString * joke = dictionary[@"value"][@"joke"];
    
    return [self initWithJoke:joke];
}

@end


