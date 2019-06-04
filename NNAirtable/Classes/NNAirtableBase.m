//
//  NNAirtableBase.m
//  AFNetworking
//
//  Created by Koichi Yamamoto on 2019/06/04.
//

#import "NNAirtableBase.h"
#import "NNAirtableTable.h"



@implementation NNAirtableBase{
	NSString* _baseId;
}


-(instancetype)initWithBaseId:(NSString*)baseId{
	if( self = [super init] ){
		_baseId = baseId;
	}
	return self;
}


-(NSString*)id{
	return _baseId;
}


-(NNAirtableTable*)tableWithId:(NSString*)id{
	return [[NNAirtableTable alloc] initWithTableId:id base:self];
}

@end
