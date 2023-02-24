/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ABI47_0_0RCTDatePickerManager.h"
#import "ABI47_0_0RCTBridge.h"
#import "ABI47_0_0RCTDatePicker.h"
#import "ABI47_0_0UIView+React.h"

@implementation ABI47_0_0RCTConvert (UIDatePicker)

ABI47_0_0RCT_ENUM_CONVERTER(
    UIDatePickerMode,
    (@{
      @"time" : @(UIDatePickerModeTime),
      @"date" : @(UIDatePickerModeDate),
      @"datetime" : @(UIDatePickerModeDateAndTime),
      @"countdown" : @(UIDatePickerModeCountDownTimer), // not supported yet
    }),
    UIDatePickerModeTime,
    integerValue)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_14_0

ABI47_0_0RCT_ENUM_CONVERTER(
    UIDatePickerStyle,
    (@{
      @"compact" : @(UIDatePickerStyleCompact),
      @"spinner" : @(UIDatePickerStyleWheels),
      @"inline" : @(UIDatePickerStyleInline),
    }),
    UIDatePickerStyleAutomatic,
    integerValue)
#endif
#pragma clang diagnostic pop
@end

@implementation ABI47_0_0RCTDatePickerManager

@synthesize viewRegistry_DEPRECATED = _viewRegistry_DEPRECATED;

ABI47_0_0RCT_EXPORT_MODULE()

- (UIView *)view
{
  ABI47_0_0RCTNewArchitectureValidationPlaceholder(
      ABI47_0_0RCTNotAllowedInFabricWithoutLegacy,
      self,
      @"This native component is still using the legacy interop layer -- please migrate it to use a Fabric specific implementation.");
  return [ABI47_0_0RCTDatePicker new];
}

ABI47_0_0RCT_EXPORT_VIEW_PROPERTY(date, NSDate)
ABI47_0_0RCT_EXPORT_VIEW_PROPERTY(locale, NSLocale)
ABI47_0_0RCT_EXPORT_VIEW_PROPERTY(minimumDate, NSDate)
ABI47_0_0RCT_EXPORT_VIEW_PROPERTY(maximumDate, NSDate)
ABI47_0_0RCT_EXPORT_VIEW_PROPERTY(minuteInterval, NSInteger)
ABI47_0_0RCT_EXPORT_VIEW_PROPERTY(onChange, ABI47_0_0RCTBubblingEventBlock)
ABI47_0_0RCT_REMAP_VIEW_PROPERTY(mode, datePickerMode, UIDatePickerMode)
ABI47_0_0RCT_REMAP_VIEW_PROPERTY(timeZoneOffsetInMinutes, timeZone, NSTimeZone)

ABI47_0_0RCT_EXPORT_METHOD(setNativeDate : (nonnull NSNumber *)viewTag toDate : (NSDate *)date)
{
  [_viewRegistry_DEPRECATED addUIBlock:^(ABI47_0_0RCTViewRegistry *viewRegistry) {
    UIView *view = [viewRegistry viewForABI47_0_0ReactTag:viewTag];
    if ([view isKindOfClass:[ABI47_0_0RCTDatePicker class]]) {
      [(ABI47_0_0RCTDatePicker *)view setDate:date];
    } else {
      // This component is used in Fabric through LegacyInteropLayer.
      // `ABI47_0_0RCTDatePicker` view is subview of `ABI47_0_0RCTLegacyViewManagerInteropComponentView`.
      // `viewTag` passed as parameter to this method is tag of the `ABI47_0_0RCTLegacyViewManagerInteropComponentView`.
      UIView *subview = view.subviews.firstObject;
      if ([subview isKindOfClass:[ABI47_0_0RCTDatePicker class]]) {
        [(ABI47_0_0RCTDatePicker *)subview setDate:date];
      } else {
        ABI47_0_0RCTLogError(@"view type must be ABI47_0_0RCTDatePicker");
      }
    }
  }];
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_14_0
ABI47_0_0RCT_CUSTOM_VIEW_PROPERTY(pickerStyle, UIDatePickerStyle, ABI47_0_0RCTDatePicker)
{
  if (@available(iOS 14, *)) {
    // If the style changed, then the date picker may need to be resized and will generate a layout pass to display
    // correctly. We need to prevent that to get consistent layout. That's why we memorise the old frame and set it
    // after style is changed.
    CGRect oldFrame = view.frame;
    if (json) {
      UIDatePickerStyle style = [ABI47_0_0RCTConvert UIDatePickerStyle:json];
      view.preferredDatePickerStyle = style;
    } else {
      view.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }
    view.frame = oldFrame;
  }
}
#endif
@end
