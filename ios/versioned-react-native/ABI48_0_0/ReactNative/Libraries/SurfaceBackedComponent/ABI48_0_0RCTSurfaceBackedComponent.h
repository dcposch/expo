/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <ComponentKit/CKComponent.h>
#import <ComponentKit/CKCompositeComponent.h>
#import <ABI48_0_0RCTSurfaceHostingComponent/ABI48_0_0RCTSurfaceHostingComponentOptions.h>
#import <ABI48_0_0React/ABI48_0_0RCTSurfacePresenter.h>

@class ABI48_0_0RCTBridge;

/**
 * ComponentKit component represents a ABI48_0_0React Native Surface created
 * (and stored in the state) with given `bridge`, `moduleName`,
 * and `properties`.
 */
@interface ABI48_0_0RCTSurfaceBackedComponent : CKCompositeComponent

+ (instancetype)newWithBridge:(ABI48_0_0RCTBridge *)bridge
             surfacePresenter:(ABI48_0_0RCTSurfacePresenter *)surfacePresenter
                   moduleName:(NSString *)moduleName
                   properties:(NSDictionary *)properties
                      options:(ABI48_0_0RCTSurfaceHostingComponentOptions)options;

@end
