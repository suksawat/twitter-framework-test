//
//  ViewController.h
//  twitter-framework-test
//
//  Created by apple on 5/4/56 BE.
//  Copyright (c) 2556 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>
{
@private
    UIImage *_imageForPost;

}

@property (strong, nonatomic) IBOutlet UITextView *messageInput;
- (IBAction)tweet:(id)sender;
- (void)sendPost:(NSString *)messageText :(NSString * )socialTeype;
- (IBAction)fPost:(id)sender;
- (IBAction)openPicker:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
