//
//  DVMJokeController.h
//  ChuckNorrisJokeOfTheDay
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMJoke.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMJokeController : NSObject

+ (void)fetchNewJoke:(void(^)(DVMJoke * _Nullable joke))completion;

@end

NS_ASSUME_NONNULL_END
