//
//  HostViewController.m
//  DeptransMenu
//
//  Created by sig on 09.07.14.
//

#import "HostViewController.h"
#import "DMButton.h"
#import "DeptransMenu.h"

@interface HostViewController () <DeptransMenuDelegate> {
    DMButton *_menuButton;
}

@end


@implementation HostViewController

#pragma mark - Инициализация

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onMenuBadgeUpdateNotification:)
                                                     name:DeptransMenuHasUpdatesNotification
                                                   object:nil];
        
        [DeptransMenu addDelegate:self];
        
//        [DeptransMenu setHostApplicationRoundCorners:NO];
//        [DeptransMenu setDefaultFont:@"Avenir-Black" lightFont:@"Avenir-Light"];
        
//        [DeptransMenu setPerspectiveAnimationDuration:2.0f angle:37.0f scale:0.8f];

        [DeptransMenu setShowsStatusBarOnHostApplication:NO];
        [DeptransMenu setShowsStatusBarWhenMenuIsOpened:YES];

    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor = [UIColor clearColor];

    /// host background image
    UIImage *hostImage = [UIImage imageNamed:@"parking_app"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:hostImage];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    /// menu button
    _menuButton = [[DMButton alloc] initWithFrame:CGRectMake(10, 20, 40, 40)];
    [_menuButton setImage:[UIImage imageNamed:@"menu_button"] forState:UIControlStateNormal];
    _menuButton.badgeIcon.backgroundImage.image = [UIImage imageNamed:@"red_badge"];
    
    [_menuButton addTarget:self action:@selector(menuButtonTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_menuButton];
    _menuButton.badgePositionOffset = UIOffsetMake(20, 0);
    
    [_menuButton setBadgeValue:[DeptransMenu numberOfUpdatesAvailable]];
    
}

#pragma mark - Логика контроллера

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void) onMenuBadgeUpdateNotification:(NSNotification *)note {
    [_menuButton setBadgeValue:[DeptransMenu numberOfUpdatesAvailable]];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Обработка пользовательского взаимодействия

- (void) menuButtonTapped:(id)sender {
    [DeptransMenu showMenuAnimated:YES];
}


/*!	@function -deptransMenuShouldOpenURL
	@discussion	Этот метод указывает нужно ли открывать url
    @param URL проверяемый URL
	@result	Да или Нет (по умолчаниею ДА)
 */
- (BOOL) deptransMenuShouldOpenURL:(NSURL *)url
{
    return YES;
}


@end


#pragma mark -
#pragma mark - Старые методы

/*

// Обработка нажатия по кнопке перехода в приложение
- (void)startButtonTapped:(UIButton*)sender
{
    // задержка для получения того чтобы sender получил normal state перед захватом изображения
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        menuVC = [[DMViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:menuVC animated:NO completion:NULL];
    });
}

// Уведомление о необходимости обновления числа в бадже
- (void)onHostBadgeUpdateNotification:(NSNotification *)notification
{
    DPLogFast(@"");
    
    [NewItemsManager storeAppsAndLinksAsOldEntities];
    
    [self updateBadgeValue];
}
 
// Подсчитываем число новых приложений и веб-ресурсов и обновляем значение в бадже
- (void)updateBadgeValue {
   [startButton setBadgeValue:[NewItemsManager numberOfNewAppsAndLinks]];
}
 
- (void)onRequestFailure:(NSError*)error
 {
    if ([AppModel DP_hasAtLeastOneEntity] && [LinkModel DP_hasAtLeastOneEntity]) {
        [self onRequestCompletion];
        return;
    }

    // показываем алерт с ошибкой
    [DialogHelper showRequestError];

    // начинаем отслеживание изменения статуса соединения
    Reachability *curr_reachability = [Reachability reachabilityWithHostName:@"google.com"];
    [curr_reachability startNotifier];
    __weak typeof(self)weak_self = self;
    [curr_reachability setReachableBlock:^(Reachability * reachability) {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [reachability stopNotifier];
            __strong typeof(self)strong_self = weak_self;
            [strong_self requestDataFromServer];
        });
    }];

    [startButton setEnabled:NO];
}
 
- (void)onRequestCompletion
{
   [startButton setEnabled:YES];
   [self updateBadgeValue];
}
 
- (void)requestDataFromServer
{
    [self showScreenLoading];
    __weak typeof(self)weak_self = self;
    
    // получение списка приложений
    [NetworkManager requestAppsList:^(NSArray *data) {
        DPLogFast(@"-->>> onCompletion handler -->>> получили список приложений");
        
        // получение списка веб-ресурсов
        [NetworkManager requestLinksList:^(NSArray *data) {
            DPLogFast(@"-->>> onCompletion handler -->>> получили список веб-ресурсов");
            
            __strong typeof(self)strong_self = weak_self;
            [strong_self hideLoading];
            [strong_self onRequestCompletion];
            
        } onError:^(NSError *error) {
            DPLogFast(@"-->>> onError handler");
            __strong typeof(self)strong_self = weak_self;
            [strong_self hideLoading];
            [strong_self onRequestFailure:error];
        }];
        
    } onError:^(NSError *error) {
        DPLogFast(@"-->>> onError handler");
        __strong typeof(self)strong_self = weak_self;
        [strong_self hideLoading];
        [strong_self onRequestFailure:error];
    }];
}
 */
