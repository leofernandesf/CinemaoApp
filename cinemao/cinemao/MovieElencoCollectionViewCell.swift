//
//  MovieElencoCollectionViewCell.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 12/02/17.
//
//

import UIKit

class MovieElencoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivThumb: UIImageView!
    
    var person: Elenco? {
        didSet {
            self.ivThumb.image = person?.image
            self.lbName.text = person?.nome
        }
    }
}
