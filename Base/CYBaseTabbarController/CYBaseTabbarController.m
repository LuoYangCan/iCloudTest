//
//  CYBaseTabbarController.m
//  Young Eagles
//
//  Created by 孤岛 on 2017/5/3.
//  Copyright © 2017年 NMID. All rights reserved.
//
#import "CYHelper.h"
#import "CYBaseTabbarController.h"
#import "CYHomeController.h"
#import "CYProjectDViewController.h"
@interface CYBaseTabbarController ()<UIGestureRecognizerDelegate>
@property (strong,nonatomic) NSArray * itemArray;


@end

@implementation CYBaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabbar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTabbar{
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:[self setViewControllerArray].count];
    for (NSDictionary *itemDic in [self setViewControllerArray]) {
        Class vcClass = NSClassFromString(itemDic[@"viewcontroller_class"]);
        UIViewController *vc = [[vcClass alloc]init];
        vc.title = itemDic[@"name"];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        navi.tabBarItem.title = itemDic[@"name"];
        [viewControllers addObject:navi];
        }
    self.viewControllers = viewControllers;
    self.selectedIndex = 0;
}
-(NSArray *)setViewControllerArray{
    NSArray * array = @[@{@"name":@"首页",
                          @"viewcontroller_class":NSStringFromClass([CYHomeController class])
                            },
                        @{@"name":@"项目",
                          @"viewcontroller_class":NSStringFromClass([CYProjectDViewController class])
                            }
                        ];
    return [array copy];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
