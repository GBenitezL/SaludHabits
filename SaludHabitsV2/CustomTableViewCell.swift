//
//  CustomTableViewCell.swift
//  SaludHabitsV2
//
//  Created by Fernanda Sánchez on 03/11/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

   
    @IBOutlet weak var tfText: UILabel!
    
    
    @IBOutlet weak var cell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 1, green: 202/255, blue: 175/255, alpha: 1)
        self.layer.cornerRadius = 5
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
