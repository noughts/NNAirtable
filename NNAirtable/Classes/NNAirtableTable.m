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

-(FBLPromise<NSArray*>*)selectWithViewName:(NSString*)viewName{
	return [FBLPromise onQueue:dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT) do:^id _Nullable{
		NSMutableArray* ary = [@[] mutableCopy];
		NSError* error;
		NSString* offset = nil;
		for( int i=0; i<100; i++){
			FBLPromise<NSDictionary*>* promise = [self selectWithName:viewName offset:offset];
			NSDictionary* result = FBLPromiseAwait(promise, &error);
			if( error ){
				return error;
			}
			[ary addObjectsFromArray:result[@"records"]];
			if( result[@"offset"] ){
				offset = result[@"offset"];
			} else {
				break;
			}
		}
		return ary;
	}];
}


-(FBLPromise<NSDictionary*>*)selectWithName:(NSString*)viewName offset:(NSString*)offset{
	return [FBLPromise async:^(FBLPromiseFulfillBlock fulfill, FBLPromiseRejectBlock reject) {
		NSString* key = NSProcessInfo.processInfo.environment[@"AIRTABLE_API_KEY"];
		NSAssert(key, @"Environment Variables に AIRTABLE_API_KEY をセットしてください");
		NSString* url;
		if( offset ){
			url = [NSString stringWithFormat:@"https://api.airtable.com/v0/%@/%@?view=%@&offset=%@&api_key=%@", self->_base.id, self->_id, viewName, offset, key];
		} else {
			url = [NSString stringWithFormat:@"https://api.airtable.com/v0/%@/%@?view=%@&api_key=%@", self->_base.id, self->_id, viewName, key];
		}
		AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
		[manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary* responseObject) {
			//		NSArray* records = responseObject[@"records"];
//			NSLog(@"%@", responseObject);
			fulfill(responseObject);
		} failure:^(NSURLSessionTask *operation, NSError *error){
			// エラーの場合の処理
			reject(error);
		}];
	}];
}


@end
