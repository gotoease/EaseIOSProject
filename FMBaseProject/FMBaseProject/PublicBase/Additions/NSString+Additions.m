//
//  NSString+Additions.m
//  FMBaseProject
//
//  Created by shanjin on 16/9/18.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (NSString *)trim{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}

- (BOOL)stringIsNumber {
    NSCharacterSet*cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString*filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [self isEqualToString:filtered];
    if(!basicTest) {
        return NO;
        
    }
    return YES;
}

- (BOOL)stringIsNumberOrChar {
    NSCharacterSet*cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
    NSString*filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [self isEqualToString:filtered];
    if(!basicTest) {
        return NO;
        
    }
    return YES;
}

- (BOOL)stringIsPersonCardNo {
    NSString *creditCardString = @"0123456789xX";
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:creditCardString] invertedSet];
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL result = [self isEqualToString:filtered];
    if(result==NO){
        return NO;
    }
    return YES;
}


- (BOOL)isEmoji {
    const unichar high = [self characterAtIndex: 0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}

- (BOOL)isIncludingEmoji {
    BOOL __block result = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

- (instancetype)removedEmojiString {
    NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              [buffer appendString:([substring isEmoji])? @"": substring];
                          }];
    
    return buffer;
}

+(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
}




@end
