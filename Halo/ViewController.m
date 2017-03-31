//
//  ViewController.m
//  Halo
//
//  Created by angelen on 2017/3/31.
//  Copyright © 2017年 ANGELEN. All rights reserved.
//

#import "ViewController.h"
#import "CYContactViewModel.h"
#import "CYContact.h"

static NSString *const CellReuseIdentifier = @"CellReuseIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) CYContactViewModel *viewModel;

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self refresh];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    [self.view addSubview:self.tableView];
}

- (void)refresh {
    self.viewModel = [[CYContactViewModel alloc] init];
    [[self.viewModel loadContacts] subscribeNext:^(id x) {
        NSLog(@"x -> %@", x);
        [self.tableView reloadData];
    } error:^(NSError *error) {
        NSLog(@"error -> %@", error);
    } completed:^{
        NSLog(@"completed");
    }];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    CYContact *contact = self.viewModel.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

@end
