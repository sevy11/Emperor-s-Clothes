//
//  RootViewController.m
//  EmperorsClothes
//
//  Created by Michael Sevy on 10/13/15.
//  Copyright © 2015 Michael Sevy. All rights reserved.
//

#import "RootViewController.h"
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>

@interface RootViewController ()<CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addToWardrobe;
@property (weak, nonatomic) IBOutlet UIButton *randomizeWardrobe;

@property (weak, nonatomic) IBOutlet UIButton *viewWardrobe;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *highTemp;
@property (weak, nonatomic) IBOutlet UILabel *lowTemp;
@property (weak, nonatomic) IBOutlet UILabel *currentTemp;
@property (weak, nonatomic) IBOutlet UILabel *tempDescr;
@property NSArray *shuffledArray;

@property NSMutableArray *numbers;
@property NSMutableArray *wardrobes;
@property NSString *currentTempString;
@property NSDictionary *outfitDateDict;
@property NSArray *dateArray;
@property float latitude;
@property float longitude;
@property NSString *latitudeStr;
@property NSString *longitudeStr;

@property NSString *firstly;
@property NSString *second;
@property NSString *third;
@property NSString *forth;
@property NSString *fifth;
@property NSString *sixth;
@property NSString *seventh;
@property NSString *eigth;
@property NSString *ninth;
@property NSString *tenth;
@property NSString *ele;
@property NSString *twel;
@property NSString *thirteen;
@property NSString *fourteen;

@end

@implementation RootViewController


-(void)viewDidLoad{
    [super viewDidLoad];

    [self.navigationItem setTitle:@"What to wear?"];

    self.tableView.delegate = self;
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;

    //self.imageView.image = [UIImage imageNamed:@"clearDayChicagoSkyline"];

    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }

    [self.locationManager startUpdatingLocation];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.locationManager.allowsBackgroundLocationUpdates = YES;

    NSLog(@"latitude %f & longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.latitude);


    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"User %@, is logged in", currentUser);

    self.latitude = self.locationManager.location.coordinate.latitude;
    self.longitude = self.locationManager.location.coordinate.longitude;
    self.latitudeStr = [NSString stringWithFormat:@"%f.00", self.latitude];
    self.longitudeStr = [NSString stringWithFormat:@"%f.00", self.longitude];

    NSLog(@"lat and long: %f.00, %f.00", self.latitude, self.longitude);


        self.currentTemp.text = self.currentTempString;
        NSLog(@"current temp %@", self.currentTempString);


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

            }    if (i == 6) {

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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];

            }  if (i == 9) {

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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
            PFObject *obbie9 = [objects objectAtIndex:8];
            NSString *color9Local = [obbie9 objectForKey:@"color"];
            NSString *top9Local = [obbie9 objectForKey:@"topItem"];
            NSString *descr9Local = [obbie9 objectForKey:@"itemDetail"];
            self.ninth = [NSString stringWithFormat:@"%@ %@ %@", color9Local, top9Local, descr9Local];

            }   if (i == 10){

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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
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

            }  if (i == 11) {

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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
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


            }   if (i == 12){

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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
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


            }   if (i == 13){

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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
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
            self.eigth = [NSString stringWithFormat:@"%@ %@ %@", color8Local, top8Local, descr8Local];
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

    self.wardrobes = [NSMutableArray arrayWithObjects:self.firstly, self.second, self.third, self.forth, self.fifth, self.sixth, self.seventh, self.eigth, self.ninth, self.tenth, self.ele, self.twel, self.thirteen, self.fourteen, nil];

    NSLog(@"clothing: %@", self.wardrobes);
            }
        [self.tableView reloadData];
        }];
    }
        else    {
            [self performSegueWithIdentifier:@"Login" sender:self];
        }
    }


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self performCitySearch:@"41" andLon:@"-93"];

}



#pragma mark -- helper methods
- (IBAction)onTodaysTop:(UIButton *)sender {

    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self.wardrobes];

    for(NSInteger i = [self.wardrobes count]; i > 1; i--) {
        NSInteger j = arc4random_uniform(i);
        [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
    //clothing array shuffled
    self.shuffledArray = [NSArray arrayWithArray:temp];
    NSLog(@"new order%@", self.shuffledArray);


    //date array
    NSDateComponents *components = [NSDateComponents new];
    components.day = 1;
    int daysToAdd = 1;

    NSDate *day2 = [[NSDate date] dateByAddingTimeInterval:60*60*24*components.day];
    NSDate *day3 = [day2 dateByAddingTimeInterval:60*60*24*components.day];
    NSDate *day4 = [day3 dateByAddingTimeInterval:60*60*24*components.day];
    NSDate *day5 = [day4 dateByAddingTimeInterval:60*60*24*components.day];
    NSDate *day6 = [day5 dateByAddingTimeInterval:60*60*24*components.day];
    NSDate *day7 = [day6 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day8 = [day7 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day9 = [day8 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day10 = [day9 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day11 = [day10 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day12 = [day11 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day13 = [day12 dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSDate *day14 = [day13 dateByAddingTimeInterval:60*60*24*daysToAdd];

    //dateFormatter
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"EEE MMM dd, YY"];
    //to string and now date
    NSString *daterString = [dateformat stringFromDate:[NSDate date]];
    NSLog(@"current date string: %@", daterString);

    NSString *date2S = [dateformat stringFromDate:day2];
    NSString *date3S = [dateformat stringFromDate:day3];
    NSString *date4S = [dateformat stringFromDate:day4];
    NSString *date5S = [dateformat stringFromDate:day5];
    NSString *date6S = [dateformat stringFromDate:day6];
    NSString *date7S = [dateformat stringFromDate:day7];
    NSString *date8S = [dateformat stringFromDate:day8];
    NSString *date9S = [dateformat stringFromDate:day9];
    NSString *date10S = [dateformat stringFromDate:day10];
    NSString *date11S = [dateformat stringFromDate:day11];
    NSString *date12S = [dateformat stringFromDate:day12];
    NSString *date13S = [dateformat stringFromDate:day13];
    NSString *date14S = [dateformat stringFromDate:day14];

    self.dateArray = [NSArray arrayWithObjects:daterString, date2S, date3S, date4S, date5S, date6S, date7S, date8S, date9S, date10S, date11S, date12S, date13S, date14S, nil];

    self.outfitDateDict = [NSDictionary dictionaryWithObjectsAndKeys:self.shuffledArray, self.dateArray, nil];
    NSLog(@"clothing and date dict: %@", self.outfitDateDict);

    [self.tableView reloadData];


}




- (void)performCitySearch:(NSString *)latitude andLon:(NSString *)longitude  {

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?lat=%@&lon=%@&units=imperial&APPID=32b86970c65a8dbb50b9de39932f1068", latitude, longitude]];


    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if (!connectionError) {
            NSDictionary *weatherDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];

            NSArray *list = weatherDict[@"list"];

           // NSLog(@"list: %@", list);
            NSDictionary *itemZero = [list firstObject];
            NSDictionary *main = itemZero[@"main"];
            int temperature = [[main objectForKey:@"temp"] intValue];
            int highTemp = [[main objectForKey:@"temp_max"] intValue];
            int lowTemp = [[main objectForKey:@"temp_min"] intValue];
            NSString *currentTemp = [NSString stringWithFormat:@"%i.0°", temperature];
            NSString *higherTemp = [NSString stringWithFormat:@"high %i.0°", highTemp];
            NSString *lowerTemp = [NSString stringWithFormat:@"low %i.0°", lowTemp];

            self.highTemp.text = higherTemp;
            self.lowTemp.text = lowerTemp;
            self.currentTemp.text = currentTemp;

            //setting variables for day/night & type of weather for background image
            NSDateComponents *component = [[NSCalendar currentCalendar] components:(NSCalendarUnitMonth | NSCalendarUnitHour) fromDate:[NSDate date]];
            NSInteger hours = [component hour];
            NSInteger month = [component month];
            NSInteger eveningHour = 0;
            NSArray *weather = itemZero[@"weather"];
            NSDictionary *firstItem = [weather firstObject];
            NSString *skyType = firstItem[@"main"];
            NSString *description = firstItem[@"description"];
            self.tempDescr.text = description;
            NSLog(@"skytype: %@", skyType);
            NSLog(@"temp: %@", currentTemp);

            switch (month) {
                case 12: case 1: case 2:
                    // winder shorter days: December, January, February.
                    eveningHour = 16;
                    break;
                case 3: case 4: case 5:
                    // Spring longer day March, April, May.
                    eveningHour = 17;
                    break;
                case 6: case 7: case 8:
                    // summer longest days June, July, August.
                    eveningHour = 20;
                    break;
                case 9: case 10: case 11:
                    // fall shorter days September, October, November.
                    eveningHour = 17;
                    break;
                default: break;
            }
            self.randomizeWardrobe.alpha = .9;
            [self.randomizeWardrobe sizeToFit];
            self.viewWardrobe.alpha = .9;
            self.addToWardrobe.alpha = .9;
            self.addToWardrobe.layer.cornerRadius = 10;
            self.viewWardrobe.layer.cornerRadius = 10;
            self.randomizeWardrobe.layer.cornerRadius = 10;

            if ((hours >= 0) && (hours < 12) && [skyType isEqualToString:@"Clear"]) {
                // Morning...
                NSLog(@"Morning, clear skies");
                NSTimeInterval seconds = 1.0;
                [UIImageView animateWithDuration:seconds animations:^{
                    self.imageView.image = [UIImage imageNamed:@"clearDayChicagoSkyline"];
                }];
            }
            else if ((hours >= 0) && (hours < 12) && [skyType isEqualToString:@"Clouds"]){
                NSLog(@"Morning, cloudy");
                NSTimeInterval seconds = 1.0;
                [UIImageView animateWithDuration:seconds animations:^{
                    self.imageView.image = [UIImage imageNamed:@"cloudyDayCity"];
                }];
            }
            else if ((hours >= 12) && (hours < eveningHour) && [skyType isEqualToString:@"Clear"]) {
                // Afternoon...
                NSLog(@"Afternoon, clear");
                NSTimeInterval seconds = 1.5;
                [UIImageView animateWithDuration:seconds animations:^{
                    self.imageView.image = [UIImage imageNamed:@"clearSky"];
                }];
            } else if ((hours >= 12) && (hours < eveningHour) && [skyType isEqualToString:@"Clouds"]){
                NSLog(@"Afternoon Clouds");
                self.imageView.image = [UIImage imageNamed:@"cloudyDayCity"];
            } else if ((hours >= 12) && (hours < eveningHour) && [skyType isEqualToString:@"Clear"]){
                self.imageView.image = [UIImage imageNamed:@"Dark-Chicago"];
                 self.currentTemp.textColor = [UIColor whiteColor];

            }
            else if ((hours >= eveningHour) && (hours <= 24) && [skyType isEqualToString:@"Clear"]) {
                // Evening/Night...
                NSLog(@"Evening");
                self.imageView.image = [UIImage imageNamed:@"clearNightNothernCity"];
//                self.currentTemp.backgroundColor = [UIColor blackColor];
                self.currentTemp.textColor = [UIColor whiteColor];

            } else if ((hours >= eveningHour) && (hours <= 24) && [skyType isEqualToString:@"Clouds"]){
                self.imageView.image = [UIImage imageNamed:@"cloudyNightskyline"];
                self.currentTemp.textColor = [UIColor whiteColor];
            }
        }
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wardrobes.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Celler"];

    NSString *dates = [self.dateArray objectAtIndex:indexPath.row];
    NSString *clothingPiece = [self.shuffledArray objectAtIndex:indexPath.row];
    cell.textLabel.text  = dates;
    cell.detailTextLabel.text  = clothingPiece;

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    cell.detailTextLabel.backgroundColor = [UIColor whiteColor];

}
@end
