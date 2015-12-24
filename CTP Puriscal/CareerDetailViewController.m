//
//  CareerDetailViewController.m
//  CTP Puriscal
//
//  Created by user on 12/19/15.
//  Copyright © 2015 user. All rights reserved.
//

#import "CareerDetailViewController.h"

@interface CareerDetailViewController ()

@end

@implementation CareerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    
    NSString * keyName = @"";
    
    // según el item se carga un diccionario distinto
    switch (_indexSelected)
    {
        case 0:
            keyName = @"bancaenfinanzas";
            break;
            
        default:
            break;
    }
    
    // verficamos si hay un diccionario para cargar
    if(![keyName isEqualToString:@""])
    {
        // cargamos los datos
        [self loadDataWithKey:keyName];
        _lblCareerName.text = keyName;
    }
        
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// método que carga las opciones a mostrar a partir de un property list
- (void) loadDataWithKey:(NSString *) keyName
{
    // obtenemos el path
    NSString * path = [[NSBundle mainBundle] pathForResource:@"resources" ofType:@"plist"];
    
    // cargamos el contenido del archivo
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // establecemos los valores
    NSDictionary *dictionary = [dict objectForKey:keyName];
    
    //_lblIntroduction.text = [dictionary objectForKey:@"introduction"];
    _lblIntroduction.text = @"Bacon ipsum dolor amet biltong short loin flank, chicken tongue corned beef shankle kevin meatloaf hamburger andouille spare ribs bresaola beef ribs landjaeger. Beef ribs ribeye biltong, turducken pig brisket shankle filet mignon short ribs. Chicken flank ribeye turkey tail. Picanha landjaeger fatback, sausage cupim prosciutto meatloaf filet mignon boudin pastrami spare ribs pork loin pancetta pork chop ham. Corned beef shoulder fatback, rump ribeye kevin pork chop andouille pastrami meatloaf pig capicola. Pork venison fatback, corned beef beef ribs spare ribs bresaola chuck turkey salami porchetta landjaeger. Brisket beef ribs picanha pork.Prosciutto cow flank, venison kielbasa ball tip andouille chuck sirloin tenderloin fatback. Cupim andouille strip steak turkey cow ham shankle picanha. Ball tip short ribs ribeye cupim pig, capicola pastrami sausage bresaola pork belly landjaeger beef ribs swine jerky shankle. Kevin tenderloin sausage flank shank brisket. Tongue jerky landjaeger sausage, prosciutto swine beef ball tip pork chop alcatra ribeye. Ham hock rump chuck, fatback shank cupim tongue landjaeger pastrami shoulder kevin frankfurter leberkas. Tri-tip rump pancetta ribeye, shank brisket boudin short ribs meatloaf jowl porchetta venison.";
    
    _lblRequirements.text = [self loadDictionary:[dictionary objectForKey:@"requirements"]];;
    
    _lblProfesionalProfile.text = [self loadDictionary:[dictionary objectForKey:@"profile"]];
    
    _lblWorkPlace.text = [self loadDictionary:[dictionary objectForKey:@"workplace"]];
    
    _lblSubjectsFirstYear.text = [self loadDictionary:[dictionary objectForKey:@"subjectsFirstYear"]];
    
    _lblSubjectsSecondYear.text = [self loadDictionary:[dictionary objectForKey:@"subjectsSecondYear"]];
    
    _lblSubjectsThirdYear.text = [self loadDictionary:[dictionary objectForKey:@"subjectsThirdYear"]];
    
}

- (NSMutableString *) loadDictionary:(NSDictionary *) dictionary
{
    // variable para ir concatenando los valores
    NSMutableString *result = [[NSMutableString alloc] init];
    
    // recorremos los requisitos
    for (NSString *item in dictionary)
    {
        // concatenamos el string
        [result appendString:item];
        
        // agregamos un salto de línea
        [result appendString:@"\n"];
        
    }
    
    // retornamos el string con los valores separados por salto de línea
    return result;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
