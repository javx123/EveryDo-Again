//
//  AddItemViewController.m
//  EveryDoAgain
//
//  Created by Javier Xing on 2017-11-22.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "AddItemViewController.h"
#import "Todo+CoreDataProperties.h"
#import "AppDelegate.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpDefault];
    [self configureTheme];
    
}
- (IBAction)save:(id)sender {
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    Todo *newTodo = [[Todo alloc] initWithContext:appDelegate.persistentContainer.viewContext];
    newTodo.title= self.titleTextField.text;
    newTodo.todoDescription = self.descriptionTextField.text;
    newTodo.priority = [self.priorityTextField.text intValue];
    
    [appDelegate saveContext];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


-(void)setUpDefault{
    NSUserDefaults *todoDefault = [NSUserDefaults standardUserDefaults];
    self.titleTextField.text = [todoDefault objectForKey:@"title"];
    self.descriptionTextField.text = [todoDefault objectForKey:@"todoDescription"];
    self.priorityTextField.text = [todoDefault objectForKey:@"priority"];
}

- (IBAction)setDefaults:(id)sender {
    NSUserDefaults *todoDefault = [NSUserDefaults standardUserDefaults];
    [todoDefault setObject:self.titleTextField.text forKey:@"title"];
    [todoDefault setObject:self.descriptionTextField.text forKey:@"todoDescription"];
    [todoDefault setObject:self.priorityTextField.text forKey:@"priority"];
}

-(void)configureTheme{
    NSArray* general = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Themes" ofType:@"plist"]];
    NSArray *themes = [general objectAtIndex:0];
    NSDictionary *theme = [themes objectAtIndex:self.themeInt];
    NSString*backgroundColor = theme[@"backgroundColor"];
    SEL background = NSSelectorFromString(backgroundColor);
    NSString*textColor = theme[@"textColor"];
    SEL text = NSSelectorFromString(textColor);
    
    self.view.backgroundColor = [UIColor performSelector:background];
    self.titleLabel.textColor = [UIColor performSelector:text];
    
}



@end
