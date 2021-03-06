// RootViewController.m
//
// Copyright (c) 2011 Mattt Thompson (http://mattt.me)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RootViewController.h"
#import "ArrayFormatterViewController.h"
#import "HoursOfOperationFormatterViewController.h"
#import "LocationFormatterViewController.h"
#import "OrdinalNumberFormatterViewController.h"
#import "TimeIntervalFormatterViewController.h"
#import "URLRequestFormatterViewController.h"

enum {
    ArrayRowIndex,
    HoursOfOperationRowIndex,
    LocationRowIndex,
    OrdinalNumberRowIndex,
    TimeIntervalRowIndex,
    URLRequestRowIndex
} RootViewControllerRowIndexes;

@interface RootViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation RootViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) {
        return nil;
    }
    
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"FormatterKit", nil);
    
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", nil) style:UIBarButtonItemStyleDone target:nil action:nil] autorelease];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case ArrayRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Array Formatter", nil);
            break;
        case HoursOfOperationRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Hours of Operation Formatter", nil);
            break;
        case LocationRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Location Formatter", nil);
            break;
        case OrdinalNumberRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Ordinal Number Formatter", nil);
            break;
        case TimeIntervalRowIndex:
            cell.textLabel.text = NSLocalizedString(@"Time Interval Formatter", nil);
            break;
        case URLRequestRowIndex:
            cell.textLabel.text = NSLocalizedString(@"URL Request Formatter", nil);
            break;
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = nil;
    
    switch (indexPath.row) {
        case ArrayRowIndex:
            viewController = [[[ArrayFormatterViewController alloc] init] autorelease];
            break;
        case HoursOfOperationRowIndex:
            viewController = [[[HoursOfOperationFormatterViewController alloc] init] autorelease];
            break;
        case LocationRowIndex:
            viewController = [[[LocationFormatterViewController alloc] init] autorelease];
            break;
        case OrdinalNumberRowIndex:
            viewController = [[[OrdinalNumberFormatterViewController alloc] init] autorelease];
            break;
        case TimeIntervalRowIndex:
            viewController = [[[TimeIntervalFormatterViewController alloc] init] autorelease];
            break;
        case URLRequestRowIndex:
            viewController = [[[URLRequestFormatterViewController alloc] init] autorelease];
            break;
    }
    
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
