//
//  NBTableViewController.m
//  LS39-UIWebView-HomeWork
//
//  Created by Nick Bibikov on 2/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//
//    1. Сделайте один контроллер с таблицей, в ней две секции: pdf и url
//    2. Присоедините к проекту парочку pdf файлов, их имена должны быть в таблице
//    3. Добавьте парочку web сайтов во вторую секцию
//    4. Когда я нажимаю на ячейку, то через пуш навигейшн должен отобразиться либо пдф либо web
//    5. Надеюсь понятно что для загрузки того либо другого мы используем один и тот же контроллев с UIWebView и иницианизируем его нужным NSURL
//    6. На веб вью должна быть крутилка, а в навигейшине кнопки назад и вперед

#import "NBTableViewController.h"
#import "NBWebVIewController.h"

@interface NBTableViewController ()

@property (strong, nonatomic) NSArray* itemsPDF;
@property (strong, nonatomic) NSArray* itemsURL;

@end


@implementation NBTableViewController


- (void) viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = self.view.bounds;
    rect.origin = CGPointZero;
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorInset = UIEdgeInsetsZero;
    
    self.itemsPDF = @[@"1.pdf", @"2.pdf"];
    self.itemsURL = @[@"http://github.com",
                      @"http://raywenderlich.com",
                      @"https://vk.com/iosdevcourse",
                      @"http://stackoverflow.com",
                      @"http://google.com.ua"];
    
}


#pragma mark - Help methods

- (NSString*) urlForFile:(NSString*)file {
    
    return [[NSBundle mainBundle] pathForResource:file ofType:nil];
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
        NBWebVIewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NBWebViewController"];
        vc.dataURL = [NSURL fileURLWithPath:[self urlForFile:[self.itemsPDF objectAtIndex:indexPath.row]]];
        
        [self.navigationController pushViewController:vc animated:YES];
    
    } else if (indexPath.section == 1) {
        
        NBWebVIewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NBWebViewController"];
        vc.dataURL = [NSURL URLWithString:[self.itemsURL objectAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}




#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"PDF files";
    
    } else if (section == 1) {
        return @"URL's";
        
    }
    
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return [self.itemsPDF count];
        
    } else if (section == 1) {
        return [self.itemsURL count];
        
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* indentifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.itemsPDF objectAtIndex:indexPath.row];
        
    } else if (indexPath.section == 1) {
        cell.textLabel.text = [self.itemsURL objectAtIndex:indexPath.row];
        
    }
    
    return cell;
    
}





@end
