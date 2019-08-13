//
//  DMAttachmentAssocate.m
//  EasyDarkMode
//
//  Created by Elenion on 2019/8/14.
//  Copyright © 2019 Elenion. All rights reserved.
//

#import "DMAttachmentAssocate.h"
#import <objc/runtime.h>

@implementation DMAttachmentAssocate

@end

@implementation NSTextAttachment (DMAssociate)

- (void)setDm_associate:(DMAttachmentAssocate *)dm_associate {
    objc_setAssociatedObject(self, @"dm_associate", dm_associate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (DMAttachmentAssocate *)dm_associate {
    DMAttachmentAssocate *associate = objc_getAssociatedObject(self, @"dm_associate");
    if (!associate) {
        associate = DMAttachmentAssocate.new;
        objc_setAssociatedObject(self, @"dm_associate", associate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return associate;
}

@end
