//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Ross Danielson on 1/18/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusField;

@property int lastTapped; // 0 -> fahr, 1 -> cels

-(IBAction)onTextFieldTap:(id)sender;
-(IBAction)onTap:(id)sender;
-(IBAction)onConvertTap:(id)sender;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onTextFieldTap:(id)sender {
    if(sender == self.fahrenheitField) {
        NSLog(@"fahr");
        self.lastTapped = 0;
    } else if(sender == self.celsiusField) {
        NSLog(@"cels");
        self.lastTapped = 1;
    }
}

-(IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

-(IBAction)onConvertTap:(id)sender {
    if(self.lastTapped == 0) {
        // tapped fahrenheit last, so convert to cels
        float fahr = [self.fahrenheitField.text floatValue];
        
        float cels = (fahr -32) * 5/9;
        self.celsiusField.text = [NSString stringWithFormat:@"%0.2f",cels];
    } else if(self.lastTapped == 1) {
        // tapped fahrenheit last, so convert to cels
        float cels = [self.celsiusField.text floatValue];
        
        float fahr = (cels * 9/5) +32;
        self.fahrenheitField.text = [NSString stringWithFormat:@"%0.2f",fahr];
    }
}

@end
