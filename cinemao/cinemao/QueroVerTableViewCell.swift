//
//  QueroVerTableViewCell.swift
//  cinemao
//
//  Created by leonardo fernandes farias on 12/02/17.
//
//

import UIKit
import MGSwipeTableCell

class QueroVerTableViewCell: MGSwipeTableCell {

    @IBOutlet weak var ivThumb: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
