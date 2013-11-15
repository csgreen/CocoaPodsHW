//
//  CSGViewController.m
//  CocoaPodsHW
//
//  Created by Christina Green on 11/11/13.
//  Copyright (c) 2013 Greenster. All rights reserved.
//

#import "CSGViewController.h"
#import <JSONKit/JSONKit.h>

@interface CSGViewController () <NSURLSessionDelegate>

@end

@implementation CSGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self loadViewDesign];
    
    UIButton *refreshDataButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 80, 40)];
    
    refreshDataButton.backgroundColor = [UIColor redColor];
    
    [refreshDataButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    
    [refreshDataButton setTitle:@"Refresh" forState:UIControlStateNormal];
    [self.view addSubview:refreshDataButton];
    
    
}

-(void)loadViewDesign
{
    
    NSData *weatherData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Seattle,us"]];
    
    NSDictionary *weatherDict = [weatherData objectFromJSONData];
    
    NSDictionary *currentWeath = [[weatherDict objectForKey:@"weather"] objectAtIndex:0];
    NSString *weatherString = [currentWeath objectForKey:@"description"];
    // valueforkeypath
    NSString *city = [weatherDict objectForKey:@"name"];
    NSString *cityString = [NSString stringWithFormat:@"In %@, the weather is", city];
    
    NSLog(@"%@", currentWeath);
    
    NSDictionary *mainTemp = [weatherDict objectForKey:@"main"];
    NSString *currentTempInt = [mainTemp objectForKey:@"temp"];
    
    NSString *currentTemp = [NSString stringWithFormat:@"Temperature: %@ K", currentTempInt];
    
    //    NSString *weatherString1 = [currentTemp objectForKey:@"temp"];
    
    
    
    UILabel *weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    [weatherLabel setText:weatherString];
    [self.view addSubview:weatherLabel];
    
    UILabel *weatherLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 200, 40)];
    [weatherLabel1 setText:cityString];
    [self.view addSubview:weatherLabel1];
    
    UILabel *weatherLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 200, 40)];
    [weatherLabel2 setText:currentTemp];
    [self.view addSubview:weatherLabel2];
    
    NSLog(@"%@", weatherString);
    
    
}

-(void)refreshData
{
    [self loadViewDesign];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
