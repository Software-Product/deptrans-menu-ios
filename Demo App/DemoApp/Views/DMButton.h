//
//  MenuButton.h
//  DeptransMenu
//
//  Created by Vavilon on 17.06.14.
 //

#import <UIKit/UIKit.h>
#import "DMBadgeIcon.h"

@interface DMButton : UIButton

/// бэйдж указывающий на количество обновлений
@property (nonatomic,strong) DMBadgeIcon *badgeIcon;

/// Значение бэйджа
@property (nonatomic,assign) NSInteger badgeValue;

/// Позиция бэйджа
@property (nonatomic,assign) UIOffset badgePositionOffset;

@end
