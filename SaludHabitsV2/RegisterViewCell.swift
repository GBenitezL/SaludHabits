//
//  RegisterViewCell.swift
//  SaludHabitsV2
//
//  Created by David Garcia on 29/11/21.
//

import UIKit

class RegisterViewCell: UITableViewCell {

    @IBOutlet weak var lbText: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    @IBOutlet weak var imgRegistro: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
