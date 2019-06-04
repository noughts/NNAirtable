//
//  NNAirtableTable.m
//  AFNetworking
//
//  Created by Koichi Yamamoto on 2019/06/04.
//

#import "NNAirtableTable.h"
#import "NNAirtableBase.h"
#import <AFNetworking/AFNetworking.h>

@implementation NNAirtableTable{
	NSString* _id;
	NNAirtableBase* _base;
}

-(instancetype)initWithTableId:(NSString*)tableId base:(NNAirtableBase*)base{
	if( self = [super init] ){
		_id = tableId;
		_base = base;
	}
	return self;
}

-(void)selectWithViewName:(NSString*)viewName{
	NSString* key = NSProcessInfo.processInfo.environment[@"AIRTABLE_API_KEY"];
	NSString* url = [NSString stringWithFormat:@"https://api.airtable.com/v0/%@/%@?view=%@&api_key=%@", _base.id, _id, viewName, key];
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	[manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary* responseObject) {
//		NSArray* records = responseObject[@"records"];
		NSLog(@"%@", responseObject);
	} failure:^(NSURLSessionTask *operation, NSError *error){
		// エラーの場合の処理
		NSLog(@"%@", error);
	}];
}

@end
