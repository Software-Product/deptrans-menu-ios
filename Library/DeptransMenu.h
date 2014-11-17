//
//  DeptransMenu.h
//

#import <Foundation/Foundation.h>

@protocol DeptransMenuDelegate;

@interface DeptransMenu : NSObject

/// Запрос статусов
+ (BOOL) menuIsAvailable;
+ (BOOL) menuIsVisible;
+ (NSUInteger) numberOfUpdatesAvailable;

/// Вывод меню
+ (void) showMenuAnimated:(BOOL)animated;

/// Закрытие меню
+ (void) hideMenuAnimated:(BOOL)animated;

/// Управление работой меню
+ (void) preloadUpdates;

// Получение ресурсов
+ (NSString *) pathToBundleResource:(NSString *)name ofType:(NSString *)type;

/// Методы добавления и удаления делегатов
+ (void) addDelegate:(id <DeptransMenuDelegate>)delegate;
+ (void) removeDelegate:(id)delegate;

/// Методы управления отображением

/// скруглять ли уголки основного приложения при открытом меню
+ (void) setHostApplicationRoundCorners:(BOOL)flag;

/// установка другого шрифта, отличного от HelveticaNeue. Задается fontName, без размера.
+ (void) setDefaultFont:(NSString *)regularFont lightFont:(NSString *)lightFont;

/// управление анимацией, ее скоростью, углом поворота и высотой остающейся снизу части. Значения по умолчанию — 0.35, 38, 0.8
+ (void) setPerspectiveAnimationDuration:(float)seconds angle:(float)degrees scale:(CGFloat)scale;

/// включает или отключает отображение статус-бара на скриншоте хост-приложения, который используется в анимации открытия меню
+ (void) setShowsStatusBarOnHostApplication:(BOOL)flag;

/// включает или отключает отображение статус-бара в самом меню, когда оно открыто
+ (void) setShowsStatusBarWhenMenuIsOpened:(BOOL)flag;


@end

/// Делегатный протокол
@protocol DeptransMenuDelegate <NSObject>
@optional
- (BOOL) deptransMenuShouldAppear;
- (BOOL) deptransMenuShouldClose;
/// Делегат принимает решение открывать ли ссылку или нет
- (BOOL) deptransMenuShouldOpenURL:(NSURL *)url;
@end


/// Оповещения
extern NSString * const DeptransMenuWillOpenNotification;
extern NSString * const DeptransMenuDidOpenNotification;
extern NSString * const DeptransMenuWillCloseNotification;
extern NSString * const DeptransMenuDidCloseNotification;

extern NSString * const DeptransMenuHasUpdatesNotification;

