def get_variables(arg=None):
    D1 = {'platformName' : 'Android',
                 'platformVersion': "6.0.1",
                 'deviceName': "125cb6a6",
                 'ENV_DEVICE_TYPE':"ANDROID_PHONE",
                 'ENV_DEVICE_OS':'ANDROID'}
    
    D2 = {'platformName' : 'iOS',
                 'platformVersion': "13.0",
                 'deviceName': "iPhone 11 Pro Max",
                 'ENV_DEVICE_TYPE':"IOS_PHONE",
                 'ENV_DEVICE_OS':'IOS'}
    
    if arg == "125cb6a6" :
        return D1
    if arg == "iPhone XR" :
        return D2
    else:
        return D1
    
