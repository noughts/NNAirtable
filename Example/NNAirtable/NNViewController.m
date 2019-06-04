//
//  NNViewController.m
//  NNAirtable
//
//  Created by koichi yamamoto on 06/04/2019.
//  Copyright (c) 2019 koichi yamamoto. All rights reserved.
//

#import "NNViewController.h"

#import <NNAirtable/NNAirtable.h>


@interface NNViewController ()

@end

@implementation NNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//	NSLog(@"%@", NSProcessInfo.processInfo.environment[@"AIRTABLE_API_KEY"]);
	
	NNAirtable* airtable = [NNAirtable new];
	NNAirtableBase* base = [airtable baseWithId:@"appoPqFABkgY3sBH9"];
	NNAirtableTable* table = [base tableWithId:@"5_30"];
	[table selectWithViewName:@"default"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
