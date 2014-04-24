//
//  MainViewController.m
//  Vision2025
//
//  Created by Ammad iOS on 16/04/2014.
//  Copyright (c) 2014 Emy Solutions. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

{
    UIPageControl *pagecontrol;
    BOOL pageControlBeingUsed;
    
    int x;
    int currentselection;
    UIButton *customButton;
}
@synthesize table_view,webview;
NSString *COntentUploaderName;
NSString *ProfilePic;
NSString *statusFollow;
NSString *userId;
NSNumber *myNum;
NSString *content_title;
NSDictionary *current;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
id tempob;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *nav_titlelbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationItem.titleView.frame.size.width,40)];
    
    nav_titlelbl.text=@"CodeGerms.com";
    
    nav_titlelbl.textAlignment=NSTextAlignmentCenter;
    
    nav_titlelbl.textColor = [UIColor whiteColor];
    nav_titlelbl.backgroundColor =  [UIColor clearColor];
    
    UIFont *lblfont=[UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    [nav_titlelbl setFont:lblfont];
    
    self.navigationItem.titleView=nav_titlelbl;
    

    
    // Do any additional setup after loading the view from its nib.
    x=3;
    self.navigationController.navigationBar.translucent = NO;
    
    CGFloat contentOffSet = 0;

	

	for (int i =1; i<=7; i++) {

        CGRect buttonViewFrame;
        customButton = [UIButton buttonWithType:UIButtonTypeCustom];

        [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
        if(i==1)
        {
            buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
            [customButton setTitle:@"Trending" forState:UIControlStateNormal];
        }
        
      else  if(i==2)
        {
            buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
            [customButton setTitle:@"Newest" forState:UIControlStateNormal];
        }
        else if(i==3)
        {
            buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
            [customButton setTitle:@"HOT" forState:UIControlStateNormal];
        }
         else   if(i==4)
        {
            buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
            [customButton setTitle:@"Trending" forState:UIControlStateNormal];
        }
         else   if(i==5)
         {
             buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
             [customButton setTitle:@"Newest" forState:UIControlStateNormal];
         }
         else   if(i==6)
         {
             buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
             [customButton setTitle:@"HOT" forState:UIControlStateNormal];
         }
        
         else   if(i==7)
         {
             buttonViewFrame = CGRectMake(contentOffSet,0,106, 45);
             [customButton setTitle:@"Trending" forState:UIControlStateNormal];
         }
        
     
        
                customButton.font = [UIFont systemFontOfSize:16];
		[customButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		customButton.frame = buttonViewFrame;
		customButton.tag = i;


		[_scrollViewController addSubview:customButton];
		contentOffSet += customButton.frame.size.width * 1;
		_scrollViewController.contentSize = CGSizeMake(3*320,_scrollViewController.frame.size.height);
        
        currentselection=1;
        [self highlighttext];
        
        
        
        
      
        self.table_view.dataSource=self;
        self.table_view.delegate =self;
             //   [self.table_view reloadData];

	}

_scrollViewController.contentSize = CGSizeMake(106*7,_scrollViewController.frame.size.height);
    
    

    
      [_scrollViewController setContentOffset:CGPointMake(2*106,0) animated:YES];

}

-(void)adjust
{
    [_scrollViewController setContentOffset:CGPointMake(3*106,0) animated:NO];
}

-(void)adjust2
{
        [_scrollViewController setContentOffset:CGPointMake(1*106,0) animated:YES];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
   
   // NSLog(@"%f",_scrollViewController.contentOffset.x);
    //  NSLog(@"%f",scrollView.contentOffset.x);
    // NSLog(@"%f",targetContentOffset);
    
    //  [self scrollViewDidEndScrollingAnimation:scrollView];
    
    if(_scrollViewController.contentOffset.x < 80)
    {
       // [_scrollViewController setContentOffset:CGPointMake(0,0) animated:YES];
        [_scrollViewController setContentSize:CGSizeMake(7*106,0)];
        
        [self performSelector:@selector(adjust) withObject:nil afterDelay:0.01f];
        currentselection = 2;
    }
    
    else if(_scrollViewController.contentOffset.x >= 80 && _scrollViewController.contentOffset.x <=170)
    {
        //hot
        [_scrollViewController setContentOffset:CGPointMake(1*106,0) animated:YES];
        currentselection = 0;
    }
    
    else if(_scrollViewController.contentOffset.x >170  && _scrollViewController.contentOffset.x <230)
    {
        
        //rising
        [_scrollViewController setContentOffset:CGPointMake(2*106,0) animated:YES];
        currentselection = 1;
    }
    else if(_scrollViewController.contentOffset.x >230  && _scrollViewController.contentOffset.x <397)
    {
        //newest
        [_scrollViewController setContentOffset:CGPointMake(3*106,0) animated:YES];
        currentselection = 2;
    }
    
    else if( _scrollViewController.contentOffset.x >397)
    {
        
        //  _scrollViewController.contentOffset = CGPointMake(0,0);
        // [_scrollViewController setContentOffset:CGPointZero animated:YES];
                [self performSelector:@selector(adjust2) withObject:nil afterDelay:0.01f];

        currentselection = 0;
    }
    
    
    [self highlighttext];

 
}



-(void)highlighttext
{
    NSLog(@"%d",currentselection);
    UIButton *tmpButton;
    if(currentselection == 0)
    {
        //newsfeed
        tmpButton = (UIButton *)[self.view viewWithTag:3];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [UIView animateWithDuration:1.0 animations:^{
                  tmpButton.titleLabel.font = [UIFont systemFontOfSize:20];
        }];
        
        
        tmpButton = (UIButton *)[self.view viewWithTag:4];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        tmpButton = (UIButton *)[self.view viewWithTag:5];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        webview.hidden = NO;
        table_view.hidden = NO;
        
        NSString *urlAddress = @"http://www.codegerms.com";
        
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        //Load the request in the UIWebView.
        [webview loadRequest:requestObj];
    }
    

    if(currentselection == 1)
    {
        //pc-gov
        tmpButton = (UIButton *)[self.view viewWithTag:4];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [UIView animateWithDuration:1.0 animations:^{
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:20];
        }];
        
        
        tmpButton = (UIButton *)[self.view viewWithTag:3];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        
        tmpButton = (UIButton *)[self.view viewWithTag:5];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        
        webview.hidden = NO;
        table_view.hidden = YES;
        NSString *urlAddress = @"http://www.codegerms.com";
        
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        //Load the request in the UIWebView.
        [webview loadRequest:requestObj];
    }
    
    
    
    
    if(currentselection == 2)
    {
        tmpButton = (UIButton *)[self.view viewWithTag:5];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [UIView animateWithDuration:1.0 animations:^{
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:20];
        }];
        
        
        tmpButton = (UIButton *)[self.view viewWithTag:4];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        tmpButton = (UIButton *)[self.view viewWithTag:3];
        tmpButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        NSString *urlAddress = @"http://www.codegerms.com";
        
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        //Load the request in the UIWebView.
        [webview loadRequest:requestObj];
    }

}

- (void)buttonAction:(id)sender {
	//[tempob setSelected:NO];
	//[sender setSelected:YES];
    
    if ([sender tag] == 2) {
        //newest
        [_scrollViewController setContentOffset:CGPointMake(3*106,0) animated:YES];
        currentselection = 2;
	}
	if ([sender tag] == 3) {
		//[sender setBackgroundImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/ButtonSel.png", [[NSBundle mainBundle] resourcePath]]] forState:UIControlStateSelected];
        [_scrollViewController setContentOffset:CGPointMake(1*106,0) animated:YES];
        currentselection = 0;

		//tempob = sender;
	}
    if ([sender tag] == 4) {
        //rising
        [_scrollViewController setContentOffset:CGPointMake(2*106,0) animated:YES];
        currentselection = 1;
	}
    if ([sender tag] == 5) {
        //newest
        [_scrollViewController setContentOffset:CGPointMake(3*106,0) animated:YES];
        currentselection = 2;
	}
    if ([sender tag] == 6) {
      
        [_scrollViewController setContentOffset:CGPointMake(1*106,0) animated:YES];
        currentselection = 0;

	}
    
    
    [self highlighttext];
    
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    int path = indexPath.row+1;
    
    
    
UIImage *SampleImage =[[UIImage alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%d.jpg",path]];
    
    float width = SampleImage.size.width;
    float height = SampleImage.size.height;
    float ratio = 320/width;
    float newHeight = ratio*height;
    
    
    
    return newHeight+100+20+25;
}




- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"ContentsItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContentsItemCell" owner:self options:nil];
        
        cell = (UITableViewCell *)[nib objectAtIndex:0];
    }
    
    ContentsItemCell *mycell = (ContentsItemCell *)cell;
    
    COntentUploaderName  = @"Dummy User";
   // ProfilePic = [current objectForKey:@"profile_pic"];
    statusFollow = @"1";
    userId = @"Dummy Id";
    
    
    [mycell.text setText:@"Ministry of Planning"];
    [mycell.VoteNumber setText:@"1"];
    [mycell.text setLineBreakMode:NSLineBreakByWordWrapping];
    [mycell.username setTitle:COntentUploaderName forState:UIControlStateNormal];
    mycell.TimeStemp.text = @"Some Time Ago";
    
    int path = indexPath.row+1;
    UIImage *SampleImage =[[UIImage alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%d.jpg",path]];
    
    [mycell.imageView setImage:SampleImage];
  //  [mycell.imageView setImageWithURLSSS:[NSURL URLWithString:[NSString stringWithFormat:@"%@/images/%@",ASSETSURL, [current objectForKey:@"content_thumbnail"]]] placeholderImage:Nil];
    
    
    
    NSString* SuccessStatus = [NSString stringWithFormat:@"%@",[current objectForKey:@"status"]];
    if([SuccessStatus  isEqual: @"<null>"])
    {
        SuccessStatus = @"0";
    }
    if([SuccessStatus integerValue] >= 1)
    {
        [mycell.Button3 setImage:[UIImage imageNamed:@"fb_UpVoteTap.png"] forState:UIControlStateNormal];
        
    }
    else if([SuccessStatus integerValue] <= -1)
    {
        [mycell.Button2 setImage:[UIImage imageNamed:@"fb_DownVoteTap.png"] forState:UIControlStateNormal];
    }
    else
    {
        [mycell.Button3 setImage:[UIImage imageNamed:@"fb_Up.png"] forState:UIControlStateNormal];
        [mycell.Button2 setImage:[UIImage imageNamed:@"fb_Down.png"] forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    mycell.Viewforlabels.hidden = YES;
    mycell.Line.hidden = YES;
    mycell.commentnumber.hidden = NO;
    mycell.commentimage.hidden = YES;
    mycell.typeimage.hidden = YES;
    mycell.username.hidden = NO;
    mycell.TimeStemp.hidden = NO;
    float width = [[current objectForKey:@"picture_width"] floatValue];
    float height = [[current objectForKey:@"picture_height"] floatValue];
    float ratio = 320/width;
    float newHeight = ratio*height;
    
    mycell.containingBox.frame = CGRectMake(mycell.containingBox.frame.origin.x, mycell.containingBox.frame.origin.y,320,newHeight+100+20+25);
    mycell.containingBox.backgroundColor = UIColorFromRGB(0xe4e2e3);
    //[mycell.imageView sizeToFit];
    
    CGFloat test = mycell.containingBox.frame.size.width;
    
    mycell.imageView.frame = CGRectMake(mycell.containingBox.frame.origin.x, mycell.containingBox.frame.origin.y+70+20, mycell.containingBox.frame.size.width, newHeight);
    
    
    mycell.Back.frame = CGRectMake(mycell.containingBox.frame.origin.x, mycell.containingBox.frame.origin.y+15,320,newHeight+100+30+20-15-15);
    //  mycell.Back.backgroundColor = [UIColor brownColor];
    
    
  //  [mycell.UserProfilePicture setImageWithURLSSS:[NSURL URLWithString:[NSString stringWithFormat:@"%@/profilepic/%@",ASSETSURL,ProfilePic]] placeholderImage:Nil];
    
    [mycell.UserProfilePicture.layer setMasksToBounds:YES];
    [mycell.UserProfilePicture.layer setCornerRadius:26];
    
    mycell.UserProfilePicture.frame = CGRectMake(mycell.Back.frame.origin.x+15, mycell.Back.frame.origin.y+10,mycell.UserProfilePicture.frame.size.width,mycell.UserProfilePicture.frame.size.height);
    
    
    
    mycell.username.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
    
    mycell.username.frame =CGRectMake(mycell.Back.frame.origin.x+15+75, mycell.Back.frame.origin.y+10,mycell.username.frame.size.width+100,mycell.username.frame.size.height)
    
    ;
    mycell.description.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    mycell.description.frame = CGRectMake(mycell.username.frame.origin.x, mycell.username.frame.origin.y+15,mycell.description.frame.size.width+40,mycell.username.frame.size.height);
    mycell.description.textColor = UIColorFromRGB(0x646464);
    mycell.description.numberOfLines = 1;
    
    UILabel* timestampcopy = [[UILabel alloc]initWithFrame:CGRectMake(mycell.username.frame.origin.x, mycell.username.frame.origin.y+30,mycell.description.frame.size.width+100,mycell.username.frame.size.height)];
    timestampcopy.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    [timestampcopy setText:mycell.TimeStemp.text];
    timestampcopy.textColor = [UIColor darkTextColor];
    [mycell addSubview:timestampcopy];
    
    
    mycell.Button1.frame = CGRectMake (mycell.imageView.frame.origin.x, mycell.imageView.frame.origin.y+(mycell.imageView.frame.size.height),mycell.Button1.frame.size.width,mycell.Button1.frame.size.height);
    
    
    mycell.Button2.frame = CGRectMake (mycell.imageView.frame.origin.x+79, mycell.imageView.frame.origin.y+(mycell.imageView.frame.size.height),mycell.Button2.frame.size.width,mycell.Button2.frame.size.height);
    
    mycell.Button3.frame = CGRectMake (mycell.imageView.frame.origin.x+79+81, mycell.imageView.frame.origin.y+(mycell.imageView.frame.size.height),mycell.Button3.frame.size.width,mycell.Button3.frame.size.height);
    
    mycell.Button4.frame = CGRectMake (mycell.imageView.frame.origin.x+79+81+81, mycell.imageView.frame.origin.y+(mycell.imageView.frame.size.height),mycell.Button4.frame.size.width,mycell.Button4.frame.size.height);
    
    UILabel* commentnumcopy = [[UILabel alloc]initWithFrame:CGRectMake (mycell.imageView.frame.origin.x+79+81+81+26, mycell.imageView.frame.origin.y+9+(mycell.imageView.frame.size.height),26,20)];
    commentnumcopy.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [commentnumcopy setText:@"1"];
    commentnumcopy.textColor = [UIColor whiteColor];
    commentnumcopy.textAlignment = UITextAlignmentCenter;
    commentnumcopy.backgroundColor = [UIColor clearColor];
    [mycell.commentnumber setText:[current objectForKey:@"commentcount"]];
    
    [mycell addSubview:commentnumcopy];

    
    return mycell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}

-(void)VoteupClickedAt:(int)position
{
  
}

-(void)VotedownClickedAt:(int)position
{
    
    
}





-(void)startingFetch{
    
}
-(void)fetchError{
    
}




-(void)fetchComplete:(NSString *)data onEndPoint:(int)endPoint wasCached:(Boolean)check
{
    
}

-(void)moveup
{
   
}

-(void)movedown
{
    
}


-(void)CommentCLicked:(int)position
{
 
    
}


@end
