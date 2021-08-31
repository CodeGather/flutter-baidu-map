//
//  UIColor+BMFString.m
//  flutter_baidu_mapapi_base
//
//  Created by zbj on 2020/2/12.
//

#import "UIColor+BMFString.h"

@implementation UIColor (BMFString)

/// 16进制colorString -> UIColor
+ (UIColor *)fromColorString:(NSString *)colorString{
 
    NSString *cString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // cString.leng == 6 or 8
    if (cString.length != 6 && cString.length != 8) {
        return [UIColor clearColor];
    }

    // 从6 or 8 位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *aString, *rString, *gString, *bString;
    unsigned int a, r, g, b;
    // rgb
    if (cString.length == 6) {
        rString = [cString substringWithRange:range];

        range.location = 2;
        gString = [cString substringWithRange:range];

        range.location = 4;
        bString = [cString substringWithRange:range];

        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0];
    }
    
    // cString.length == 8 argb
    aString = [cString substringWithRange:range];

    range.location = 2;
    rString = [cString substringWithRange:range];

    range.location = 4;
    gString = [cString substringWithRange:range];

    range.location = 6;
    bString = [cString substringWithRange:range];

    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:((float) a / 255.0f)];
}

+ (NSString *)colorStringFrom:(UIColor *)color{
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    // argb
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX", lroundf(a * 255), lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];;
}
@end
