//
//  NNAirtableBase.h
//  AFNetworking
//
//  Created by Koichi Yamamoto on 2019/06/04.
//

#import <Foundation/Foundation.h>
@class NNAirtableTable;

NS_ASSUME_NONNULL_BEGIN

@interface NNAirtableBase : NSObject

-(instancetype)initWithBaseId:(NSString*)baseId;
-(NSString*)id;
-(NNAirtableTable*)tableWithId:(NSString*)id;

@end

NS_ASSUME_NONNULL_END
