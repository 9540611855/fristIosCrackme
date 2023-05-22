#import <Foundation/NSObjCRuntime.h>

%hook ViewController
- (NSString*) md5Encrypt:(NSString *)txt{
	NSString* rtn=%orig;
	NSLog(@"[tweek]>txt:%@,rtn:%@",txt,rtn);
	return @"123456";
}


%end

