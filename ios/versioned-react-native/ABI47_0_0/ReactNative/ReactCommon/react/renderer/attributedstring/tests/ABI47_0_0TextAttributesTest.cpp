/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#include <gtest/gtest.h>
#include <ABI47_0_0React/ABI47_0_0renderer/attributedstring/TextAttributes.h>
#include <ABI47_0_0React/ABI47_0_0renderer/attributedstring/conversions.h>
#include <ABI47_0_0React/ABI47_0_0renderer/attributedstring/primitives.h>
#include <ABI47_0_0React/ABI47_0_0renderer/graphics/conversions.h>

namespace ABI47_0_0facebook {
namespace ABI47_0_0React {

#ifdef ANDROID

TEST(TextAttributesTest, testToDynamic) {
  auto textAttributes = TextAttributes{};
  textAttributes.foregroundColor = {
      colorFromComponents({200 / 255.0, 153 / 255.0, 100 / 255.0, 1.0})};
  textAttributes.opacity = 0.5;
  textAttributes.fontStyle = FontStyle::Italic;
  textAttributes.fontWeight = FontWeight::Thin;
  textAttributes.fontVariant = FontVariant::TabularNums;

  auto result = toDynamic(textAttributes);
  ABI47_0_0EXPECT_EQ(
      result["foregroundColor"], toDynamic(textAttributes.foregroundColor));
  ABI47_0_0EXPECT_EQ(result["opacity"], textAttributes.opacity);
  ABI47_0_0EXPECT_EQ(result["fontStyle"], toString(textAttributes.fontStyle.value()));
  ABI47_0_0EXPECT_EQ(result["fontWeight"], toString(textAttributes.fontWeight.value()));
}

#endif

} // namespace ABI47_0_0React
} // namespace ABI47_0_0facebook
