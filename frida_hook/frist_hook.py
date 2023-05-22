from __future__ import print_function
import frida
import sys

#进程名
process_name = 'test1'
#导入的js脚本
js_file_name = 'frist_hook.js'


# 自定义回调函数

def on_message(message, data):
    if message['type'] == 'send':
        print(message['payload'])
    elif message['type'] == 'error':
        print(message['stack'])
        
        
# hook逻辑脚本
def get_js_code():
    js_file = open(js_file_name)  # type: BinaryIO
    return js_file.read()


#start here
if __name__ == '__main__':


	process_id   =  0
	device = frida.get_usb_device()
  
	while True:
		try:
			process1 = device.get_process(process_name)
			process_id = process1.pid
      
      
			print(process_id)
			break
		except:
			pass
  
  
	session = device.attach(process_id)
	script = session.create_script(get_js_code())
	script.on('message', on_message)    
	script.load()
	sys.stdin.read()
