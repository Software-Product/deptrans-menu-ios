//
//  DMBadgeIcon.h
//  DeptransMenu
//
//  Created by Vavilon on 17.06.14.
//

#import <UIKit/UIKit.h>

@interface DMBadgeIcon : UIView

/// Значение бэйджа
@property (nonatomic,assign) NSInteger badgeValue;
/// Фоновое изображение
@property (nonatomic) UIImageView *backgroundImage;

@end
