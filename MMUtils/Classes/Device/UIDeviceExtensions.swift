//  UIDeviceExtensions.swift
//  MMUtils
//  Created by Maximus McCann. MIT

import UIKit

public extension UIDevice {
  public static let is32Bit = MemoryLayout<Int32>.size == MemoryLayout<Int>.size
  
  public static var isSimulator: Bool {
    return UIDevice().modelName == "Simulator"
  }
  
  public static var isIpad: Bool {
    switch UIDevice.current.userInterfaceIdiom {
    case .phone: return false
    case .tv: return false
    case .carPlay: return false
    case .pad: return true
    case .unspecified: return UIDevice.current.modelName.lowercased().hasPrefix("ipad")
    }
  }
  
  public struct ScreenSize {
    //  https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions
    
    /// 320 x 480
    public static let iPhone4 = CGSize(width: 320, height: 480)
    /// 320 x 568
    public static let iPhone5 = CGSize(width: 320, height: 568)
    /// 375 x 667
    public static let iPhone6 = CGSize(width: 375, height: 667)
    /// 414 x 736
    public static let iPhone6Plus = CGSize(width: 414, height: 736)
    /// 375 x 812
    public static let iPhoneX = CGSize(width: 375, height: 812)
    /// 414 x 896
    public static let iPhoneXR = CGSize(width: 414, height: 896)
    /// 414 x 896
    public static let iPhoneXSMax = CGSize(width: 414, height: 896)
    
    static let size = UIScreen.main.bounds.size
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
    
    public static let isIphone4OrLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength <= iPhone4.height
    public static let isIphone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == iPhone5.height
    public static let isIphone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == iPhone6.height
    public static let isIphone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == iPhone6Plus.height
    public static let isIphoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == iPhoneX.height
    public static let isIphoneXSMax = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == iPhoneXSMax.height
  }
  
  @nonobjc public final var modelName: String {
    let identifier = modelIdentifier
    
    // https://www.theiphonewiki.com/wiki/Models
    
    switch identifier {
    case "iPod1,1":                                         return "iPod Touch 1"
    case "iPod2,1":                                         return "iPod Touch 2G"
    case "iPod3,1":                                         return "iPod Touch 3G"
    case "iPod4,1":                                         return "iPod Touch 4G"
    case "iPod5,1":                                         return "iPod Touch 5G"
    case "iPod7,1":                                         return "iPod Touch 6G"
    case "iPhone1,1":                                       return "iPhone 1"
    case "iPhone1,2":                                       return "iPhone 3G"
    case "iPhone2,1":                                       return "iPhone 3GS"
    case "iPhone3,1", "iPhone3,2", "iPhone3,3":             return "iPhone 4"
    case "iPhone4,1":                                       return "iPhone 4s"
    case "iPhone5,1", "iPhone5,2":                          return "iPhone 5"
    case "iPhone5,3", "iPhone5,4":                          return "iPhone 5c"
    case "iPhone6,1", "iPhone6,2":                          return "iPhone 5s"
    case "iPhone7,2":                                       return "iPhone 6"
    case "iPhone7,1":                                       return "iPhone 6 Plus"
    case "iPhone8,1":                                       return "iPhone 6s"
    case "iPhone8,2":                                       return "iPhone 6s Plus"
    case "iPhone8,4":                                       return "iPhone SE"
    case "iPhone9,1", "iPhone9,3":                          return "iPhone 7"
    case "iPhone9,2", "iPhone9,4":                          return "iPhone 7 Plus"
    case "iPhone10,1", "iPhone10,4":                        return "iPhone 8"
    case "iPhone10,2", "iPhone10,5":                        return "iPhone 8 Plus"
    case "iPhone10,3", "iPhone10,6":                        return "iPhone X"
    case "iPhone11,8":                                      return "iPhone XR"
    case "iPhone11,2":                                      return "iPhone XS"
    case "iPhone11,4", "iPhone11,6":                        return "iPhone XS Max"
    case "iPad1,1":                                         return "iPad 1"
    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":        return "iPad 2"
    case "iPad3,1", "iPad3,2", "iPad3,3":                   return "iPad 3"
    case "iPad3,4", "iPad3,5", "iPad3,6":                   return "iPad 4"
    case "iPad4,1", "iPad4,2", "iPad4,3":                   return "iPad Air"
    case "iPad5,3", "iPad5,4":                              return "iPad Air 2"
    case "iPad2,5", "iPad2,6", "iPad2,7":                   return "iPad Mini"
    case "iPad4,4", "iPad4,5", "iPad4,6":                   return "iPad Mini 2"
    case "iPad4,7", "iPad4,8", "iPad4,9":                   return "iPad Mini 3"
    case "iPad5,1", "iPad5,2":                              return "iPad Mini 4"
    case "iPad6,7", "iPad6,8":                              return "iPad Pro (12.9)"
    case "iPad6,3", "iPad6,4":                              return "iPad Pro (9.7)"
    case "iPad6,11", "iPad6,12":                            return "iPad 5"
    case "iPad7,1", "iPad7,2":                              return "iPad Pro (12.9) 2"
    case "iPad7,3", "iPad7,4":                              return "iPad Pro (10.5)"
    case "iPad7,5", "iPad7,6":                              return "iPad 6"
    case "AppleTV2,1":                                      return "Apple TV 2G"
    case "AppleTV3,1", "AppleTV3,2":                        return "Apple TV 3G"
    case "AppleTV5,3":                                      return "Apple TV 4G"
    case "AppleTV6,2":                                      return "Apple TV 4K"
    case "Watch1,1", "Watch1,2":                            return "Apple Watch"
    case "Watch2,6", "Watch2,7":                            return "Apple Watch S1"
    case "Watch2,3", "Watch2,4":                            return "Apple Watch S2"
    case "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4":    return "Apple Watch S3"
    case "Watch4,1", "Watch4,2", "Watch4,3", "Watch4,4":    return "Apple Watch S4"
    case "i386", "x86_64":                                  return "Simulator"
    default:                                                return identifier
    }
  }
  
  @nonobjc public final var modelIdentifier: String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    return identifier
  }
}
