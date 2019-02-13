//
//  RLGCardController.m
//  deckOfOneCardOBJC
//
//  Created by RYAN GREENBURG on 2/12/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "RLGCardController.h"

static NSString *const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/";

@implementation RLGCardController

+(RLGCardController *)sharedInstance
{
    static RLGCardController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RLGCardController new];
    });
    return sharedInstance;
}

+ (void)drawNewCard:(NSInteger)draw completion:(void (^)(RLGCard * _Nullable card))completion
{
    NSString *cardCount = [@(draw) stringValue];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *countQueryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    components.queryItems = @[countQueryItem];
    
    NSURL *searchURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *jsonDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            NSArray *cardsArray = jsonDictionaries[@"cards"];
            
            for (NSDictionary *cardDictionaries in cardsArray)
            {
                RLGCard *card = [[RLGCard alloc] initWithDictionary:cardDictionaries];
                completion(card);
            }
        }
    }] resume];
}

+ (void)fetchImageFor:(RLGCard *)card completion:(void (^)(UIImage * _Nullable image))completion
{
    NSURL *url = [NSURL URLWithString:card.image];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }] resume];
}

@end
