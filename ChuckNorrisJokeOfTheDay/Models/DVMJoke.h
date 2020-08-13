//
//  DVMJoke.h
//  ChuckNorrisJokeOfTheDay
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMJoke : NSObject

@property (nonatomic, copy)NSString * joke;

- (instancetype)initWithJoke:(NSString *)joke;

@end

@interface DVMJoke (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
