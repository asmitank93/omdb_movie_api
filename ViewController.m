//
//  ViewController.m
//  omdb_movie_api
//
//  Created by tops on 3/31/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tbl_vw,txt_nm,txt_year,img_vw;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dict allKeys]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text=[[dict allValues]objectAtIndex:indexPath.row];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_action:(id)sender
{
    
    NSString *st_format=[NSString stringWithFormat:@"http://www.omdbapi.com/?t=%@&y=%@&plot=short&r=json",[txt_nm.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],txt_year.text];
    NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
   
    NSLog(@"%@",dict);

    [tbl_vw reloadData];
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(192, 93, 150, 200)];
    NSURL *url_img=[NSURL URLWithString:[dict objectForKey:@"Poster"]];
    NSData *data_img=[NSData dataWithContentsOfURL:url_img];
   img_vw.image=[UIImage imageWithData:data_img];
        [self.view addSubview:img];
}
@end
