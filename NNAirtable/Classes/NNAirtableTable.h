//
//  NNAirtableTable.h
//  AFNetworking
//
//  Created by Koichi Yamamoto on 2019/06/04.
//

#import <Foundation/Foundation.h>
@class NNAirtableBase;

NS_ASSUME_NONNULL_BEGIN

@interface NNAirtableTable : NSObject

-(instancetype)initWithTableId:(NSString*)tableId base:(NNAirtableBase*)base;
-(void)selectWithViewName:(NSString*)viewName;

@end

NS_ASSUME_NONNULL_END
