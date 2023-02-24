/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <folly/dynamic.h>
#include <ABI47_0_0jsi/ABI47_0_0jsi.h>

namespace ABI47_0_0facebook {
namespace jsi {

ABI47_0_0facebook::jsi::Value valueFromDynamic(
    ABI47_0_0facebook::jsi::Runtime& runtime,
    const folly::dynamic& dyn);

folly::dynamic dynamicFromValue(
    ABI47_0_0facebook::jsi::Runtime& runtime,
    const ABI47_0_0facebook::jsi::Value& value);

} // namespace jsi
} // namespace ABI47_0_0facebook
