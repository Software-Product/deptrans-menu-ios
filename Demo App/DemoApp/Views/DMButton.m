//
//  MenuButton.m
//  DeptransMenu
//
//  Created by Vavilon on 17.06.14.
//

#import "DMButton.h"

@implementation DMButton

-(id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    /// Стандартная инициализация
    self.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"menu_button"];
    [self setImage:image forState:UIControlStateNormal];
    self.tintColor = [UIColor whiteColor];
    self.badgeIcon = [DMBadgeIcon new];
    self.badgeIcon.hidden = YES;
    [self addSubview:self.badgeIcon];
}

- (void)setBadgeValue:(NSInteger)bageValue
{
    if (bageValue > 0) {
        self.badgeIcon.badgeValue = bageValue;
        self.badgeIcon.hidden = NO;
    }else{
        self.badgeIcon.hidden = YES;
    }
}

- (void)setBadgePositionOffset:(UIOffset)badgePositionOffset
{
    _badgePositionOffset = badgePositionOffset;
    self.badgeIcon.frame = CGRectMake(badgePositionOffset.horizontal,
                                      badgePositionOffset.vertical, 0, 0);
}

@end
