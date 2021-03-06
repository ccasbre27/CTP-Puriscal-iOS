//
//  OptionsTableViewController.m
//  CTP Puriscal
//
//  Created by user on 12/18/15.
//  Copyright © 2015 user. All rights reserved.
//

#import "OptionsTableViewController.h"
#import "OptionTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface OptionsTableViewController ()

@end


@implementation OptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // cargamos los datos
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
    _optionNames = [dict objectForKey:@"OptionNames"];
    _optionImages = [dict objectForKey:@"OptionImages"];
    
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
    static NSString * cellIdentifier = @"optionTableViewCell";
    
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
    // obtenemos el índice del elemento que se seleccionó
    NSInteger index = indexPath.section;
    
    // variable que indica cuál vista debe abrir
    NSString * viewName = @"";
    
    // de acuerdo al elemento seleccionado modificamos el nombre del segue
    switch (index) {
        case 0:
            viewName = @"careers";
            break;
            
        case 1:
            viewName = @"requirements";
            break;
            
        case 2:
            viewName = @"contacto";
            break;
            
        default:
            break;
    }
    
    // verficamos si hay un segue para mostrar
    if(![viewName isEqualToString:@""])
    {
        // mostramos el segue
        [self performSegueWithIdentifier:viewName sender:self];
    }
    
   

    
}

@end
