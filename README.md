# Транспортное меню 
## Интеграция 

- Добавить библиотеку к проекту (скопировать файлы **DeptransMenu.h**, **DeptransMenuResources.bundle**, **libdeptransMenuLibrary.a**)
- Подключить библиотеку к тому контроллеру из которого будет открываться меню

        
        #import "DeptransMenu.h"
       
- Для быстрой предзагрузки данных подключить библиотеку к  AppDelegate и вызвать метод **preloadUpdates** в **didFinishLaunchingWithOptions** 
        
        - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
        {
            /// loads menu's items
            [DeptransMenu preloadUpdates];
            ...
        
## Конфигурация слайдера 

В случае необходимости кастомизировать появление, исчезновение и открытие ссылки при выборе пунтков меню, сделать контроллер в котором открывается меню делегатом. Подробности можно смотреть в файле ***Deptrans.h***
        
        @inteface myUiviewController()<DeptransMenuDelegate>

        ...
    
        /// Пример использования (можно прикрепить это к события нажатия на кнопку)
        [DeptransMenu addDelegate:self];
        [DeptransMenu setShowsStatusBarOnHostApplication:YES];
        [DeptransMenu setShowsStatusBarWhenMenuIsOpened:NO];
        /// Подписаться на обновления
        [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(onMenuBadgeUpdateNotification:)
        name:DeptransMenuHasUpdatesNotification
        object:nil];

        ...
        
        /*!
        * @discussion Update notification badge if needed
        * @param note The notification sent
        */
        - (void) onMenuBadgeUpdateNotification:(NSNotification *)note {
        [_menuButton setBadgeValue:[DeptransMenu numberOfUpdatesAvailable]];
        }
         