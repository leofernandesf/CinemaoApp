//
//  MenuCollectionViewCell.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 11/02/17.
//
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lbTitle: UILabel!
    
    
    let colorSelecionado = [#colorLiteral(red: 0.8081011176, green: 0.3192472458, blue: 0.1950010955, alpha: 1),#colorLiteral(red: 0.9110441804, green: 0.3621148765, blue: 0.2185979187, alpha: 1),#colorLiteral(red: 0.553648591, green: 0.1441813707, blue: 0.7200562358, alpha: 1)]
    
    var cellIndex = Int()
    var index: Int? {
        didSet {
            if index! == cellIndex {
                lbTitle.textColor = UIColor.white
                self.backgroundColor = colorSelecionado[index!]
            } else {
                lbTitle.textColor = UIColor.gray
                self.backgroundColor = UIColor.clear
            }
            
            
        }
    }
    
    
}
