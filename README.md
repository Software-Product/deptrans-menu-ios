<meta charset='utf-8'>
# Транспортное меню <h1>

## Интеграция <h2>

- **[1] Добавить библиотеку к проекту (скопировать файлы DeptransMenu.h, DeptransMenuResources.bundle, libdeptransMenuLibrary.a)
- Подключить библиотеку к тому контроллеру из которого будет открываться меню
        ```
        #import "DeptransMenu.h"
        ```
- **[3] Для быстрой предзагрузки данных  также подключить библиотеку к  AppDelegate и вызвать preloadUpdates в методе 
        ```
        - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
        {
            /// loads menu's items
            [DeptransMenu preloadUpdates];
            ...
        ```
## Конфигурация слайдера <h2>
Сделать контролер в котором открывается библиотека делегатом (если нужно кастомизировать появление, исчезновение и открытие ссылки при выборе пунтков). подробности смотреть в файле Deptrans.h
        ```
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
         ```