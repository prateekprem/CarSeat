//
//  HomeViewController.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITextField *yearField;
    UITextField *monthField;
    UITextField *FeetField;
    UITextField *inchField;
    UITextField *mHeightField;
    UITextField *poundsField;
    UITextField *OzWeightField;
    UITextField *KgField;
    
     UIImageView *yearImgView;
     UIImageView *monthImgView;
     UIImageView *feetImgView;
     UIImageView *inchImgView;
     UIImageView *mHeightImgView;
     UIImageView *poundImgView;
     UIImageView *ozWeightImgView;
     UIImageView *kgImgView;
    
    NSArray *ImgViews;
    NSArray *fields;
    int selectedImgViewTag;
    UIImageView *selectedImgView;
    
    NSString *strCurrentYear;
    NSString *strCurrentMonth;
      
    UIView *specialNeedView;
    UIImageView *topBarImageView;
    UITableView *tblView;
    
    NSMutableArray *specialNeedsArr;
}
@property (nonatomic, strong) UITableView *tblView;
@property (nonatomic, strong) IBOutlet UITextField *yearField;
@property (nonatomic, strong) IBOutlet UITextField *monthField;
@property (nonatomic, strong) IBOutlet UITextField *FeetField;
@property (nonatomic, strong) IBOutlet UITextField *inchField;
@property (nonatomic, strong) IBOutlet UITextField *mHeightField;
@property (nonatomic, strong) IBOutlet UITextField *poundsField;
@property (nonatomic, strong) IBOutlet UITextField *OzWeightField;
@property (nonatomic, strong) IBOutlet UITextField *KgField;


@property (nonatomic, strong) IBOutlet UIImageView *yearImgView;
@property (nonatomic, strong) IBOutlet UIImageView *monthImgView;
@property (nonatomic, strong) IBOutlet UIImageView *feetImgView;
@property (nonatomic, strong) IBOutlet UIImageView *inchImgView;
@property (nonatomic, strong) IBOutlet UIImageView *mHeightImgView;
@property (nonatomic, strong) IBOutlet UIImageView *poundImgView;
@property (nonatomic, strong) IBOutlet UIImageView *ozWeightImgView;
@property (nonatomic, strong) IBOutlet UIImageView *kgImgView;


-(IBAction)menuBtnPressed:(id)sender;

-(IBAction) checkBtnPressed:(id)sender;

-(IBAction)sepecialNeedsBtnPressed:(id)sender;

@end
