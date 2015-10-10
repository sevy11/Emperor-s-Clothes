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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIView *superView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;

@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImage;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *upperLeftTapGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *lowerLeftTapGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *upperRightGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *lowerRightTapGesture;

@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmented;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIImageView *upperleftImage;
@property (weak, nonatomic) IBOutlet UIImageView *lowerLeftImage;
@property (weak, nonatomic) IBOutlet UIImageView *upperRightImage;
@property (weak, nonatomic) IBOutlet UIImageView *lowerRightImage;

@property (weak, nonatomic) IBOutlet UISlider *slider;

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

@property NSMutableArray *selectionArray;
@property BOOL male;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.scrollView.contentSize = self.view;
    self.tableColorWheel = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    self.tableData = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];


    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsZero;
    self.male = NO;
    //m
    self.maleButton.layer.cornerRadius = 12;
    self.maleButton.clipsToBounds = YES;
    self.maleButton.backgroundColor = [UIColor colorWithRed:11/255.0 green:83/255.0 blue:154/255.0 alpha:1.0];
    //f
    self.femaleButton.layer.cornerRadius = 12;
    self.femaleButton.clipsToBounds = YES;
    self.femaleButton.backgroundColor = [UIColor colorWithRed:201/255.0 green:52/255.0 blue:116/255.0 alpha:1.0];

    self.tableView.delegate = self;
    self.navigationItem.title = @"Enter Clothing Item";



    //color segmented properties
    NSArray *segmentedArray = [self.colorSegmented subviews];
    [[segmentedArray objectAtIndex:5] setTintColor:[UIColor blackColor]];
    [[segmentedArray objectAtIndex:4] setTintColor:[UIColor blueColor]];
    [[segmentedArray objectAtIndex:3] setTintColor:[Color seashell]];
    [[segmentedArray objectAtIndex:2] setTintColor:[Color salmon]];
    [[segmentedArray objectAtIndex:1] setTintColor:[Color limeGreen]];
    [[segmentedArray objectAtIndex:0] setTintColor:[UIColor orangeColor]];

    //init tapGestures on images
    [self.view setUserInteractionEnabled:YES];

    self.upperleftImage.userInteractionEnabled = YES;
    self.upperRightImage.userInteractionEnabled = YES;
    self.lowerLeftImage.userInteractionEnabled = YES;
    self.lowerRightImage.userInteractionEnabled = YES;

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


    //initalize colors -- 1-- Darks
    self.blackColor = [NSMutableArray arrayWithObjects:@"Black", @"Gray", @"Light Gray", @"Slate Gray", @"Maroon", @"Tan", @"Sienna", nil];
    self.blackColorCol = [NSMutableArray arrayWithObjects:[UIColor blackColor], [Color gray], [Color lightGray], [Color slateGray], [Color maroon],[Color tan], [Color sienna], nil];
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

    self.selectionArray = [NSMutableArray new];

    [self.textField addTarget:self action:@selector(onTextFieldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];

}

#pragma mark -- male or female button
- (IBAction)onMaleButtonTapped:(UIButton *)sender {
    self.upperleftImage.image = [UIImage imageNamed:@"hoodie"];
    self.upperRightImage.image = [UIImage imageNamed:@"longSleevedT"];
    self.lowerLeftImage.image = [UIImage imageNamed:@"hoodie"];
    self.lowerRightImage.image = [UIImage imageNamed:@"sweaterMens"];

    Wardrobe *war = [Wardrobe new];
    war.sex = @"M";
    [self.selectionArray addObject:war];
    NSLog(@"%@", war.sex);
    self.male = YES;

//    self.navigationItem.title = @"Choose Your Top";
    self.instructionsLabel.text = @"Choose your top";
    [self.maleButton removeFromSuperview];
    [self.femaleButton removeFromSuperview];

}

- (IBAction)onFemaleButtonTapped:(UIButton *)sender {
    self.upperleftImage.image = [UIImage imageNamed:@"hoodie"];
    self.upperRightImage.image = [UIImage imageNamed:@"buttonDownWomens"];
    self.lowerLeftImage.image = [UIImage imageNamed:@"blouse"];
    self.lowerRightImage.image = [UIImage imageNamed:@"blouse"];

    Wardrobe *war = [Wardrobe new];
    war.sex = @"F";
    [self.selectionArray addObject:war];
    NSLog(@"%@", war.sex);
    self.male = NO;

//    self.navigationItem.title = @"Choose Your Top";
    self.instructionsLabel.text = @"Choose your top";
    [self.femaleButton removeFromSuperview];
    [self.maleButton removeFromSuperview];
}

//1
- (IBAction)upperleftGesture:(UITapGestureRecognizer *)sender {
    Wardrobe *war = [Wardrobe new];

    if (self.male) {
    war.topItem = @"Hoodie";
    [self.selectionArray addObject:war];
    NSLog(@"%@", war.topItem);

        [self.upperRightImage removeFromSuperview];
        [self.lowerLeftImage removeFromSuperview];
        [self.lowerRightImage removeFromSuperview];
        [self.upperleftImage removeFromSuperview];

        self.instructionsLabel.text = @"Pick hoodie color ";

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
        }];

    } else {

        war.topItem = @"women's hoodie";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);

        self.instructionsLabel.text = @"Pick hoodie color ";

        [self.upperRightImage removeFromSuperview];
        [self.lowerLeftImage removeFromSuperview];
        [self.lowerRightImage removeFromSuperview];
        [self.upperleftImage removeFromSuperview];

        NSTimeInterval seconds = 1.0;
        [UIView animateWithDuration:seconds animations:^{
            self.selectedImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
        }];
    }
}

//2
- (IBAction)lowerLeftGesture:(UITapGestureRecognizer *)sender {
    Wardrobe *war = [Wardrobe new];
    if (self.male) {
    //    war.sex = @"M";
        war.topItem = @"lower Hoodie";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);
        self.lowerLeftImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
       // self.navigationItem.title = @"Pick Hoodie Color";
        self.instructionsLabel.text = @"Pick hoodie color ";
        [self.upperRightImage removeFromSuperview];
        [self.upperleftImage removeFromSuperview];
        [self.lowerRightImage removeFromSuperview];
    } else {
      //  war.sex = @"F";
        war.topItem = @"left blouse";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);
        self.lowerLeftImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
     //   self.navigationItem.title = @"Pick Hoodie Color";
        self.instructionsLabel.text = @"Pick hoodie color ";
        [self.upperRightImage removeFromSuperview];
        [self.upperleftImage removeFromSuperview];
        [self.lowerRightImage removeFromSuperview];
    }
}
//3
- (IBAction)upperRightGest:(UITapGestureRecognizer *)sender {
    Wardrobe *war = [Wardrobe new];
    if (self.male) {
        //war.sex = @"M";
        war.topItem = @"long sleeved T";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);
        self.upperRightImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
//        self.navigationItem.title = @"Pick T Color";
        self.instructionsLabel.text = @"Pick ling sleeved T color ";
        [self.upperleftImage removeFromSuperview];
        [self.lowerLeftImage removeFromSuperview];
        [self.lowerRightImage removeFromSuperview];
    } else {
        //war.sex = @"F";
        war.topItem = @"women's button down";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);
        self.upperRightImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
        //self.navigationItem.title = @"Pick Button Down Color";
        self.instructionsLabel.text = @"Pick button down color ";
        [self.upperleftImage removeFromSuperview];
        [self.lowerLeftImage removeFromSuperview];
        [self.lowerRightImage removeFromSuperview];
    }
}

//4
- (IBAction)lowerRight:(UITapGestureRecognizer *)sender {
    Wardrobe *war = [Wardrobe new];
    if (self.male) {
        //war.sex = @"M";
        war.topItem = @"Sweater";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);
        self.lowerRightImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
     //   self.navigationItem.title = @"Pick Sweater Color";
        self.instructionsLabel.text = @"Pick sweater color ";
        [self.upperRightImage removeFromSuperview];
        [self.lowerLeftImage removeFromSuperview];
        [self.upperleftImage removeFromSuperview];
    } else if(!self.male){
        //war.sex = @"F";
        war.topItem = @"right side blouse";
        [self.selectionArray addObject:war];
        NSLog(@"%@", war.topItem);
        self.lowerRightImage.image = [UIImage imageNamed:@"Check_mark_23x20_02.svg"];
      //  self.navigationItem.title = @"Pick Blouse Color";
        self.instructionsLabel.text = @"Pick blouse color ";
        [self.upperRightImage removeFromSuperview];
        [self.lowerLeftImage removeFromSuperview];
        [self.upperleftImage removeFromSuperview];
    }
}

#pragma mark -- color change Segmented Controller

- (IBAction)onColorChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.tableData = self.blackColor;
    } else if (sender.selectedSegmentIndex == 1){
        self.tableData = self.blueColor;
    } else if (sender.selectedSegmentIndex == 2){
        self.tableData = self.whiteColor;
    } else if(sender.selectedSegmentIndex == 3){
        self.tableData = self.redColor;
    } else if (sender.selectedSegmentIndex == 4){
        self.tableData = self.greenColor;
    } else if(sender.selectedSegmentIndex == 5){
        self.tableData = self.yellowOrangeColor;
    }
    [self.tableView reloadData];
}

#pragma mark -- TextField

- (IBAction)onTextFieldReturn:(UITextField *)sender {

    Wardrobe *war = [Wardrobe new];
    war.itemDetail = self.textField.text;
    [self.selectionArray addObject:war];

    NSLog(@"%@", war.itemDetail);
   // [sender resignFirstResponder];

}


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
    if (self.colorSegmented.selectedSegmentIndex == 0) {
    cell.detailTextLabel.backgroundColor = [self.blackColorCol objectAtIndex:indexPath.row];
    } else if (self.colorSegmented.selectedSegmentIndex == 1){
        cell.detailTextLabel.backgroundColor = [self.blueColorCol objectAtIndex:indexPath.row];
    } else if (self.colorSegmented.selectedSegmentIndex == 2){
        cell.detailTextLabel.backgroundColor = [self.whiteColorCol objectAtIndex:indexPath.row];
    }   else if (self.colorSegmented.selectedSegmentIndex == 3){
        cell.detailTextLabel.backgroundColor = [self.redColorCol objectAtIndex:indexPath.row];
    }else if (self.colorSegmented.selectedSegmentIndex == 4){
        cell.detailTextLabel.backgroundColor = [self.greenColorCol objectAtIndex:indexPath.row];
    }else if (self.colorSegmented.selectedSegmentIndex == 5){
        cell.detailTextLabel.backgroundColor = [self.yellowOrangeColorCol objectAtIndex:indexPath.row];
    }
}


//select Row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Wardrobe *ward = [Wardrobe new];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    cell.textLabel.textColor = [UIColor blueColor];
    ward.colorString = cell.textLabel.text;

    NSLog(@"from cell: %@", ward.colorString);
    self.instructionsLabel.text = @"Add description or rate clothing item with Slider";

    [self.selectionArray addObject:ward];
}

- (IBAction)touchUpInsideSlider:(UISlider *)sender {
    int progress = (sender.value);
    NSString *sliderString = [NSString stringWithFormat:@"%d", progress];
    Wardrobe *ward = [Wardrobe new];
    ward.rating = sliderString;
    self.ratingLabel.text = ward.rating;
    [self.selectionArray addObject:ward];

    NSLog(@"%@", ward.rating);

}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {
    // NSLog(@"%lu", (unsigned long)[self.selectionArray count]);

    for (Wardrobe *war in self.selectionArray) {

        NSLog(@"%@,%@, %@, %@, %@", war.sex, war.topItem, war.colorString, war.itemDetail, war.rating);
        }
    }






//- (void)performCitySearch:(NSString *)incomingString  {
//
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=10&units=imperial&mode=json",incomingString]];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//        if (!connectionError) {
//            NSDictionary *weatherDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
//
//            NSDictionary *list = weatherDict[@"list"];
//
//            for (NSDictionary *item in list) {
//
//                NSDictionary *temp = item[@"temp"];
//                NSDictionary *morn = temp[@"morn"];
//                NSDictionary *day = temp[@"day"];
//                NSDictionary *eve = temp[@"eve"];
//                NSDictionary *night = temp[@"night"];
//
//                NSLog(@"%@, %@, %@, %@", morn, day, eve, night);
//            }
//            
//        }
//    }];
//    
//}




//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    return 2;
//}
//
//-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return self.tops.count;
//}
//
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//
//     return self.wardrobeChoice[component][row];
//
////    [pickerView selectedRowInComponent:0];
//
//}
//
//
//-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//
//
//
//
//    NSLog(@"selected row: %lu", row);
//    switch (row) {
//        case 0:
//            self.item1 = @"Hoodie";
//            NSLog(@"%@", self.item1);
//            break;
//        case 1:
//            self.item2 = @"Sweatshirt";
//            NSLog(@"%@", self.item2);
//            break;
//        default:
//            self.item1 = @"Other than Hoodie";
//            NSLog(@"Some other piece");
//            break;
//    }
//
//    self.clothingPieces = [NSMutableArray arrayWithObjects:self.item1, self.item2, nil];
//
//   // NSLog(@"%lu, %lu", row, component);
//}
//
//- (IBAction)onAddClothingItem:(UIButton *)sender {
//
//
//    NSMutableArray *newArray = [NSMutableArray arrayWithObjects:self.item1, self.item2, nil];
//
//    NSLog(@"%@", self.clothingPieces);
//
//}


@end




