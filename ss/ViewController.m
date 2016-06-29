//
//  ViewController.m
//  ss
//
//  Created by 荆传贺 on 16/6/28.
//  Copyright © 2016年 荆传贺. All rights reserved.
//

#import "ViewController.h"
#import "FBKVOController.h"
#import "Person.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**   fb   */
@property (nonatomic,strong) FBKVOController *KVOController;

/**   person   */
@property (nonatomic,strong) Person *person;
@end

@implementation ViewController
{
    
    


}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Frist";
    self.view.backgroundColor = [UIColor redColor];
    
    _person = [Person new];
    _person.name = @"1-name";
    
    NSLog(@"--40-- %@",_person.name);
   
    FBKVOController *KVOController = [FBKVOController controllerWithObserver:self];
    self.KVOController = KVOController;
    
    [self.KVOController observe:_person keyPath:@"name" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        
        
        self.title = change[NSKeyValueChangeNewKey];
    }];
    
    UITableView *tableVeiw = [[UITableView alloc] init];
    tableVeiw.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    tableVeiw.delegate = self;
    tableVeiw.dataSource = self;
    
    [self.view addSubview:tableVeiw];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *JH = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JH];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:JH];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd----%zd",indexPath.section,indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    _person.name = [NSString stringWithFormat:@"name--%zd",indexPath.row];
    
    NSLog(@"new----%@",_person.name);

}
@end


















