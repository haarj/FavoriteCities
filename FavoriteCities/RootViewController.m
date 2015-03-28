//
//  ViewController.m
//  FavoriteCities
//
//  Created by Justin Haar on 3/20/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "RootViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, CityTitleMethod>

@property (nonatomic) NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;


@end

@implementation RootViewController
{
    City *city;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    City *city1 = [[City alloc]initWithFullName:@"New York" andState:@"New York"];
    city1.cityImage = [UIImage imageNamed:@"NewYork"];
    City *city2 = [[City alloc]initWithFullName:@"Miami" andState:@"Florida"];
    city2.cityImage = [UIImage imageNamed:@"Miami"];
    City *city3 = [[City alloc]initWithFullName:@"San Francisco" andState:@"California"];
    city3.cityImage = [UIImage imageNamed:@"SanFrancisco"];
    City *city4 = [[City alloc]initWithFullName:@"Las Vegas" andState:@"Nevada"];
    city4.cityImage = [UIImage imageNamed:@"LasVegas"];

    self.cities = [NSMutableArray arrayWithObjects:city1, city2, city3, city4, nil];
    ;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.cityTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    city = [self.cities objectAtIndex:indexPath.row];
    //this is where the image thumbnail would go
    cell.textLabel.text = city.cityName;
    cell.detailTextLabel.text = city.cityState;
    cell.imageView.image = city.cityImage;
    return cell;

}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellEditingStyle style = UITableViewCellEditingStyleNone;

    if ([tableView isEqual:self.cityTableView]) {
        style = UITableViewCellEditingStyleDelete;
    }
    return style;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((editingStyle = UITableViewCellEditingStyleDelete))
    {
        if (indexPath.row < [self.cities count])
        {
            [self.cities removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.cityTableView indexPathForCell:sender];
    city = [self.cities objectAtIndex:indexPath.row];

    DetailViewController *viewController = (DetailViewController *) segue.destinationViewController;
    viewController.title = city.cityName;
    viewController.city = city;
    viewController.delegate = self;
    
}

#pragma mark CityTitleDelegate

-(void) CityDelegateMethod:(UIButton *)sender
{
    self.navigationItem.title = city.cityName;
}


@end
