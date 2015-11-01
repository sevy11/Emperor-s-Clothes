//
//  WardrobeViewController.m
//  EmperorsClothes
//
//  Created by Michael Sevy on 10/12/15.
//  Copyright © 2015 Michael Sevy. All rights reserved.
//

#import "WardrobeViewController.h"
#import <Parse/Parse.h>


@interface WardrobeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSString *firstly;
@property NSString *second;
@property NSString *third;
@property NSString *forth;
@property NSString *fifth;
@property NSString *sixth;
@property NSString *seventh;
@property NSString *eighth;
@property NSString *ninth;
@property NSString *tenth;
@property NSString *ele;
@property NSString *twel;
@property NSString *thirteen;
@property NSString *fourteen;


@property NSMutableArray *wardrobes;

@end


@implementation WardrobeViewController


-(void)viewDidLoad{
    [super viewDidLoad];

    self.tableView.delegate = self;

    [self.navigationItem setTitle:@"Current wardrobe"];

    PFQuery *query = [PFQuery queryWithClassName:@"Wardrobe"];
    [query whereKey:@"senderId" equalTo:[[PFUser currentUser] objectId]];
    [query whereKeyExists:@"number"];
    [query orderByDescending:@"createdAt"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(error){
            NSLog(@"Error: %@ %@", error, [error userInfo]);

        } else {

            NSLog(@"%lu", (unsigned long)[objects count]);

            PFObject *object0 = [objects objectAtIndex:0];
            NSString *color0 = [object0 objectForKey:@"color"];
            NSString *top0 = [object0 objectForKey:@"topItem"];
            self.firstly = [NSString stringWithFormat:@"%@ %@", color0, top0];

            PFObject *object1 = [objects objectAtIndex:1];
            NSString *color1 = [object1 objectForKey:@"color"];
            NSString *top1 = [object1 objectForKey:@"topItem"];
            self.second = [NSString stringWithFormat:@"%@ %@", color1, top1];


            PFObject *object2 = [objects objectAtIndex:2];
            NSString *color2 = [object2 objectForKey:@"color"];
            NSString *top2 = [object2 objectForKey:@"topItem"];
            self.third = [NSString stringWithFormat:@"%@ %@", color2, top2];

            }
            
            self.wardrobes = [NSMutableArray arrayWithObjects:self.firstly, self.second, self.third, self.forth, self.fifth, self.sixth, self.seventh, self.eighth, self.ninth, self.tenth, self.ele, self.twel, self.thirteen, self.fourteen, nil];
            
            NSLog(@"clothing: %@", self.wardrobes);
        [self.tableView reloadData];

    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wardrobes.count;

}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Celly"];
    cell.textLabel.text = [self.wardrobes objectAtIndex:indexPath.row];

    return cell;
}
@end
