//
//  NNAirtable.m
//  AFNetworking
//
//  Created by Koichi Yamamoto on 2019/06/04.
//

#import "NNAirtable.h"
#import "NNAirtableBase.h"

@implementation NNAirtable

-(NNAirtableBase*)baseWithId:(NSString*)baseId{
	return [[NNAirtableBase alloc] initWithBaseId:baseId];
}

@end
