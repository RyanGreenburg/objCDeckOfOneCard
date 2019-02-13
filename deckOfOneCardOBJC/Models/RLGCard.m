//
//  RLGCard.m
//  deckOfOneCardOBJC
//
//  Created by RYAN GREENBURG on 2/12/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "RLGCard.h"

@implementation RLGCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation RLGCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];
    
    return [self initWithSuit:suit image:image];
}

@end
