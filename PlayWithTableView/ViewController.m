//
//  ViewController.m
//  PlayWithTableView
//
//  Created by Kate Polyakova on 4/26/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NSArray *data;
@property(nonatomic, strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //делаем те же привязки (только кодом), что и в UI Builder 
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    // создаю массив наименований
    self.data = @[@"Астра", @"Роза", @"Гладиолус", @"Тюльпан", @"Крокус", @"Хризантема"];
    // создаю массив картинок
    self.images = @[@"astra.jpg",@"rose.png", @"gladi.jpg", @"tulip.jpg", @"krokus.jpg", @"hriza.jpg"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

   //сколько строк будет в секции
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

       return self.data.count;

}

    //данные в ячейках
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    cell.textLabel.text = self.data[(NSUInteger)indexPath.row];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //выводим в лог имя строки, на которую нажали
    NSLog(@"Tapped row with title: %@", self.data[(NSUInteger)indexPath.row]);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ImageViewController *imageViewController =  [mainStoryboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
    
    NSString *imageFileName = self.images[(NSUInteger)indexPath.row];
    imageViewController.imageName = imageFileName;

    [self presentViewController:imageViewController animated:YES completion:nil];

}


@end
