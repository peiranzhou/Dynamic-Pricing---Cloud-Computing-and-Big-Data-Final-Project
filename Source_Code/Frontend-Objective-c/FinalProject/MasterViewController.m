//
//  MasterViewController.m
//  Master
//
//  Created by Peiran Zhou on 15/4/1.
//  Copyright (c) 2015年 zhouPeiran. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

{
    NSMutableArray *_objects;
}
-(void)createFlowerData;

@property (strong, nonatomic) NSArray *flowerData;
@property (strong, nonatomic) NSArray *flowerSections;

@property NSMutableArray *objects;

@end


@implementation MasterViewController


- (void)awakeFromNib {
    [super awakeFromNib];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
//
//    [self createFlowerData];
//}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [self createFlowerData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

// Master - Detail template transfer method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem: self.flowerData [indexPath.section][indexPath.row]];
    }
}

#pragma mark - Table View

// Create the flow of data, to visualize the link data in web view.
-(void)createFlowerData
{
    NSMutableArray *schoolInformation;
    self.flowerSections = @[@"dealmoon"];
    schoolInformation = [NSMutableArray new];
    
    
    [schoolInformation addObject:@{@"name":@"Latest Products", @"picture":@"latest.jpg", @"url":@"http://www.dealmoon.com/"}];
    [schoolInformation addObject:@{@"name":@"Clothing Jewelry Bags", @"picture":@"bags.jpg", @"url":@"http://www.dealmoon.com/Clothing-Jewelry-Bags"}];
    [schoolInformation addObject:@{@"name":@"Beauty", @"picture":@"beauty.jpg", @"url":@"http://www.dealmoon.com/Beauty"}];
    [schoolInformation addObject:@{@"name":@"Personal Care", @"picture":@"personal_care.jpg", @"url":@"http://www.dealmoon.com/Health-Personal-Care"}];
    [schoolInformation addObject:@{@"name":@"Nutrition", @"picture":@"nutrition.jpg", @"url":@"http://www.dealmoon.com/Nutrition-Supplements"}];
    [schoolInformation addObject:@{@"name":@"Computers", @"picture":@"computer.jpg", @"url":@"http://www.dealmoon.com/Computers"}];
    
    [schoolInformation addObject:@{@"name":@"Electronics", @"picture":@"tv.jpg", @"url":@"http://www.dealmoon.com/Electronics"}];
    [schoolInformation addObject:@{@"name":@"Baby", @"picture":@"babys.jpg", @"url":@"http://www.dealmoon.com/Baby"}];
    
    [schoolInformation addObject:@{@"name":@"Kids", @"picture":@"kids.jpg", @"url":@"http://www.dealmoon.com/Kids"}];

    
    
    self.flowerData = @[schoolInformation];
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.flowerSections count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.flowerData[section] count];
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return self.flowerSections[section];
    
}

// Creating a ui table view, to visualize the data

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    if(indexPath.row == 0)
    {
        cell.textLabel.text = self.flowerData[indexPath.section][indexPath.row][@"name"];
        cell.detailTextLabel.text = self.flowerData[indexPath.section][indexPath.row][@"url"];
        cell.imageView.image = [UIImage imageNamed:self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = self.flowerData[indexPath.section][indexPath.row][@"name"];
        cell.detailTextLabel.text = self.flowerData[indexPath.section][indexPath.row][@"url"];
        cell.imageView.image = [UIImage imageNamed:self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    }
    else if(indexPath.row == 2)
    {
        cell.textLabel.text = self.flowerData[indexPath.section][indexPath.row][@"name"];
        cell.detailTextLabel.text = self.flowerData[indexPath.section][indexPath.row][@"url"];
        cell.imageView.image = [UIImage imageNamed:self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    }
    
    else if(indexPath.row == 3)
    {
        cell.textLabel.text = self.flowerData[indexPath.section][indexPath.row][@"name"];
        cell.detailTextLabel.text = self.flowerData[indexPath.section][indexPath.row][@"url"];
        cell.imageView.image = [UIImage imageNamed:self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    }
    else if(indexPath.row == 4)
    {
        cell.textLabel.text = self.flowerData[indexPath.section][indexPath.row][@"name"];
        cell.detailTextLabel.text = self.flowerData[indexPath.section][indexPath.row][@"url"];
        cell.imageView.image = [UIImage imageNamed:self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    }
    else
    {
        cell.textLabel.text = self.flowerData[indexPath.section][indexPath.row][@"name"];
        cell.detailTextLabel.text = self.flowerData[indexPath.section][indexPath.row][@"url"];
        cell.imageView.image = [UIImage imageNamed:self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    }
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailViewController.detailItem = self.flowerData[indexPath.section][indexPath.row];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//
//    }
//}



@end
