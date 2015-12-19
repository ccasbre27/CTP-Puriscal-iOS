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

@implementation CareersTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _optionNames = @[@"Banca en Finanzas",@"Contabilidad",@"Ejecutivo para Centro de Servicios",@"Informática Empresarial",
                     @"Informática en Redes",@"Informática en Soporte",@"Logística y Distribución",@"Secretariado Ejecutivo",
                     @"Turismo de alimentos y bebidas"];
    
    _optionImages = @[@"bancaenfinanzas.png",@"contador.png",@"customerservice.png",@"informaticamepresarial.png",
                      @"redes.png",@"soportecomputadoras.png",@"logistica.png",@"secretariado.png",@"turismo.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    // obtenemos el índice del elemento que se seleccionó
    NSInteger index = indexPath.row;
    
    // variable que indica cuál vista debe abrir
    NSString * viewName = @"";
    
    // de acuerdo al elemento seleccionado modificamos el nombre del segue
    switch (index) {
        case 0:
            viewName = @"tecnicos";
            break;
            
        case 1:
            viewName = @"vista2";
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
