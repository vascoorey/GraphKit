//
//  BarGraphViewVC.m
//  GraphKit
//
//  Created by Michal Konturek on 17/04/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "ExampleBarGraphVC.h"

#import "UIViewController+BButton.h"

@interface ExampleBarGraphVC ()

@property (nonatomic, assign) BOOL green;

@end

@implementation ExampleBarGraphVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupButtons];
    
    self.view.backgroundColor = [UIColor gk_cloudsColor];
    
    self.data = @[@65, @10, @40, @90, @50, @75];
    self.labels = @[@"US", @"UK", @"DE", @"PL", @"CN", @"JP"];
    
//    self.graphView.barWidth = 22;
//    self.graphView.barHeight = 140;
//    self.graphView.marginBar = 25;
//    self.graphView.animationDuration = 2.0;
    
    self.graphView.dataSource = self;
    
    [self.graphView draw];
    
    self.green = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onButtonFill:(id)sender {
    [self.graphView draw];
}

- (IBAction)onButtonChange:(id)sender {
    self.green = !self.green;
    self.graphView.barColor = (self.green) ? [UIColor gk_turquoiseColor] : [UIColor gk_amethystColor];
}

- (IBAction)onButtonReset:(id)sender {
    [self.graphView reset];
}


#pragma mark - GKBarGraphDataSource

- (NSInteger)numberOfBarsInBarGraph:(GKBarGraph *)barGraph {
    return [self.data count];
}

- (NSNumber *)barGraph:(GKBarGraph *)barGraph valueForBarAtIndex:(NSInteger)index {
    return [self.data objectAtIndex:index];
}

- (UIColor *)barGraph:(GKBarGraph *)barGraph colorForBarAtIndex:(NSInteger)index {
    id colors = @[[UIColor gk_turquoiseColor],
                  [UIColor gk_peterRiverColor],
                  [UIColor gk_alizarinColor],
                  [UIColor gk_amethystColor],
                  [UIColor gk_emerlandColor],
                  [UIColor gk_sunflowerColor]
                  ];
    return [colors objectAtIndex:index];
}

//- (UIColor *)colorForBarBackgroundAtIndex:(NSInteger)index {
//    return [UIColor redColor];
//}

- (CFTimeInterval)barGraph:(GKBarGraph *)barGraph animationDurationForBarAtIndex:(NSInteger)index {
    CGFloat percentage = [[self barGraph:barGraph valueForBarAtIndex:index] doubleValue];
    percentage = (percentage / 100);
    return (self.graphView.animationDuration * percentage);
}

- (NSString *)barGraph:(GKBarGraph *)barGraph titleForBarAtIndex:(NSInteger)index {
    return [self.labels objectAtIndex:index];
}

@end
