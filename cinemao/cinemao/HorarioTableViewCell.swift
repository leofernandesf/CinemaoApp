//
//  HorarioTableViewCell.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 13/02/17.
//
//

import UIKit

class HorarioTableViewCell: UITableViewCell {

    @IBOutlet weak var viewDistancia: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.viewDistancia.applyGradient(withColours: [#colorLiteral(red: 0.2, green: 0.768627451, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.2117647059, green: 0.07450980392, blue: 0.4470588235, alpha: 1)], gradientOrientation: .horizontal)
        self.viewDistancia.layer.cornerRadius = 16
        self.viewDistancia.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
