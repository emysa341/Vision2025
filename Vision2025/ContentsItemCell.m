//
//  ContentsItemCell.m
//  UpIt
//
//  Created by Billa Ustad on 10/10/13.
//  Copyright (c) 2013 UpIt. All rights reserved.
//

#import "ContentsItemCell.h"
#import "EmyAppDelegate.h"

@implementation ContentsItemCell
@synthesize text, containingBox, imageView,username,usernameclicked, delegate, position,typelabel,VoteNumber,TimeStemp,commentnumber,Viewforlabels,Line,commentimage,Back,UserProfilePicture;

@synthesize Button1,Button2,Button3,Button4,votestatus;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(IBAction)OpenUserNameProfile:(id)sender
{
    [delegate ContentItem_usernameClickedAt:position];
    
}


-(IBAction)voteupclicked:(id)sender
{
    [delegate VoteupClickedAt:position];

    [Button3 setImage:[UIImage imageNamed:@"fb_UpVoteTap.png"] forState:UIControlStateNormal];
    
    [Button2 setImage:[UIImage imageNamed:@"fb_Down.png"] forState:UIControlStateNormal];

}
-(IBAction)votedownclicked:(id)sender
{
    [delegate VotedownClickedAt:position];

    [Button2 setImage:[UIImage imageNamed:@"fb_DownVoteTap.png"] forState:UIControlStateNormal];
    
     [Button3 setImage:[UIImage imageNamed:@"fb_Up.png"] forState:UIControlStateNormal];
    
}

-(IBAction)commentaction:(id)sender
{
    [delegate CommentCLicked:position];
    
}


-(IBAction)share:(id)sender
{
    [delegate shareButton:position];
}


@end
