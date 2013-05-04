//
//  ViewController.m
//  twitter-framework-test
//
//  Created by apple on 5/4/56 BE.
//  Copyright (c) 2556 apple. All rights reserved.
//

#import "ViewController.h"
#import <Twitter/Twitter.h>
#import <Twitter/TWTweetComposeViewController.h>
#import <twitter/TWRequest.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize messageInput = _messageInput;
@synthesize imageView = _imageView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _messageInput.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)sendPost:(NSString *)messageText :(NSString * )socialTeype
{
    
    //NSLog(@"tweet");
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:socialTeype];
    
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        [fbController addImage:_imageForPost];
        [fbController setInitialText:messageText];
        //[fbController addURL:[NSURL URLWithString:@"http://soulwithmobiletechnology.blogspot.com/"]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }

    
}

- (IBAction)fPost:(id)sender {
    [self sendPost:_messageInput.text :SLServiceTypeFacebook];

}

- (IBAction)openPicker:(id)sender {
    UIImagePickerController *picker;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        NSLog(@"openPicker");
      [self presentViewController:picker animated:YES completion:nil];    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    _imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    _imageForPost =  [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //NSLog( @"Image name:%@", [_imageView.image accessibilityValue ] );
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];

    //NSLog(@"imagePickerControllerDidCancel");
}
- (IBAction)tweet:(id)sender {
    
    [self sendPost:_messageInput.text :SLServiceTypeTwitter];
    
 }
- (BOOL) textView: (UITextView*) textView
shouldChangeTextInRange: (NSRange) range
  replacementText: (NSString*) text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    //[textView resignFirstResponder];
    //NSLog(@"resignFirstResponder");
    return YES;
}
@end
