//
//  Copyright (C) 2020 Twilio, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>

#import "TVIAppScreenSourceOptions+Internal.h"

@implementation TVIAppScreenSourceOptionsBuilder

- (instancetype)init {
    self = nil;

    NSException *exception = [NSException exceptionWithName:@"TVICameraSourceOptionsBuilderInitializationException"
                                                     reason:@"Use the TVIAppScreenSourceOptionsBuilderBlock to configure a TVIAppScreenSourceOptionsBuilder instance."
                                                   userInfo:nil];
    [exception raise];

    return self;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self != nil) {
        _screenContent = TVIScreenContentDefault;
    }
    return self;
}

@end

@implementation TVIAppScreenSourceOptions

- (instancetype)init {
    self = nil;

    NSException *exception = [NSException exceptionWithName:@"TVIAppScreenSourceOptionsInitializationException"
                                                     reason:@"Use optionsWithBlock: to create a TVIAppScreenSourceOptions instance."
                                                   userInfo:nil];
    [exception raise];

    return self;
}

- (instancetype)initWithBuilder:(TVIAppScreenSourceOptionsBuilder *)builder {
    self = [super init];
    if (self) {
        _screenContent = builder.screenContent;
    }
    return self;
}

+ (instancetype)optionsWithBlock:(TVIAppScreenSourceOptionsBuilderBlock)builderBlock {
    if (builderBlock == nil) {
        NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                         reason:@"A builder block is required."
                                                       userInfo:nil];
        [exception raise];
    }

    TVIAppScreenSourceOptionsBuilder *builder = [[TVIAppScreenSourceOptionsBuilder alloc] initPrivate];
    builderBlock(builder);
    return [[TVIAppScreenSourceOptions alloc] initWithBuilder:builder];
}

@end