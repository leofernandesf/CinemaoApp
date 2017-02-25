//
//  Layout.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class Layout: NSObject {
    
    
    static func addImageTo(navigation:UINavigationItem, image: UIImage) {
        let imageView = UIImageView(image:image)
        navigation.titleView = imageView
        
    }
    
    static func addPickerView(tf:UITextField, target: Any, action: Selector, view: UIView, vc:UIPickerViewDelegate) {
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 200))
        pickerView.backgroundColor = UIColor.white
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = vc
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: target, action: action)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        tf.inputView = pickerView
        tf.inputAccessoryView = toolBar
    }
    
    static func loadSwipe( view: UIView, ob: AnyObject?, selector:Selector ) {
        let swipeRight = UISwipeGestureRecognizer(target: ob, action: selector)
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: ob, action: selector)
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: ob, action: selector)
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: ob, action: selector)
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        view.addGestureRecognizer(swipeDown)
        
        let swipeHorario=UIRotationGestureRecognizer(target: ob, action: selector)
        view.addGestureRecognizer(swipeHorario)
    }

}
