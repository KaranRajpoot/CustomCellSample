//
//  RootViewControllerViewController.m
//  CustomCellSample
//
//  Created by Roy on 9/25/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
@interface RootViewController ()
{
    NSArray *countyNameArray;
    NSArray *countyDesArray;
    NSArray *countyFlagArray;

}
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title=@"Country List";
    countyNameArray=[[NSArray alloc] initWithObjects:@"India",@"Rusia",@"Japan",@"Australia",@"France",@"USA", nil];
    countyDesArray=[[NSArray alloc] initWithObjects:@"Home to the ancient Indus Valley Civilisation and a region of historic trade routes and vast empires, the Indian subcontinent was identified with its commercial and cultural wealth for much of its long history",@"Rusia",@"Japan",@"Australia",@"France is the largest country in Western Europe and the third-largest in Europe as a whole",@"The United States is a developed country and has the world's largest national economy", nil];
    
    countyFlagArray=[[NSArray alloc] initWithObjects:@"india.jpeg",@"rusia.jpeg",@"japan.jpeg",@"australia.jpeg",@"france.jpeg",@"usa.jpeg", nil];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [[countyDesArray objectAtIndex:indexPath.row] sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14]constrainedToSize:CGSizeMake(211,FLT_MAX)lineBreakMode:NSLineBreakByWordWrapping];
  CGSize size1=  [[countyNameArray objectAtIndex:indexPath.row] sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]constrainedToSize:CGSizeMake(211,FLT_MAX)lineBreakMode:NSLineBreakByWordWrapping];
    float height=size.height+size1.height+10;
    if (height>80) {
        return height;
    }
    else
        height=80;
    return height;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [countyNameArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // set cell indetifier in storyboard rootviewcontroller "customCell";
    UITableViewCell *cell=[_rootTableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    NSArray *subView=[cell.contentView subviews];
    
    UIImageView *imgView=(UIImageView *)[subView objectAtIndex:0];
    imgView.image=[UIImage imageNamed:[countyFlagArray objectAtIndex:indexPath.row]];
    float rowheight=cell.frame.size.height;
    if (rowheight>80) {
      CGRect frame=  imgView.frame;
        frame.origin.y=(rowheight-frame.size.height)/2;
        imgView.frame=frame;
    }
    UILabel *headingLabel=(UILabel *)[subView objectAtIndex:1];
    headingLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:16];
    UILabel *detailLabel=(UILabel *)[subView objectAtIndex:2];
    headingLabel.text=[countyNameArray objectAtIndex:indexPath.row];
    detailLabel.text=[countyDesArray objectAtIndex:indexPath.row];
    detailLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    detailLabel.numberOfLines=0;
    [detailLabel sizeToFit];
    
    return cell;

    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailIndetifier"];
    controller.navigationItem.title=[countyNameArray objectAtIndex:indexPath.row];
    controller.detail=[countyDesArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
    
    
    //[self performSegueWithIdentifier:@"detailSegue" sender:self];
    
}


@end
