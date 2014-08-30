//
//  BLLiftGammaGainPlugInLoader.h
//  BLLiftGammaGain
//
//  Created by Grant Hobbs on 7/26/14.
//  Copyright (c) 2014 Grant Hobbs. All rights reserved.
//

#import <QuartzCore/CoreImage.h>

@interface BLLiftGammaGainPlugInLoader : NSObject <CIPlugInRegistration>

- (BOOL)load:(void *)host;

@end
