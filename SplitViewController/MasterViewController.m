//
//  MasterViewController.m
//  SplitViewController
//
//  Created by vignesh on 9/8/16.
//  Copyright © 2016 vignesh. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PatientDetails.h"

@interface MasterViewController ()
{
    PatientDetails *patientObj;

}
@property NSMutableArray *objects;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"person-man.png";
    patientObj.usrName = @"Peter";
    patientObj.gender = @"Male";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"Male";
    patientObj.primayContactNo= @"eamplame@exapmle.com";
    patientObj.secondaryContactNo= @"1234567";
    patientObj.language=@"9876554";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficeVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Address";
    
    
    _patientList = [[NSMutableArray alloc]init];
    [_patientList addObject:patientObj];
    
    patientObj = [[PatientDetails alloc]init];
    patientObj.usrImg = @"person-man.png";
    patientObj.usrName = @"Ana";
    patientObj.gender = @"Female";
    patientObj.age = @"25 Years Old(06/08/1984)";
    patientObj.mailId= @"Male";
    patientObj.primayContactNo= @"eamplame@exapmle.com";
    patientObj.secondaryContactNo= @"1234567";
    patientObj.language=@"9876554";
    patientObj.financialClass= @"Commerical";
    patientObj.financialPayer= @"Humana";
    patientObj.nextAppointmentDate = @"09/08/2016";
    patientObj.appDocName = @"Sam";
    patientObj.lastAppDate = @"10/08/2017";
    patientObj.lastVisit = @"OfficeVisit";
    patientObj.transportation = @"None";
    patientObj.refDoc =@"Dr.GoldBerg";
    patientObj.lastSeenDoc=@"Dr.Escobar";
    patientObj.LastVisitDocAdd = @"Mimai Beach";
    patientObj.diagonises = @"Paralysis";
    patientObj.diganosesDate =@"09/02/2013";
    patientObj.allergies = @"Latex";
    patientObj.perfPharmacy = @"Address";
    
    [_patientList addObject:patientObj];
    
    //_patientList = [[NSArray alloc] initWithObjects:@"Yahoo",@"Google",@"Apple",@"eBookFrenzy",nil];
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject]
     topViewController];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self performSegueWithIdentifier:@"showDetail" sender:self];

}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        patientObj = _patientList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setPatDetails:patientObj];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _patientList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    patientObj = _patientList[indexPath.row];
    cell.imageView.backgroundColor = [UIColor colorWithRed:(20.0f/255.0f) green:(173.0f/255.0f) blue:(199.0f/255.0f) alpha:1.0];
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 32.0f;
    
    cell.imageView.image=[UIImage imageNamed:patientObj.usrImg];
    cell.textLabel.text = patientObj.usrName;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    cell.textLabel.textColor= [UIColor colorWithRed:(10.0f/255.0f) green:(173.0f/255.0f) blue:(193.0f/255.0f) alpha:1.0];
    cell.detailTextLabel.text=patientObj.age;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *urlString = [_siteAddresses objectAtIndex:indexPath.row];
//    _detailViewController.webView.scalesPageToFit = YES;
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.detailViewController.webView loadRequest:request];
}


@end
