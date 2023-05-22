//
//  ViewController.m
//  test1
//
//  Created by 皮皮虾 on 2023/5/13.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passwd;
@property (weak, nonatomic) IBOutlet UIButton *blogin;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)textFieldDoneEditing:(id)sender
{
[sender resignFirstResponder];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{

[self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的

}

- (NSString*) md5Encrypt:(NSString *)txt{
    
    const char *cStr = [txt UTF8String];
    unsigned char digest[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    
    NSLog(@"[md5]>> %@ -> %@", txt, output);
    return output;
}

- (IBAction)login:(id)sender {
    NSString* secret = [self md5Encrypt:@"pipixia"];

    if ([self.userName.text isEqualToString:@"pipixia"] && [self.passwd.text isEqualToString:secret]) {
        NSLog(@"name:%@ pass:%@",self.userName.text,self.passwd.text);

        [self performSegueWithIdentifier:@"loginSuccess" sender:self];

        
    }
}

@end
