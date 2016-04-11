//
//  ViewController.h
//  omdb_movie_api
//
//  Created by tops on 3/31/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSDictionary *dict;
}
@property (weak, nonatomic) IBOutlet UITextField *txt_nm;
@property (weak, nonatomic) IBOutlet UITextField *txt_year;
- (IBAction)btn_action:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@property (weak, nonatomic) IBOutlet UIImageView *img_vw;

@end

