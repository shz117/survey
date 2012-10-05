//
//  IMI-CStreetscapeDataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 10/3/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CStreetscapeDataViewController.h"

@interface IMI_CStreetscapeDataViewController ()
@property (weak, nonatomic) IBOutlet UILabel *StreetscapeLabel;
@property (weak, nonatomic) IBOutlet UILabel *question31Label;
@property (weak, nonatomic) IBOutlet UIPickerView *question31Answer;
@property (weak, nonatomic) IBOutlet UILabel *question32Label;
@property (weak, nonatomic) IBOutlet UIPickerView *question32Answer;
@property (weak, nonatomic) IBOutlet UILabel *question33Label;
@property (weak, nonatomic) IBOutlet UIPickerView *question33Answer;
@property (nonatomic, retain) NSArray *question31AnswerArray;
@property (nonatomic, retain) NSArray *question32AnswerArray;
@property (nonatomic, retain) NSArray *question33AnswerArray;
@end

@implementation IMI_CStreetscapeDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.StreetscapeLabel.text=NSLocalizedString(@"StreetscapeLabel", nil);
    self.question31Label.text=NSLocalizedString(@"question31Label", nil);
    self.question31AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"question31Answer0", nil),NSLocalizedString(@"question31Answer1", nil),nil];
    self.question32Label.text=NSLocalizedString(@"question32Label", nil);
    self.question32AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"largemediumsmallNA8", nil),NSLocalizedString(@"largemediumsmallNA0", nil),NSLocalizedString(@"largemediumsmallNA1", nil),NSLocalizedString(@"largemediumsmallNA2", nil),nil];
    self.question33Label.text=NSLocalizedString(@"question33Label", nil);
    self.question33AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"somealotfewnoneNA8", nil),NSLocalizedString(@"somealotfewnoneNA0", nil),NSLocalizedString(@"somealotfewnoneNA1", nil),NSLocalizedString(@"somealotfewnoneNA2", nil),nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.question31Answer) {
        return [self.question31AnswerArray objectAtIndex:row];
    }
    if (pickerView==self.question32Answer) {
        return [self.question32AnswerArray objectAtIndex:row];
    }
    return [self.question33AnswerArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.question31Answer) {
        return [self.question31AnswerArray count];
    }
    if (pickerView==self.question32Answer) {
        return [self.question32AnswerArray count];
    }
	return [self.question33AnswerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    NSInteger question32AnswerValue=8;
    NSInteger question33AnswerValue=8;
    NSInteger question32AnswerselectedRow=[self.question32Answer selectedRowInComponent:0];
    if (question32AnswerselectedRow) {
        question32AnswerValue=[self.question32Answer selectedRowInComponent:0];
    }
    NSInteger question33AnswerselectedRow=[self.question33Answer selectedRowInComponent:0];
    if (question33AnswerselectedRow) {
        question33AnswerValue=[self.question33Answer selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self.question31Answer selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", question32AnswerValue],[NSString stringWithFormat:@"%d", question33AnswerValue], nil];
}

@end