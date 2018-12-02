//
//  Colors.m
//  Awake
//
//  Created by Amrinder Grewal on 2014-11-24.
//  Copyright (c) 2014 Amrinder Grewal. All rights reserved.
//

#import "Colors.h"

@implementation Colors

+(UIColor*) TextColor{
    return [self SameColor];
}//+(UIColor*) TextColor

+(UIColor*) BorderColor{
    return [self SameColor];
}//+(UIColor*) BorderColor

+(UIColor*) SymbolColor{
    //If modifying this color, dont forget to modify SecondsBarGradient.m
    return [self SameColor];
}//+(UIColor*) SymbolColor

//If modifying this color, dont forget to modify SecondsBarGradient.m
+(UIColor*) SameColor{
    UIColor* sameColor = [UIColor colorWithRed:0.900 green:0.900 blue:0.900 alpha:1.0];
    return sameColor;
}//+(UIColor*) SameColor

+(gradientStruct) GradientColorWithHour: (int) minute{
    gradientStruct newColor;
    if ((minute < 6) || (minute > 20)){
        //Gradient created from 4AM to 6AM and between 8PM and 10PM
        newColor.locations[0] = 0.0f;
        newColor.locations[1] = 0.7f;
        
        newColor.colors[0] = 0.816f;
        newColor.colors[1] = 0.478f;
        newColor.colors[2] = 0.212f;
        newColor.colors[3] = 1.0f;
        newColor.colors[4] = 0.051f;
        newColor.colors[5] = 0.043f;
        newColor.colors[6] = 0.286f;
        newColor.colors[7] = 1.0f;
    } else if ((minute < 19)) {
        //Gradient created from 6AM to 7PM
        newColor.locations[0] = 0.0f;
        newColor.locations[1] = 0.7f;
        
        newColor.colors[0] = 1.0f;
        newColor.colors[1] = 0.792f;
        newColor.colors[2] = 0.008f;
        newColor.colors[3] = 0.3f;
        newColor.colors[4] = 0.0f;
        newColor.colors[5] = 0.749f;
        newColor.colors[6] = 1.0f;
        newColor.colors[7] = 0.47f;
    } else {
        //Gradient created from 7PM to 9PM
        newColor.locations[0] = 0.0f;
        newColor.locations[1] = 0.7f;
        
        newColor.colors[0] = 0.941f;
        newColor.colors[1] = 0.878f;
        newColor.colors[2] = 0.529f;
        newColor.colors[3] = 1.0f;
        newColor.colors[4] = 0.706f;
        newColor.colors[5] = 0.314f;
        newColor.colors[6] = 0.0f;
        newColor.colors[7] = 0.92f;
    }
    return newColor;
}//+(gradientStruct) GradientColor

+(UIColor*) HomeBackgroundDarkColor{
    return [UIColor colorWithRed:0.051f green:0.043f blue:0.286f alpha:1.0f];
}//+(UIColor*) HomeBackgroundDarkColor

+(UIColor*) MainLabelTextColor{
    //return [UIColor colorWithRed:0.53f green:0.88f blue:0.80f alpha:1.0f];
    return [self SameColor];
}//+(UIColor*) MainLabelTextColor

+(UIColor*) LabelTextColorBackground{
    return [UIColor clearColor];
}//+(UIColor*) LabelTextColorBackground

+(UIColor*) ActiveAlarmText{
    return [self SameColor];
}//+(UIColor*) ActiveAlarmText

+(UIColor*) InactiveAlarmText{
    return [UIColor colorWithRed:0.537 green:0.537 blue:0.537 alpha:1];
}//+(UIColor*) InactiveAlarmText

+(UIColor*) DeleteIconBackGround{
    return [UIColor colorWithRed:0.931 green:0.296 blue:0.308 alpha:1];
}//+(UIColor*) DeleteIconBackGround

+(UIColor*) DeleteIconBorder{
    return [UIColor colorWithRed:0.831 green:0.196 blue:0.208 alpha:1];
}//+(UIColor*) DeleteIconBorder

+(UIColor*) OnIndicator{
    return [UIColor colorWithRed:0.639 green:0.831 blue:0.337 alpha:1];
}//+(UIColor*) OnIndicator

+(UIColor*) OffIndicator{
    return [UIColor colorWithRed:0.925 green:0.2 blue:0.188 alpha:1];
}//+(UIColor*) OffIndicator

+(CGFloat) AlphaOfActiveImage{
    return 1.0;
}//+(CGFloat*) AlphaOfActiveImage

+(CGFloat) AlphaOfInActiveImage{
    return 0.50;
}//+(CGFloat*) AlphaOfInActiveImage

@end//@implementation Colors
