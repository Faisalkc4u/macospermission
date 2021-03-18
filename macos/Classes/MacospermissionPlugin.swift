import Cocoa
import FlutterMacOS
import AVFoundation
public class MacospermissionPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "macospermission", binaryMessenger: registrar.messenger)
        let instance = MacospermissionPlugin()
        
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        case "getAudioPermission":
            
            if #available(OSX 10.14, *) {
                let cameraMediaType = AVMediaType.audio
                
                
                let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
                switch cameraAuthorizationStatus {
                case .denied: result("denied")
                    break
                case .authorized: result("authorized")
                    break
                case .restricted: result("restricted")
                    break
                case .notDetermined:
                    result("notDetermined")
                    break
                @unknown default:
                    result("check")
                    
                }
                
            }else
            {
                result("CHECK AGAIN")
            }
        case "requestAudioPermission":
            
            requestPermission(type:AVMediaType.audio)
        case "getCameraPermission":
            
            if #available(OSX 10.14, *) {
                let cameraMediaType = AVMediaType.video
                
                
                let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
                switch cameraAuthorizationStatus {
                case .denied: result("denied")
                    break
                case .authorized: result("authorized")
                    break
                case .restricted: result("restricted")
                    break
                case .notDetermined:
                    result("notDetermined")
                    break
                @unknown default:
                    result("check")
                    
                }
                
            }else
            {
                result("CHECK AGAIN")
            }
        case "requestCameraPermission":
            requestPermission(type:AVMediaType.video)
            case "availableDevices":
            result(avaialableDevices())
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    func requestPermission(type:AVMediaType)
    {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() ) {
            if #available(OSX 10.14, *)
            {
                
                AVCaptureDevice.requestAccess(for: type) { granted in
                if granted {
                } else {
                }
            }
            }
        }
    }
    func avaialableDevices()->Array<Dictionary<String,String>> {
        var result=[[String:String]]()

        print(AVCaptureDevice.default(for:.audio));


        let devices = AVCaptureDevice.devices()
                        for device in devices {
                             var availableList=Dictionary<String,String>()
                            availableList["Description"]=device.description
                            availableList["UniqueID"]=device.uniqueID
                            availableList["ModelID"]=device.modelID
                            availableList["LocalName"]=device.localizedName
                            availableList["Manufacturer"]=device.manufacturer
                            result.append(availableList)
                            // Camera object found and assign it to captureDevice
                            // if ((device as AnyObject).hasMediaType(AVMediaTypeVideo)) {
  //                             print(device.DeviceType)
//deviceType(data:device)
                            // }
                        }
                        return result;
                        
    }
    func deviceType(data:AVCaptureDevice)->String{
   // let type="unknown"
    print(type(of:data))
    return "type";
    }
}
