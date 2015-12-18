//
//  OptionsTableViewController.m
//  CTP Puriscal
//
//  Created by user on 12/18/15.
//  Copyright © 2015 user. All rights reserved.
//

#import "OptionsTableViewController.h"
#import "OptionTableViewCell.h"

@interface OptionsTableViewController ()

@end


@implementation OptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(20, self.tableView.contentInset.left
                                                     , self.tableView.contentInset.bottom, self.tableView.contentInset.right)];
    
    _optionNames = @[@"Técnicos Medios",@"Requisitos",@"Contacto",@"Dirección"];
    
    _optionImages = @[@"carreras.png",@"requisitos.png",@"contacto.png",@"localizacion.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _optionNames.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"optionTableCell";
    
    OptionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    long row = [indexPath row];

    cell.lblNombre.text = _optionNames[row];
    
    // según el id de la empresa se muestra cierta imagen
    cell.imgIcono.image = [UIImage imageNamed:_optionImages[row]];
    

    return cell;
}


@end
