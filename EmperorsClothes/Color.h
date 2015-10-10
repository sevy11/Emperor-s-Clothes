//
//  Color.h
//  EmperorsClothes
//
//  Created by Michael Sevy on 10/3/15.
//  Copyright © 2015 Michael Sevy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Color : NSObject
//whites
+ (UIColor *) snow;
+ (UIColor *) ghostWhite;
+ (UIColor *) peachPuff;//255-218-185
+ (UIColor *) ivory;//	255-255-240;
+ (UIColor *) seashell;//	255-245-238;
+ (UIColor *) honeydew;//	240-255-240;
+ (UIColor *) lavender;//	230-230-250;
+ (UIColor *) mistyRose;//	255-228-225;
//grays
+ (UIColor *) dimGray;//	105-105-105;
+ (UIColor *) slateGray;//	112-138-144;
+ (UIColor *) gray;//	190-190-190;
+ (UIColor *) lightGray;//	211-211-211;
//blues
+ (UIColor *) midnightBlue;//	25-25-112;
+ (UIColor *) navy;//	0-0-128;
+ (UIColor *) slateBlue;//	106-90-205;
+ (UIColor *) mediumBlue;//	0-0-205;
+ (UIColor *) dodgerBlue;//	30-144-255;
+ (UIColor *) lightSkyBlue;//	135-206-250;
+ (UIColor *) steelBlue;//	70-130-180;
+ (UIColor *) darkTurquoise;//	0-206-209;
+ (UIColor *) turquoise;//	64-224-208;
+ (UIColor *) cyan;//	0-255-255;
//greens
+ (UIColor *) aquamarine;//	127-255-212;
+ (UIColor *) darkGreen;//	0-100-0;
+ (UIColor *) seaGreen;//	46-139-87;
+ (UIColor *) lightSeaGreen;//	32-178-170;
+ (UIColor *) springGreen;//	0-255-127;
+ (UIColor *) lawnGreen;//	124-252-0;
+ (UIColor *) chartreuse;//	127-255-0;
+ (UIColor *) limeGreen;//	50-205-50;
+ (UIColor *) forestGreen;//	34-139-34;
+ (UIColor *) oliveDrab;//	107-142-35;
+ (UIColor *) darkKhaki;//	189-183-107;
+ (UIColor *) khaki;//	240-230-140;
//yellows
+ (UIColor *) lightGoldenrodYellow;//	250-250-210;
+ (UIColor *) lightYellow;//	255-255-224
+ (UIColor *) gold;//	255-215-0;
+ (UIColor *) lightGoldenrod;//	238-221-130;
+ (UIColor *) goldenrod;//	218-165-32;
//browns
+ (UIColor *) rosyBrown;//	188-143-143;
+ (UIColor *) indianRed;//	205-92-92;
+ (UIColor *) sienna;//	160-82-45;
+ (UIColor *) peru;//	205-133-63;
+ (UIColor *) beige;//	245-245-220;
+ (UIColor *) wheat;//	245-222-179;
+ (UIColor *) sandyBrown;//	244-164-96;
+ (UIColor *) tan;//	210-180-140;
+ (UIColor *) chocolate;//	210-105-30;
//oranges
+ (UIColor *) darkSalmon;//	233-150-122;
+ (UIColor *) salmon;//	250-128-114;
+ (UIColor *) darkOrange;//	255-140-0;
+ (UIColor *) coral;//	255-127-80;
+ (UIColor *) tomato;//	255-99-71
+ (UIColor *) orangeRed;//	255-69-0;
+ (UIColor *) hotPink;//	255-105-180;
+ (UIColor *) deepPink;//	255-20-147;
+ (UIColor *) paleVioletRed;//	219-112-147;
+ (UIColor *) maroon;//	176-48-96;
+ (UIColor *) violetRed;//	208-32-144;
+ (UIColor *) violet;//	238-130-238;
+ (UIColor *) plum;//	221-160-221;
+ (UIColor *) orchid;//	218-112-214;
+ (UIColor *) darkViolet;//	148-0-211;
+ (UIColor *) blueViolet;//	138-43-226;
+ (UIColor *) thistle;//	216-191-216;


+ (UIImage *)imageWithColor:(UIColor *)color andBounds:(CGRect)imgBounds;



@end







