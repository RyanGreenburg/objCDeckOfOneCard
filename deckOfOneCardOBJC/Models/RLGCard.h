//
//  RLGCard.h
//  deckOfOneCardOBJC
//
//  Created by RYAN GREENBURG on 2/12/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RLGCard : NSObject

@property (nonatomic, readonly) NSArray<NSString *> *card;
@property (nonatomic, readonly, copy) NSString *suit;
@property (nonatomic, readonly) NSString *image;

- (instancetype)initWithSuit:(NSString *)suit
                       image:(NSString *)image;

@end

@interface RLGCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
