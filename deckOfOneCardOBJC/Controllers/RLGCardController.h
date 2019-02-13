//
//  RLGCardController.h
//  deckOfOneCardOBJC
//
//  Created by RYAN GREENBURG on 2/12/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLGCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RLGCardController : NSObject

+ (RLGCardController *) sharedInstance;

+(void)drawNewCard:(NSInteger)draw completion: (void (^_Nullable) (RLGCard *_Nullable card))completion;

+(void)fetchImageFor:(RLGCard *)card completion: (void (^_Nullable) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
