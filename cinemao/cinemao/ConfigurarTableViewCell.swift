//
//  ConfigurarTableViewCell.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 12/02/17.
//
//

import UIKit

class ConfigurarTableViewCell: UITableViewCell {
    @IBOutlet weak var ivCheckBox: UIImageView!
    @IBOutlet weak var lbName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
