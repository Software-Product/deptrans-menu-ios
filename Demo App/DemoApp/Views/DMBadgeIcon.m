//
//  DMBadgeIcon.m
//  DeptransMenu
//
//  Created by Vavilon on 17.06.14.
//

#import "DMBadgeIcon.h"
#import "DeptransMenu.h"

#define BadgeIconSize   20

@implementation DMBadgeIcon
{
    /// Лэйбл отображающий значение бэйджа
    UILabel *badgeLabel;
}

@synthesize backgroundImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self intialize];
    }
    return self;
}

- (void)intialize
{
    self.frame = CGRectMake(0, 0, 0, 0);
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;
    
    UIImage *image = [UIImage imageWithContentsOfFile:[DeptransMenu pathToBundleResource:@"red_badge" ofType:@"png"]];
    backgroundImage = [[UIImageView alloc] initWithImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f)]];
    backgroundImage.image = image;
    backgroundImage.frame = self.bounds;
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:backgroundImage];
    
    badgeLabel = [UILabel new];
    badgeLabel.backgroundColor = [UIColor clearColor];
    badgeLabel.textColor = [UIColor whiteColor];
    badgeLabel.frame = CGRectMake( 0, 0, BadgeIconSize, BadgeIconSize);
    badgeLabel.textAlignment = NSTextAlignmentCenter;
    badgeLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [self addSubview:badgeLabel];
}

- (void)setBadgeValue:(NSInteger)badgeValue{
    _badgeValue = badgeValue;
    
    if (badgeValue < 100)
        badgeLabel.text = [NSString stringWithFormat:@"%d", badgeValue];
    else if (badgeValue >= 100)
        badgeLabel.text = @"99";
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 0, 0)];
}

- (void)setFrame:(CGRect)frame
{
    NSInteger deltaWidth;
    
    if (abs(self.badgeValue) < 10)
        deltaWidth = 0;
    else
        deltaWidth = 4;
    
    [super setFrame:CGRectMake(frame.origin.x - deltaWidth, frame.origin.y,
                               BadgeIconSize + deltaWidth, BadgeIconSize)];
    
    badgeLabel.frame = CGRectMake(0, 0,
                                       BadgeIconSize + deltaWidth,
                                       BadgeIconSize);
    
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    if ( [ver floatValue] >= 7.0f ) {
        CGRect fr = badgeLabel.frame;
        fr.origin.y = -1;
        badgeLabel.frame = fr;
    }
    
    backgroundImage.frame = CGRectMake(0, 0, BadgeIconSize + deltaWidth, BadgeIconSize);
}

@end
