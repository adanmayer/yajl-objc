//
//  YAJLDocumentDelegateTest.m
//  YAJL
//
//  Created by Gabriel Handford on 3/29/10.
//  Copyright 2010 Yelp. All rights reserved.
//

#import "NSString+SBJSON.h"

static NSInteger docIndex;

@interface YAJLDocumentDelegateTest : YAJLTestCase <YAJLDocumentDelegate> {}
@end

@implementation YAJLDocumentDelegateTest

- (void)test {
  NSData *data = [self loadData:@"document_streaming"];
  NSError *error = nil;
  docIndex = 1;
  YAJLDocument *document = [[YAJLDocument alloc] init];
  document.delegate = self;
  [document parse:data error:&error];
  GHAssertNil(error, nil);
}

- (void)document:(YAJLDocument *)document didSetObject:(id)object forKey:(id)key inDictionary:(NSDictionary *)dict {
  if ([key isEqualToString:@"test"]) return;
  
  NSString *expectedKey = [NSString stringWithFormat:@"array%ld", (signed long)docIndex];
  NSArray *expectedValue = [NSArray arrayWithObject:[NSNumber numberWithInteger:docIndex]];
  docIndex++;
  GHAssertEqualStrings(expectedKey, key, nil);
  GHAssertEqualObjects(expectedValue, object, nil);
  GHTestLog(@"Set object (dict): %@=%@", key, object);
}

@end
