//
//  BLLiftGammaGainFilter.h
//  BLLiftGammaGain
//
//  Created by Grant Hobbs on 7/26/14.
//  Copyright (c) 2014 Grant Hobbs. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface BLLiftGammaGainFilter : CIFilter
{
    CIImage *inputImage;
    CIColor *inputLift;
    CIColor *inputGamma;
    CIColor *inputGain;
}

@end