//
//  NNAirtable.h
//  AFNetworking
//
//  Created by Koichi Yamamoto on 2019/06/04.
//

#import <Foundation/Foundation.h>
#import "NNAirtableBase.h"
#import "NNAirtableTable.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNAirtable : NSObject

-(NNAirtableBase*)baseWithId:(NSString*)baseId;

@end

NS_ASSUME_NONNULL_END
