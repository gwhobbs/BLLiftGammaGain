//
//  BLLiftGammaGainFilter.m
//  BLLiftGammaGain
//
//  Created by Grant Hobbs on 7/26/14.
//  Copyright (c) 2014 Grant Hobbs. All rights reserved.
//

#import "BLLiftGammaGainFilter.h"
#import <ApplicationServices/ApplicationServices.h>
#import <Foundation/Foundation.h>

@implementation BLLiftGammaGainFilter

static CIKernel *liftGammaGainKernel = nil;

- (id)init
{
    if (liftGammaGainKernel == nil) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSError *error = [[NSError alloc] init];
        NSString *code = [NSString stringWithContentsOfFile:[bundle pathForResource:@"BLLiftGammaGainFilterKernel" ofType:@"cikernel"] encoding:NSUTF8StringEncoding error:&error];
        NSArray *kernels = [CIKernel kernelsWithString:code];
        liftGammaGainKernel = kernels[0];
    }
    
    return [super init];
}

- (NSDictionary *)customAttributes
{
    return @{
             @"inputLift": @{
                     kCIAttributeClass: [CIColor class],
                     kCIAttributeDefault: [CIColor colorWithRed:0.f green:0.f blue:0.f alpha:1.0]
                     },
             @"inputGamma": @{
                     kCIAttributeClass: [CIColor class],
                     kCIAttributeDefault: [CIColor colorWithRed:0.f green:0.f blue:0.f alpha:1.0]
                     },
             @"inputGain": @{
                     kCIAttributeClass: [CIColor class],
                     kCIAttributeDefault: [CIColor colorWithRed:1.f green:1.f blue:1.f alpha:1.0]
                     }
             };
}

- (CIImage *)outputImage
{
    CISampler *src = [CISampler samplerWithImage:inputImage];
    
    return [self apply:liftGammaGainKernel, src, inputLift, inputGamma, inputGain, kCIApplyOptionDefinition, [src definition], nil];
}

@end
