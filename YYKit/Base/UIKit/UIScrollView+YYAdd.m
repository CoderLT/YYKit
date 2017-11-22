//
//  UIScrollView+YYAdd.m
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 13/4/5.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UIScrollView+YYAdd.h"
#import "YYKitMacro.h"

YYSYNTH_DUMMY_CLASS(UIScrollView_YYAdd)

#define SYSTEM_VERSION_GREATER_NOT_LESS_THAN(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@implementation UIScrollView (YYExtension)
- (UIEdgeInsets)yy_inset {
#ifdef __IPHONE_11_0
    if (SYSTEM_VERSION_GREATER_NOT_LESS_THAN(@"11.0")) {
        return self.adjustedContentInset;
    }
#endif
    return self.contentInset;
}

- (void)setYy_insetT:(CGFloat)yy_insetT {
    UIEdgeInsets inset = self.contentInset;
    inset.top = yy_insetT;
#ifdef __IPHONE_11_0
    if (SYSTEM_VERSION_GREATER_NOT_LESS_THAN(@"11.0")) {
        inset.top -= (self.adjustedContentInset.top - self.contentInset.top);
    }
#endif
    self.contentInset = inset;
}

- (CGFloat)yy_insetT {
    return self.yy_inset.top;
}

- (void)setYy_insetB:(CGFloat)yy_insetB {
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = yy_insetB;
#ifdef __IPHONE_11_0
    if (SYSTEM_VERSION_GREATER_NOT_LESS_THAN(@"11.0")) {
        inset.bottom -= (self.adjustedContentInset.bottom - self.contentInset.bottom);
    }
#endif
    self.contentInset = inset;
}

- (CGFloat)yy_insetB {
    return self.yy_inset.bottom;
}

- (void)setYy_insetL:(CGFloat)yy_insetL {
    UIEdgeInsets inset = self.contentInset;
    inset.left = yy_insetL;
#ifdef __IPHONE_11_0
    if (SYSTEM_VERSION_GREATER_NOT_LESS_THAN(@"11.0")) {
        inset.left -= (self.adjustedContentInset.left - self.contentInset.left);
    }
#endif
    self.contentInset = inset;
}

- (CGFloat)yy_insetL {
    return self.yy_inset.left;
}

- (void)setYy_insetR:(CGFloat)yy_insetR {
    UIEdgeInsets inset = self.contentInset;
    inset.right = yy_insetR;
#ifdef __IPHONE_11_0
    if (SYSTEM_VERSION_GREATER_NOT_LESS_THAN(@"11.0")) {
        inset.right -= (self.adjustedContentInset.right - self.contentInset.right);
    }
#endif
    self.contentInset = inset;
}

- (CGFloat)yy_insetR {
    return self.yy_inset.right;
}

- (void)setYy_offsetX:(CGFloat)yy_offsetX {
    CGPoint offset = self.contentOffset;
    offset.x = yy_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)yy_offsetX {
    return self.contentOffset.x;
}

- (void)setYy_offsetY:(CGFloat)yy_offsetY {
    CGPoint offset = self.contentOffset;
    offset.y = yy_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)yy_offsetY {
    return self.contentOffset.y;
}

- (void)setYy_contentW:(CGFloat)yy_contentW {
    CGSize size = self.contentSize;
    size.width = yy_contentW;
    self.contentSize = size;
}

- (CGFloat)yy_contentW {
    return self.contentSize.width;
}

- (void)setYy_contentH:(CGFloat)yy_contentH {
    CGSize size = self.contentSize;
    size.height = yy_contentH;
    self.contentSize = size;
}

- (CGFloat)yy_contentH {
    return self.contentSize.height;
}
@end
#pragma clang diagnostic pop

@implementation UIScrollView (YYAdd)

- (void)scrollToTop {
    [self scrollToTopAnimated:YES];
}

- (void)scrollToBottom {
    [self scrollToBottomAnimated:YES];
}

- (void)scrollToLeft {
    [self scrollToLeftAnimated:YES];
}

- (void)scrollToRight {
    [self scrollToRightAnimated:YES];
}

- (void)scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.yy_insetT;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.yy_contentH - self.bounds.size.height + self.yy_insetB;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.yy_insetL;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.yy_contentW - self.bounds.size.width + self.yy_insetR;
    [self setContentOffset:off animated:animated];
}

@end
