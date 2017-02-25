//
//  extension.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    
    var startPoint : CGPoint {
        get { return points.startPoint }
    }
    
    var endPoint : CGPoint {
        get { return points.endPoint }
    }
    
    var points : GradientPoints {
        get {
            switch(self) {
            case .topRightBottomLeft:
                return (CGPoint.init(x: 0.0,y: 1.0), CGPoint.init(x: 1.0,y: 0.0))
            case .topLeftBottomRight:
                return (CGPoint.init(x: 0.0,y: 0.0), CGPoint.init(x: 1,y: 1))
            case .horizontal:
                return (CGPoint.init(x: 0.0,y: 0.5), CGPoint.init(x: 1.0,y: 0.5))
            case .vertical:
                return (CGPoint.init(x: 0.0,y: 0.0), CGPoint.init(x: 0.0,y: 1.0))
            }
        }
    }
}

extension UIColor {
    
    var backGround: UIColor {
        return HexToColor(hexString: "#151D23")
    }
    
    var verde: UIColor {
        return HexToColor(hexString: "#4F9E60")
    }
    
    
    
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    class func imageWithColor(color: UIColor, size: CGSize = CGSize(width: 60, height: 60)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height);        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return image!;
    }
}

extension UINavigationBar
{
    var barTintNoColor: Bool
        {
        get
        {
            return self.barTintNoColor
        }
        set(value)
        {
            if value
            {
                self.setBackgroundImage(UIImage(), for: .default)
                self.shadowImage = UIImage()
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    func checkInternet() -> Bool {
//        if currentReachabilityStatus == .reachableViaWiFi || currentReachabilityStatus == .reachableViaWWAN {
//            return true
//        } else {
//            showAlerView(title: "Sem Acesso à Internet", menssagem: "Por favor, verifique sua conexão com a internet e tente novamente.")
//            return false
//        }
//    }
    
    func showAlerView(title: String, menssagem: String?) {
        let alert = UIAlertController(title: title, message: menssagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIView {
    func showAnimation() {
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0.0
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.alpha = 0.0
        }, completion: { (finished: Bool) in
            if finished {
                self.removeFromSuperview()
            }
        })
    }
    
    func applyGradient(withColours colours: [UIColor], locations: [NSNumber]? = nil) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(withColours colours: [UIColor], gradientOrientation orientation: GradientOrientation) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }
}
