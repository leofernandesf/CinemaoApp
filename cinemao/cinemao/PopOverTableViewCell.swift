//
//  PopOverTableViewCell.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 22/03/17.
//
//

import UIKit

class PopOverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbCidade: UILabel!
    
    var cidade: String! {
        didSet {
            self.lbCidade.text = cidade
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
