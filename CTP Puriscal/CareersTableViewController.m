//
//  CareersTableViewModel.m
//  CTP Puriscal
//
//  Created by user on 12/19/15.
//  Copyright © 2015 user. All rights reserved.
//

#import "CareersTableViewController.h"
#import "OptionTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "CareerDetailViewController.h"

@implementation CareersTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// método que carga las opciones a mostrar a partir de un property list
- (void) loadData
{
    // obtenemos el path
    NSString * path = [[NSBundle mainBundle] pathForResource:@"resources" ofType:@"plist"];
    
    // cargamos el contenido del archivo
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // establecemos los valores
    _optionNames = [dict objectForKey:@"CareerNames"];
    _optionImages = [dict objectForKey:@"CareerImages"];
    
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
    CareerDetailViewController *careerDetailViewController = [segue destinationViewController];
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
    long row = [myIndexPath section];
        
    careerDetailViewController.indexSelected = row;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _optionNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"careerTableViewCell";
    
    OptionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // normalmente se pone row en lugar de section
    long row = [indexPath section];
    
    cell.lblNombre.text = _optionNames[row];
    
    // según el id de la empresa se muestra cierta imagen
    cell.imgIcono.image = [UIImage imageNamed:_optionImages[row]];
    
    [cell.layer setCornerRadius:35.0f];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"careerDetail" sender:self];
}


@end
