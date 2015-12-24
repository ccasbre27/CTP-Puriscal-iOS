//
//  ContactViewController.m
//  CTP Puriscal
//
//  Created by user on 12/23/15.
//  Copyright © 2015 user. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactTableViewCell.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

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
    
    // establecemos los valores
    _optionNames = [NSArray arrayWithObjects:@"Teléfono",@"Correo electrónico",@"Dirección",nil];
    _optionDetail = [NSArray arrayWithObjects:@"2416-84-44",@"tecnicanocturnapuriscal@gmail.com",@"300 metros oeste del plantel del Ministerio de Obras Públicas de Puriscal",nil];
    _optionActionName = [NSArray arrayWithObjects:@"Llamar", @"Email",@"Navegar",nil];
    _optionImages = [NSArray arrayWithObjects:@"iconollamada.png", @"iconomail.png",@"icomapa.png",nil];

    
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
    static NSString * cellIdentifier = @"contactTableViewCell";
    
    ContactTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // normalmente se pone row en lugar de section
    long row = [indexPath section];
    
    cell.lblOptionName.text = _optionNames[row];
    cell.lblOptionDetail.text = _optionDetail[row];
    cell.lblOptionActionName.text = _optionActionName[row];
    
    cell.imgOption.image = [UIImage imageNamed:_optionImages[row]];
    
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
            break;
            
        case 3:
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
