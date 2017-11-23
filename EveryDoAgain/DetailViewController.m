//
//  DetailViewController.m
//  EveryDoAgain
//
//  Created by Javier Xing on 2017-11-22.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo+CoreDataProperties.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.descriptionLabel.text = [[self.detailItem valueForKey:@"todoDescription"] description];
        self.titleLabel.text = [[self.detailItem valueForKey:@"title"] description];
        self.priorityLabel.text = [[self.detailItem valueForKey:@"priority"] description];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self configureTheme];
}

-(void)configureTheme{
    NSArray* general = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Themes" ofType:@"plist"]];
    NSArray *themes = [general objectAtIndex:0];
    NSDictionary *theme = [themes objectAtIndex:self.themeInt];
    NSString*backgroundColor = theme[@"backgroundColor"];
    SEL background = NSSelectorFromString(backgroundColor);
    NSString*textColor = theme[@"textColor"];
    SEL text = NSSelectorFromString(textColor);
    
    self.titleLabel.textColor = [UIColor performSelector:text];
    self.descriptionLabel.textColor = [UIColor performSelector:text];
    self.priorityLabel.textColor = [UIColor performSelector:text];
    self.view.backgroundColor = [UIColor performSelector:background];
    
    
}




@end
