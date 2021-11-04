//
//  CustomTableViewCell.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

   
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet weak var cell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
            }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
