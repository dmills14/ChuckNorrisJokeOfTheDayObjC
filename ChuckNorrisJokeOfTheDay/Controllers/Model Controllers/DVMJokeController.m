//
//  DVMJokeController.m
//  ChuckNorrisJokeOfTheDay
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import "DVMJokeController.h"

static NSString * const baseURLString = @"https://api.icndb.com/jokes/random";

@implementation DVMJokeController

+ (void)fetchNewJoke:(void (^)(DVMJoke * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSLog(@"%@", baseURL);
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching a card from the API: %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error data from the url: %@", error);
            completion(nil); return;
        }
        
        NSDictionary * JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!JSONDictionary || ![JSONDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error fetching and decoding the JSON Dictionary");
            completion(nil); return;
        }
        
        NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!topLevelDictionary) {
            NSLog(@"Error parsing the data %@", error);
            completion(nil); return;
        }
        
        
        DVMJoke * joke = [[DVMJoke alloc] initWithDictionary:topLevelDictionary];
        completion(joke);
    
        
    }] resume];
}

@end
