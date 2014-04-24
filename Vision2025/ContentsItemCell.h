//
//  ContentsItemCell.h
//  UpIt
//
//  Created by Billa Ustad on 10/10/13.
//  Copyright (c) 2013 UpIt. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ContentItemCellDelegate <NSObject>

-(void)ContentItem_usernameClickedAt:(int) position;

-(void)VoteupClickedAt:(int)position;

-(void)VotedownClickedAt:(int)position;

-(void)CommentCLicked:(int)position;


-(void)shareButton:(int)position;


@end



@interface ContentsItemCell : UITableViewCell

@property (nonatomic, retain)  NSString *votestatus;

@property (nonatomic, retain) IBOutlet UIButton *Button1;
@property (nonatomic, retain) IBOutlet UIButton *Button2;
@property (nonatomic, retain) IBOutlet UIButton *Button3;
@property (nonatomic, retain) IBOutlet UIButton *Button4;

@property (nonatomic, retain) IBOutlet UIImageView *UserProfilePicture;
@property (nonatomic, retain) IBOutlet UIImageView *point;
@property (nonatomic, retain) IBOutlet UIImageView *pointt;
@property (nonatomic, retain) IBOutlet UIImageView *pointtt;
@property (nonatomic, retain) IBOutlet UIImageView *typeimage;
@property (nonatomic, retain) IBOutlet UIView *containingBox;
@property (nonatomic, retain) IBOutlet UIView *Back;
@property (nonatomic, retain) IBOutlet UIView *Viewforlabels;
@property (nonatomic, retain) IBOutlet UILabel *text;
@property (nonatomic, retain) IBOutlet UILabel *commentnumber;
@property (nonatomic, retain) IBOutlet UILabel *typelabel;
@property (nonatomic, retain) IBOutlet UILabel *VoteNumber;
@property (nonatomic, retain) IBOutlet UILabel *TimeStemp;
@property (nonatomic, retain) IBOutlet UILabel *description;
@property (nonatomic, retain) IBOutlet UILabel *submittedby;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *commentimage;
@property (nonatomic, retain) IBOutlet UIImageView *Line;
@property (nonatomic,retain)  IBOutlet  UIButton *username;
@property (nonatomic,retain)     NSString *usernameclicked;
@property (assign, nonatomic) int position;

@property(assign, nonatomic) id<ContentItemCellDelegate> delegate;

-(IBAction)OpenUserNameProfile:(id)sender;
-(IBAction)voteupclicked:(id)sender;
-(IBAction)votedownclicked:(id)sender;
-(IBAction)commentaction:(id)sender;
-(IBAction)share:(id)sender;
@end
