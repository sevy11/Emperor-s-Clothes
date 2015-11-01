//
//  ViewController.m
//  EmperorsClothes
//
//  Created by Michael Sevy on 5/23/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "ViewController.h"
#import "Wardrobe.h"
#import "Color.h"
#import <Parse/Parse.h>
#import "LogInViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
//Buttons
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
//ImageViews
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImage;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (weak, nonatomic) IBOutlet UIImageView *upperleftImage;
@property (weak, nonatomic) IBOutlet UIImageView *lowerLeftImage;
@property (weak, nonatomic) IBOutlet UIImageView *upperRightImage;
@property (weak, nonatomic) IBOutlet UIImageView *lowerRightImage;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *upperLeftTapGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *lowerLeftTapGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *upperRightGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *lowerRightTapGesture;

@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmented;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
//global props
@property NSMutableArray *blackColor;
@property NSMutableArray *blackColorCol;
@property NSMutableArray *blueColor;
@property NSMutableArray *blueColorCol;
@property NSMutableArray *whiteColor;
@property NSMutableArray *whiteColorCol;
@property NSMutableArray *redColor;
@property NSMutableArray *redColorCol;
@property NSMutableArray *greenColor;
@property NSMutableArray *greenColorCol;
@property NSMutableArray *yellowOrangeColor;
@property NSMutableArray *yellowOrangeColorCol;

@property NSMutableArray *tableData;
@property NSMutableArray *tableColorWheel;
@property int first;
@property int currentWadrobeItem;
@property NSString *second;
@property NSString *third;
@property NSString *forth;
@property NSString *fifth;
@property NSString *sixth;

@property BOOL male;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.scrollView.scrollEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.delegate = self;
    self.navigationItem.title = @"Enter Clothing Item";

    self.saveButton.hidden = YES;

    //m
    self.maleButton.layer.cornerRadius = 12;
    self.maleButton.imageView.image = [UIImage imageNamed:@"Z3JHK-2"];
    self.maleButton.clipsToBounds = YES;
    self.maleButton.backgroundColor = [UIColor colorWithRed:11/255.0 green:83/255.0 blue:154/255.0 alpha:1.0];
    //f
    self.femaleButton.layer.cornerRadius = 12;
    self.femaleButton.clipsToBounds = YES;
    self.femaleButton.backgroundColor = [UIColor colorWithRed:201/255.0 green:52/255.0 blue:116/255.0 alpha:1.0];

    //color segmented properties
    self.colorSegmented.selectedSegmentIndex = 2;
    NSArray *segmentedArray = [self.colorSegmented subviews];
    [[segmentedArray objectAtIndex:0] setTintColor:[UIColor orangeColor]];
    [[segmentedArray objectAtIndex:1] setTintColor:[UIColor greenColor]];
    [[segmentedArray objectAtIndex:2] setTintColor:[UIColor redColor]];
    [[segmentedArray objectAtIndex:3] setTintColor:[Color seashell]];
    [[segmentedArray objectAtIndex:4] setTintColor:[UIColor blackColor]];
    [[segmentedArray objectAtIndex:5] setTintColor:[UIColor blueColor]];

    //init tapGestures on images
    [self.view setUserInteractionEnabled:YES];

    self.upperleftImage.userInteractionEnabled = NO;
    self.upperRightImage.userInteractionEnabled = NO;
    self.lowerLeftImage.userInteractionEnabled = NO;
    self.lowerRightImage.userInteractionEnabled = NO;

    //initalize colors -- 1-- Darks
    self.blackColor = [NSMutableArray arrayWithObjects:@"Black", @"Gray", @"Light Gray", @"Slate Gray", @"Maroon", @"Tan", @"Sienna", nil];
    self.blackColorCol = [NSMutableArray arrayWithObjects:[UIColor blackColor], [Color gray], [Color lightGray], [Color slateGray], [Color maroon], [Color tan], [Color sienna], nil];
    //2-- blues
    self.blueColorCol = [NSMutableArray arrayWithObjects:[Color midnightBlue], [Color navy], [Color slateBlue], [Color dodgerBlue], [Color lightSkyBlue], [Color turquoise], [Color cyan], nil];
    self.blueColor = [NSMutableArray arrayWithObjects:@"Mid-Night Blue", @"Navy", @"Slate Blue", @"Dodger Blue", @"Sky Blue", @"Turquoise",@"Cyan", nil];
    //3-- whites
    self.whiteColorCol = [NSMutableArray arrayWithObjects: [UIColor whiteColor], [Color snow], [Color ghostWhite], [Color ivory], nil];
    self.whiteColor = [NSMutableArray arrayWithObjects: @"Pure White", @"Snow", @"Ghost White", @"Ivory", nil];
    //4-- red
    self.redColorCol = [NSMutableArray arrayWithObjects:[Color salmon], [Color coral], [UIColor redColor], [Color hotPink], [Color blueViolet], nil];
    self.redColor = [NSMutableArray arrayWithObjects:@"Salmon", @"Coral", @"Red", @"Hot Pink", @"Blue Violet",nil];
    //5-- green
    self.greenColor = [NSMutableArray arrayWithObjects:@"Aquamarine", @"Dark Green", @"Sea Green", @"Honeydew", @"Lawn Green", @"Chartreuse", @"Khaki", nil];
    self.greenColorCol = [NSMutableArray arrayWithObjects:[Color aquamarine], [Color darkGreen], [Color seaGreen], [Color honeydew], [Color lawnGreen], [Color chartreuse], [Color khaki], nil];
    //6-- yellowOrange
    self.yellowOrangeColorCol = [NSMutableArray arrayWithObjects:[UIColor yellowColor], [Color gold], [Color lightGoldenrodYellow], [Color darkOrange], [Color orangeRed], nil];
    self.yellowOrangeColor = [NSMutableArray arrayWithObjects:@"Yellow", @"Gold", @"Goldenrod Yellow", @"Dark Orange", @"Orange Red", nil];

    self.tableData = self.whiteColor;
    self.tableColorWheel = self.whiteColorCol;

    [self.tableView reloadData];

    [self.textField addTarget:self action:@selector(onTextFieldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];

    //get the current wardrobe items and assign new item the next sequential number
    PFQuery *query = [PFQuery queryWithClassName:@"Wardrobe"];

    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {

        PFObject *localObbie = [objects firstObject];
        NSString *numberal = [localObbie objectForKey:@"number"];
        if (numberal) {
           // NSLog(@"number exists and its: %@", numberal);

            int localInt = [numberal intValue];
            self.first = localInt + 1;
        } else{
            NSLog(@"no number field");
            self.first = 1;
        }
    }];


}


#pragma mark 1 -- male or female button

- (IBAction)onMaleButtonTapped:(UIButton *)sender {
    self.upperleftImage.image = [UIImage imageNamed:@"hoodieM"];
    self.upperRightImage.image = [UIImage imageNamed:@"tshirt"];
    self.lowerLeftImage.image = [UIImage imageNamed:@"mensSweater"];
    self.lowerRightImage.image = [UIImage imageNamed:@"mensButtonD"];

    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperleftGesture:)];
    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    [self.upperleftImage addGestureRecognizer:tapGesture1];
    tapGesture1.delegate = self;

    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerLeftGesture:)];
    tapGesture2.numberOfTapsRequired = 1;
    [tapGesture2 setDelegate:self];
    [self.lowerLeftImage addGestureRecognizer:tapGesture2];
    tapGesture2.delegate = self;

    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperRightGest:)];
    tapGesture3.numberOfTapsRequired = 1;
    [tapGesture3 setDelegate:self];
    [self.upperRightImage addGestureRecognizer:tapGesture3];
    tapGesture3.delegate = self;

    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerRight:)];
    tapGesture4.numberOfTapsRequired = 1;
    [tapGesture4 setDelegate:self];
    [self.lowerRightImage addGestureRecognizer:tapGesture4];
    tapGesture4.delegate = self;

    self.upperleftImage.userInteractionEnabled = YES;
    self.upperRightImage.userInteractionEnabled = YES;
    self.lowerLeftImage.userInteractionEnabled = YES;
    self.lowerRightImage.userInteractionEnabled = YES;

    self.second = @"M";
    self.male = YES;

    self.instructionsLabel.text = @"Choose your top";
    [self.maleButton removeFromSuperview];
    [self.femaleButton removeFromSuperview];

}

- (IBAction)onFemaleButtonTapped:(UIButton *)sender {
    self.upperleftImage.image = [UIImage imageNamed:@"blouse"];
    self.upperRightImage.image = [UIImage imageNamed:@"womensButtonD"];
    self.lowerLeftImage.image = [UIImage imageNamed:@"womensSweater"];
    self.lowerRightImage.image = [UIImage imageNamed:@"tshirt"];

    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperleftGesture:)];
    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    [self.upperleftImage addGestureRecognizer:tapGesture1];
    tapGesture1.delegate = self;

    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerLeftGesture:)];
    tapGesture2.numberOfTapsRequired = 1;
    [tapGesture2 setDelegate:self];
    [self.lowerLeftImage addGestureRecognizer:tapGesture2];
    tapGesture2.delegate = self;

    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperRightGest:)];
    tapGesture3.numberOfTapsRequired = 1;
    [tapGesture3 setDelegate:self];
    [self.upperRightImage addGestureRecognizer:tapGesture3];
    tapGesture3.delegate = self;

    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerRight:)];
    tapGesture4.numberOfTapsRequired = 1;
    [tapGesture4 setDelegate:self];
    [self.lowerRightImage addGestureRecognizer:tapGesture4];
    tapGesture4.delegate = self;

    self.upperleftImage.userInteractionEnabled = YES;
    self.upperRightImage.userInteractionEnabled = YES;
    self.lowerLeftImage.userInteractionEnabled = YES;
    self.lowerRightImage.userInteractionEnabled = YES;

    self.instructionsLabel.text = @"Choose your top";
    [self.femaleButton removeFromSuperview];
    [self.maleButton removeFromSuperview];

    self.second = @"F";
    self.male = NO;

}

#pragma mark 2 -- choose clothing top
//1
- (IBAction)upperleftGesture:(UITapGestureRecognizer *)sender {
    if (self.male) {

        self.third = @"Hoodie";

        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        self.instructionsLabel.text = @"Choose hoodie color ";

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"hoodieM"];
        }];

    } else {
        self.third = @"Blouse";

        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        self.instructionsLabel.text = @"Choose blouse color";
        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"blouse"];
        }];
    }
}

//2
- (IBAction)lowerLeftGesture:(UITapGestureRecognizer *)sender {
    if (self.male) {
        self.third = @"Sweater";

        //change view
        self.instructionsLabel.text = @"Choose sweater color";

        self.upperRightImage.hidden = YES;
        self.upperleftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"mensSweater"];
        }];

    } else {

        self.third = @"Sweater";

        //change view
        self.instructionsLabel.text = @"Choose sweater color";

        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"womensSweater"];
        }];
    }
}
//3
- (IBAction)upperRightGest:(UITapGestureRecognizer *)sender {
    if (self.male) {

        self.third = @"T-Shirt";

        //change view
        self.instructionsLabel.text = @"Choose Tee color";

        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"tshirt"];
        }];

    } else {
        self.third = @"Button down";

        //change view
        self.instructionsLabel.text = @"Choose button-down color";
        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"womensButtonD"];
        }];
    }
}
//4
- (IBAction)lowerRight:(UITapGestureRecognizer *)sender {
    if (self.male) {

        self.third = @"Button down";

        //change view
        self.instructionsLabel.text = @"Choose button down color";
        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"mensButtonD"];
        }];
    } else if(!self.male){
        self.third = @"T-Shirt";

        //change view
        self.instructionsLabel.text = @"Choose Tee color ";
        self.upperleftImage.hidden = YES;
        self.upperRightImage.hidden = YES;
        self.lowerLeftImage.hidden = YES;
        self.lowerRightImage.hidden = YES;

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"tshirt"];
        }];    }
}

#pragma mark 3 -- color change Segmented Controller

- (IBAction)onColorChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.tableData = self.blackColor;
        self.tableColorWheel = self.blackColorCol;
    } else if (sender.selectedSegmentIndex == 1){
        self.tableData = self.blueColor;
        self.tableColorWheel = self.blueColorCol;
    } else if (sender.selectedSegmentIndex == 2){
        self.tableData = self.whiteColor;
        self.tableColorWheel = self.whiteColorCol;
    } else if(sender.selectedSegmentIndex == 3){
        self.tableData = self.redColor;
        self.tableColorWheel = self.redColorCol;
    } else if (sender.selectedSegmentIndex == 4){
        self.tableData = self.greenColor;
        self.tableColorWheel = self.greenColorCol;
    } else if(sender.selectedSegmentIndex == 5){
        self.tableData = self.yellowOrangeColor;
        self.tableColorWheel = self.yellowOrangeColorCol;
    }
    [self.tableView reloadData];
}


#pragma mark -- TableView Delegates
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"                         ";

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    cell.detailTextLabel.backgroundColor = [self.tableColorWheel objectAtIndex:indexPath.row];

}

#pragma mark 4 -- select color

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    cell.textLabel.textColor = [UIColor blueColor];
    self.instructionsLabel.text = @"Add description and rate clothing item";
    self.saveButton.hidden = NO;
    self.forth = cell.textLabel.text;
}

#pragma mark 5 -- select detail

- (IBAction)onTextFieldReturn:(UITextField *)sender {
    NSLog(@"%@", self.textField.text);
    self.fifth = self.textField.text;
}

#pragma mark 6 -- select rating

- (IBAction)touchUpInsideSlider:(UISlider *)sender {

    int progress = (sender.value);
    NSString *sliderString = [NSString stringWithFormat:@"%d", progress];
    self.sixth = sliderString;
    NSLog(@"%@", sliderString);

}

#pragma mark 7 -- Add item to Wardrobe

- (IBAction)onAddButtonTaped:(UIButton *)sender {
    //save item
    NSLog(@"selection: %d, %@, %@, %@, %@, %@ saved", self.first, self.second, self.third, self.forth, self.fifth, self.sixth);

    NSString *firstString = [NSString stringWithFormat:@"%d", self.first];
    PFObject *wardrobe = [PFObject objectWithClassName:@"Wardrobe"];
    wardrobe[@"number"] = firstString;
    if (self.second) {
        wardrobe[@"sex"] = self.second;
    } else{
        self.second = @"";
    }
    if (self.third) {
        wardrobe[@"topItem"] = self.third;
    } else{
        self.third = @"";
        wardrobe[@"topItem"] = self.third;
    }
    if (self.forth) {
        wardrobe[@"color"] = self.forth;
    } else{
        self.forth = @"";
        wardrobe[@"color"] = self.forth;
    }
    if (self.fifth) {
        wardrobe[@"itemDetail"] = self.fifth;
    } else{
        self.fifth = @"";
        wardrobe[@"itemDetail"] = self.fifth;
    }
    if (self.sixth) {
        wardrobe[@"rating"] = self.sixth;
    }else{
        self.sixth = @"";
        wardrobe[@"rating"] = self.sixth;
    }
    [wardrobe setObject:[[PFUser currentUser] objectId] forKey:@"senderId"];

    [wardrobe saveInBackground];


    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Saved!" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"canceled");
    }];
    UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"Add Another Item" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.saveButton.hidden = YES;
        self.selectedImage.hidden = YES;
        //add one to the number and set everythign back to no value
        self.first = self.first + 1;
        //second stays the same (sex)
        self.third = @"";//topItem
        self.forth = @"";//color
        self.fifth = @"";//detail
        self.sixth = @"";//rating

        NSLog(@"reset all wardrobe properties: %i, top: %@, color: %@, details: %@, rating: %@", self.first, self.third, self.forth, self.fifth, self.sixth);

        if (self.male == YES) {
            //bring male options back
            self.upperleftImage.hidden = NO;
            self.upperRightImage.hidden = NO;
            self.lowerLeftImage.hidden = NO;
            self.lowerRightImage.hidden = NO;

            self.upperleftImage.image = [UIImage imageNamed:@"hoodieM"];
            self.upperRightImage.image = [UIImage imageNamed:@"tshirt"];
            self.lowerLeftImage.image = [UIImage imageNamed:@"mensSweater"];
            self.lowerRightImage.image = [UIImage imageNamed:@"mensButtonD"];

            UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperleftGesture:)];
            tapGesture1.numberOfTapsRequired = 1;
            [tapGesture1 setDelegate:self];
            [self.upperleftImage addGestureRecognizer:tapGesture1];
            tapGesture1.delegate = self;

            UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerLeftGesture:)];
            tapGesture2.numberOfTapsRequired = 1;
            [tapGesture2 setDelegate:self];
            [self.lowerLeftImage addGestureRecognizer:tapGesture2];
            tapGesture2.delegate = self;

            UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperRightGest:)];
            tapGesture3.numberOfTapsRequired = 1;
            [tapGesture3 setDelegate:self];
            [self.upperRightImage addGestureRecognizer:tapGesture3];
            tapGesture3.delegate = self;

            UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerRight:)];
            tapGesture4.numberOfTapsRequired = 1;
            [tapGesture4 setDelegate:self];
            [self.lowerRightImage addGestureRecognizer:tapGesture4];
            tapGesture4.delegate = self;

            self.upperleftImage.userInteractionEnabled = YES;
            self.upperRightImage.userInteractionEnabled = YES;
            self.lowerLeftImage.userInteractionEnabled = YES;
            self.lowerRightImage.userInteractionEnabled = YES;

        } else {
            self.upperleftImage.hidden = NO;
            self.upperRightImage.hidden = NO;
            self.lowerLeftImage.hidden = NO;
            self.lowerRightImage.hidden = NO;

            self.upperleftImage.image = [UIImage imageNamed:@"blouse"];
            self.upperRightImage.image = [UIImage imageNamed:@"womensButtonD"];
            self.lowerLeftImage.image = [UIImage imageNamed:@"womensSweater"];
            self.lowerRightImage.image = [UIImage imageNamed:@"tshirt"];

            UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperleftGesture:)];
            tapGesture1.numberOfTapsRequired = 1;
            [tapGesture1 setDelegate:self];
            [self.upperleftImage addGestureRecognizer:tapGesture1];
            tapGesture1.delegate = self;

            UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerLeftGesture:)];
            tapGesture2.numberOfTapsRequired = 1;
            [tapGesture2 setDelegate:self];
            [self.lowerLeftImage addGestureRecognizer:tapGesture2];
            tapGesture2.delegate = self;

            UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(upperRightGest:)];
            tapGesture3.numberOfTapsRequired = 1;
            [tapGesture3 setDelegate:self];
            [self.upperRightImage addGestureRecognizer:tapGesture3];
            tapGesture3.delegate = self;

            UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(lowerRight:)];
            tapGesture4.numberOfTapsRequired = 1;
            [tapGesture4 setDelegate:self];
            [self.lowerRightImage addGestureRecognizer:tapGesture4];
            tapGesture4.delegate = self;

            self.upperleftImage.userInteractionEnabled = YES;
            self.upperRightImage.userInteractionEnabled = YES;
            self.lowerLeftImage.userInteractionEnabled = YES;
            self.lowerRightImage.userInteractionEnabled = YES;
        }
    }];

    UIAlertAction *wardrobeAction = [UIAlertAction actionWithTitle:@"See Your Wardrobe" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self performSegueWithIdentifier:@"Wardrobe" sender:self];
    }];

    UIAlertAction *takePicture = [UIAlertAction actionWithTitle:@"Add Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"take a picture");

        
    }];

    [alert addAction:takePicture];
    [alert addAction:cancelAction];
    [alert addAction:continueAction];
    [alert addAction:wardrobeAction];

    [self presentViewController:alert animated:YES completion:nil];

}


#pragma mark 8 -- logout
- (IBAction)onLogoutTapped:(UIBarButtonItem *)sender {

    [PFUser logOut];
    [self performSegueWithIdentifier:@"Logout" sender:self];
}



@end




