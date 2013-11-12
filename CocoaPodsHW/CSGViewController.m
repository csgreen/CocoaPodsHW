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
  //  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
//    NSURLSession *session = [NSURLSession sessionWithConfiguration: configuration
//                                                          delegate: self
//                                                     delegateQueue: nil];

    NSData *weatherData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Seattle,us"]];
   
    NSDictionary *weatherDict = [weatherData objectFromJSONData];
    NSDictionary *currentWeath = [[weatherDict objectForKey:@"weather"] objectAtIndex:0];
    NSString *weatherString = [currentWeath objectForKey:@"description"];
    
    UILabel *weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 200, 40)];
    [weatherLabel setText:weatherString];
    [self.view addSubview:weatherLabel];
    
    NSLog(@"%@", weatherString);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
