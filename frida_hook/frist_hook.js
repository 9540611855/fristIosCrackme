const NSString = ObjC.classes.NSString;
const ViewController = ObjC.classes.ViewController;

Interceptor.attach(ViewController['- md5Encrypt:'].implementation,{

		onEnter: function(args)
		{
            console.log('argv ', ObjC.Object(args[2]));
		},
		onLeave: function(retval)
		{
            var str ="123456";
            var newstring = ObjC.classes.NSString.stringWithString_(str);
            retval.replace(newstring)
		}
	}
);
