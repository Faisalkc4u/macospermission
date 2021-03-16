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
        case "getCameraPermission":
            
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
        case "requestCameraPermission":
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() ) {
                
                AVCaptureDevice.requestAccess(for: AVMediaType.audio) { granted in
                    if granted {
                    } else {
                    }
                }
            }
                    case "getVideoPermission":
            
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
        case "requestVideoPermission":
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() ) {
                
                AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
                    if granted {
                    } else {
                    }
                }
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
