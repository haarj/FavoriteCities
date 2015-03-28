//
//  DetailViewController.m
//  FavoriteCities
//
//  Created by Justin Haar on 3/20/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "DetailViewController.h"
#import "WikipediaViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = self.city.cityImage;
    self.stateLabel.text = self.city.cityState;
    self.nameTextField.hidden = YES;
    self.stateTextField.hidden = YES;
}

- (IBAction)onWikiTapped:(UITapGestureRecognizer *)sender {
    
}


- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Edit"] ) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.nameTextField.placeholder = @"Enter name";
        self.stateTextField.placeholder = @"Enter State";
        self.nameTextField.hidden = NO;
        self.stateTextField.hidden = NO;
    } else if ([sender.titleLabel.text isEqualToString:@"Done"]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.nameTextField.hidden = YES;
        self.stateTextField.hidden = YES;
        if (![self.nameTextField.text isEqualToString:@""]) {
            self.city.cityName = self.nameTextField.text;
        }
        if (![self.stateTextField.text isEqualToString:@""]) {
            self.city.cityState = self.stateTextField.text;
        }
    }
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""]) {
        if (textField == self.nameTextField) {
            self.city.cityName = self.nameTextField.text;
        } else if (![textField.text isEqualToString:@""]) {
            self.city.cityState = textField.text;
        }
    }

    [textField resignFirstResponder];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WikipediaViewController *wikiViewController = (WikipediaViewController *) segue.destinationViewController;
    wikiViewController.city = self.city;

}


- (IBAction)titleChangeOnTap:(UIButton *)sender
{
    self.city.cityName = self.title;
    [self.delegate CityDelegateMethod:sender];
}


@end
