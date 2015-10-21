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


            for (int i = 0; i < 14; i++) {


                if (i == 1) {

                    NSLog(@"Only one Outfit");
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];


                    //} else if ([objects count] == 2){
                } if (i == 2){

                    PFObject *obbie1 = [objects objectAtIndex:0];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];

                    //        } if ([objects count] == 3){
                } if (i == 3){

                    PFObject *obbie1 = [objects objectAtIndex:0];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];

                    //            } if ([objects count] == 4) {
                    // if (i == 4){
                } if (i == 4) {


                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];


                } if (i == 5) {


                    //  if ([objects count] == 5) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                }
                //        if ([objects count] == 6) {
                if (i == 6) {


                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];

                } if (i == 7) {


                    // if ([objects count] == 7) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];

                }   if (i == 8) {


                    //   if ([objects count] == 8) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                    PFObject *obbie8 = [objects objectAtIndex:7];
                    NSString *color8Local = [obbie8 objectForKey:@"color"];
                    NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                    NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                    self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];

                }  if (i == 9) {


                    //if ([objects count] == 9) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                    PFObject *obbie8 = [objects objectAtIndex:7];
                    NSString *color8Local = [obbie8 objectForKey:@"color"];
                    NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                    NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                    self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
                    PFObject *obbie9 = [objects objectAtIndex:8];
                    NSString *color9Local = [obbie9 objectForKey:@"color"];
                    NSString *top9Local = [obbie9 objectForKey:@"topItem"];
                    NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
                    self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];


                }   if (i == 10){
                    //  if ([objects count] == 9) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                    PFObject *obbie8 = [objects objectAtIndex:7];
                    NSString *color8Local = [obbie8 objectForKey:@"color"];
                    NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                    NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                    self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
                    PFObject *obbie9 = [objects objectAtIndex:8];
                    NSString *color9Local = [obbie9 objectForKey:@"color"];
                    NSString *top9Local = [obbie9 objectForKey:@"topItem"];
                    NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
                    self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];
                    PFObject *obbie10 = [objects objectAtIndex:9];
                    NSString *color10Local = [obbie10 objectForKey:@"color"];
                    NSString *top10Local = [obbie10 objectForKey:@"topItem"];
                    NSString *descr10Local = [obbie10 objectForKey:@"itemDetail"];
                    self.tenth = [NSString stringWithFormat:@"%@ %@ %@", color10Local, top10Local, descr10Local];
                }
                if (i == 11) {


                    // if ([objects count] == 10) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                    PFObject *obbie8 = [objects objectAtIndex:7];
                    NSString *color8Local = [obbie8 objectForKey:@"color"];
                    NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                    NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                    self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
                    PFObject *obbie9 = [objects objectAtIndex:8];
                    NSString *color9Local = [obbie9 objectForKey:@"color"];
                    NSString *top9Local = [obbie9 objectForKey:@"topItem"];
                    NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
                    self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];
                    PFObject *obbie10 = [objects objectAtIndex:9];
                    NSString *color10Local = [obbie10 objectForKey:@"color"];
                    NSString *top10Local = [obbie10 objectForKey:@"topItem"];
                    NSString *descr10Local = [obbie10 objectForKey:@"itemDetail"];
                    self.tenth = [NSString stringWithFormat:@"%@ %@ %@", color10Local, top10Local, descr10Local];
                    PFObject *obbie11 = [objects objectAtIndex:10];
                    NSString *color11Local = [obbie11 objectForKey:@"color"];
                    NSString *top11Local = [obbie11 objectForKey:@"topItem"];
                    NSString *descr11Local = [obbie11 objectForKey:@"itemDetail"];
                    self.ele = [NSString stringWithFormat:@"%@ %@ %@", color11Local, top11Local, descr11Local];
                }

                if (i == 12){
                    //  if ([objects count] == 11) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                    PFObject *obbie8 = [objects objectAtIndex:7];
                    NSString *color8Local = [obbie8 objectForKey:@"color"];
                    NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                    NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                    self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
                    PFObject *obbie9 = [objects objectAtIndex:8];
                    NSString *color9Local = [obbie9 objectForKey:@"color"];
                    NSString *top9Local = [obbie9 objectForKey:@"topItem"];
                    NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
                    self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];
                    PFObject *obbie10 = [objects objectAtIndex:9];
                    NSString *color10Local = [obbie10 objectForKey:@"color"];
                    NSString *top10Local = [obbie10 objectForKey:@"topItem"];
                    NSString *descr10Local = [obbie10 objectForKey:@"itemDetail"];
                    self.tenth = [NSString stringWithFormat:@"%@ %@ %@", color10Local, top10Local, descr10Local];
                    PFObject *obbie11 = [objects objectAtIndex:10];
                    NSString *color11Local = [obbie11 objectForKey:@"color"];
                    NSString *top11Local = [obbie11 objectForKey:@"topItem"];
                    NSString *descr11Local = [obbie11 objectForKey:@"itemDetail"];
                    self.ele = [NSString stringWithFormat:@"%@ %@ %@", color11Local, top11Local, descr11Local];
                    PFObject *obbie12 = [objects objectAtIndex:11];
                    NSString *color12Local = [obbie12 objectForKey:@"color"];
                    NSString *top12Local = [obbie12 objectForKey:@"topItem"];
                    NSString *descr12Local = [obbie12 objectForKey:@"itemDetail"];
                    self.twel = [NSString stringWithFormat:@"%@ %@ %@", color12Local, top12Local, descr12Local];
                }

                if (i == 13){
                    // if ([objects count] == 12) {
                    PFObject *obbie1 = [objects objectAtIndex:0];
                    // NSString *number = [obbie1 objectForKey:@"number"];
                    NSString *color1Local = [obbie1 objectForKey:@"color"];
                    NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                    NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                    self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                    PFObject *obbie2 = [objects objectAtIndex:1];
                    NSString *color2Local = [obbie2 objectForKey:@"color"];
                    NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                    NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                    self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                    PFObject *obbie3 = [objects objectAtIndex:2];
                    NSString *color3Local = [obbie3 objectForKey:@"color"];
                    NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                    NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                    self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                    PFObject *obbie4 = [objects objectAtIndex:3];
                    NSString *color4Local = [obbie4 objectForKey:@"color"];
                    NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                    NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                    self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                    PFObject *obbie5 = [objects objectAtIndex:4];
                    NSString *color5Local = [obbie5 objectForKey:@"color"];
                    NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                    NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                    self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                    PFObject *obbie6 = [objects objectAtIndex:5];
                    NSString *color6Local = [obbie6 objectForKey:@"color"];
                    NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                    NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                    self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                    PFObject *obbie7 = [objects objectAtIndex:6];
                    NSString *color7Local = [obbie7 objectForKey:@"color"];
                    NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                    NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                    self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                    PFObject *obbie8 = [objects objectAtIndex:7];
                    NSString *color8Local = [obbie8 objectForKey:@"color"];
                    NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                    NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                    self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
                    PFObject *obbie9 = [objects objectAtIndex:8];
                    NSString *color9Local = [obbie9 objectForKey:@"color"];
                    NSString *top9Local = [obbie9 objectForKey:@"topItem"];
                    NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
                    self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];
                    PFObject *obbie10 = [objects objectAtIndex:9];
                    NSString *color10Local = [obbie10 objectForKey:@"color"];
                    NSString *top10Local = [obbie10 objectForKey:@"topItem"];
                    NSString *descr10Local = [obbie10 objectForKey:@"itemDetail"];
                    self.tenth = [NSString stringWithFormat:@"%@ %@ %@", color10Local, top10Local, descr10Local];
                    PFObject *obbie11 = [objects objectAtIndex:10];
                    NSString *color11Local = [obbie11 objectForKey:@"color"];
                    NSString *top11Local = [obbie11 objectForKey:@"topItem"];
                    NSString *descr11Local = [obbie11 objectForKey:@"itemDetail"];
                    self.ele = [NSString stringWithFormat:@"%@ %@ %@", color11Local, top11Local, descr11Local];
                    PFObject *obbie12 = [objects objectAtIndex:11];
                    NSString *color12Local = [obbie12 objectForKey:@"color"];
                    NSString *top12Local = [obbie12 objectForKey:@"topItem"];
                    NSString *descr12Local = [obbie12 objectForKey:@"itemDetail"];
                    self.twel = [NSString stringWithFormat:@"%@ %@ %@", color12Local, top12Local, descr12Local];
                    PFObject *obbie13 = [objects objectAtIndex:12];
                    NSString *color13Local = [obbie13 objectForKey:@"color"];
                    NSString *top13Local = [obbie13 objectForKey:@"topItem"];
                    NSString *descr13Local = [obbie13 objectForKey:@"itemDetail"];
                    self.thirteen = [NSString stringWithFormat:@"%@ %@ %@", color13Local, top13Local, descr13Local];


                }   if  (i == 14)   {

                }
                // if ([objects count] == 13) {


                PFObject *obbie1 = [objects objectAtIndex:0];
                // NSString *number = [obbie1 objectForKey:@"number"];
                NSString *color1Local = [obbie1 objectForKey:@"color"];
                NSString *top1Local = [obbie1 objectForKey:@"topItem"];
                NSString *descr1Local = [obbie1 objectForKey:@"itemDetail"];
                self.firstly = [NSString stringWithFormat:@"%@ %@ %@", color1Local, top1Local, descr1Local];
                PFObject *obbie2 = [objects objectAtIndex:1];
                NSString *color2Local = [obbie2 objectForKey:@"color"];
                NSString *top2Local = [obbie2 objectForKey:@"topItem"];
                NSString *descr2Local = [obbie2 objectForKey:@"itemDetail"];
                self.second = [NSString stringWithFormat:@"%@ %@ %@", color2Local, top2Local, descr2Local];
                PFObject *obbie3 = [objects objectAtIndex:2];
                NSString *color3Local = [obbie3 objectForKey:@"color"];
                NSString *top3Local = [obbie3 objectForKey:@"topItem"];
                NSString *descr3Local = [obbie3 objectForKey:@"itemDetail"];
                self.third = [NSString stringWithFormat:@"%@ %@ %@", color3Local, top3Local, descr3Local];
                PFObject *obbie4 = [objects objectAtIndex:3];
                NSString *color4Local = [obbie4 objectForKey:@"color"];
                NSString *top4Local = [obbie4 objectForKey:@"topItem"];
                NSString *descr4Local = [obbie4 objectForKey:@"itemDetail"];
                self.forth = [NSString stringWithFormat:@"%@ %@ %@", color4Local, top4Local, descr4Local];
                PFObject *obbie5 = [objects objectAtIndex:4];
                NSString *color5Local = [obbie5 objectForKey:@"color"];
                NSString *top5Local = [obbie5 objectForKey:@"topItem"];
                NSString *descr5Local = [obbie5 objectForKey:@"itemDetail"];
                self.fifth = [NSString stringWithFormat:@"%@ %@ %@", color5Local, top5Local, descr5Local];
                PFObject *obbie6 = [objects objectAtIndex:5];
                NSString *color6Local = [obbie6 objectForKey:@"color"];
                NSString *top6Local = [obbie6 objectForKey:@"topItem"];
                NSString *descr6Local = [obbie6 objectForKey:@"itemDetail"];
                self.sixth = [NSString stringWithFormat:@"%@ %@ %@", color6Local, top6Local, descr6Local];
                PFObject *obbie7 = [objects objectAtIndex:6];
                NSString *color7Local = [obbie7 objectForKey:@"color"];
                NSString *top7Local = [obbie7 objectForKey:@"topItem"];
                NSString *descr7Local = [obbie7 objectForKey:@"itemDetail"];
                self.seventh = [NSString stringWithFormat:@"%@ %@ %@", color7Local, top7Local, descr7Local];
                PFObject *obbie8 = [objects objectAtIndex:7];
                NSString *color8Local = [obbie8 objectForKey:@"color"];
                NSString *top8Local = [obbie8 objectForKey:@"topItem"];
                NSString *descr8Local = [obbie8 objectForKey:@"itemDetail"];
                self.eighth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
                PFObject *obbie9 = [objects objectAtIndex:8];
                NSString *color9Local = [obbie9 objectForKey:@"color"];
                NSString *top9Local = [obbie9 objectForKey:@"topItem"];
                NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
                self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];
                PFObject *obbie10 = [objects objectAtIndex:9];
                NSString *color10Local = [obbie10 objectForKey:@"color"];
                NSString *top10Local = [obbie10 objectForKey:@"topItem"];
                NSString *descr10Local = [obbie10 objectForKey:@"itemDetail"];
                self.tenth = [NSString stringWithFormat:@"%@ %@ %@", color10Local, top10Local, descr10Local];
                PFObject *obbie11 = [objects objectAtIndex:10];
                NSString *color11Local = [obbie11 objectForKey:@"color"];
                NSString *top11Local = [obbie11 objectForKey:@"topItem"];
                NSString *descr11Local = [obbie11 objectForKey:@"itemDetail"];
                self.ele = [NSString stringWithFormat:@"%@ %@ %@", color11Local, top11Local, descr11Local];
                PFObject *obbie12 = [objects objectAtIndex:11];
                NSString *color12Local = [obbie12 objectForKey:@"color"];
                NSString *top12Local = [obbie12 objectForKey:@"topItem"];
                NSString *descr12Local = [obbie12 objectForKey:@"itemDetail"];
                self.twel = [NSString stringWithFormat:@"%@ %@ %@", color12Local, top12Local, descr12Local];
                PFObject *obbie13 = [objects objectAtIndex:12];
                NSString *color13Local = [obbie13 objectForKey:@"color"];
                NSString *top13Local = [obbie13 objectForKey:@"topItem"];
                NSString *descr13Local = [obbie13 objectForKey:@"itemDetail"];
                self.thirteen = [NSString stringWithFormat:@"%@ %@ %@", color13Local, top13Local, descr13Local];
                PFObject *obbie14 = [objects objectAtIndex:13];
                NSString *color14Local = [obbie14 objectForKey:@"color"];
                NSString *top14Local = [obbie14 objectForKey:@"topItem"];
                NSString *descr14Local = [obbie14 objectForKey:@"itemDetail"];
                self.fourteen = [NSString stringWithFormat:@"%@ %@ %@", color14Local, top14Local, descr14Local];
                
            }
            
            self.wardrobes = [NSMutableArray arrayWithObjects:self.firstly, self.second, self.third, self.forth, self.fifth, self.sixth, self.seventh, self.eighth, self.ninth, self.tenth, self.ele, self.twel, self.thirteen, self.fourteen, nil];
            
            NSLog(@"clothing: %@", self.wardrobes);

        }

    }];
    [self.tableView reloadData];


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
