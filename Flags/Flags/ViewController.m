//
//  ViewController.m
//  Flags
//
//  Created by Jon Manning on 22/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "ViewController.h"
#import "FlagViewController.h"

@interface ViewController () {
    NSMutableArray* flagNames;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    flagNames = [[NSMutableArray alloc] init];
    
    NSArray* flagsInBundle = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:nil];
    
    for (NSString* flagFile in flagsInBundle) {
        [flagNames addObject:[flagFile lastPathComponent]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [flagNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FlagCell"];
    
    NSString* flagName = [flagNames objectAtIndex:indexPath.row];
    
    flagName = [flagName stringByDeletingPathExtension];
    flagName = [flagName capitalizedString];
    
    cell.textLabel.text = flagName;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* selectedFlagName = flagNames[indexPath.row];
    
    self.flagImage.image = [UIImage imageNamed:selectedFlagName];
    self.flagName.text = [[selectedFlagName stringByDeletingPathExtension] capitalizedString];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        UITableViewCell* cell = sender;
        
        FlagViewController* flagViewController = segue.destinationViewController;
        
        NSIndexPath* indexPath = [self.flagsList indexPathForCell:cell];
        
        flagViewController.selectedFlag = flagNames[indexPath.row];
    }
    
}















@end
