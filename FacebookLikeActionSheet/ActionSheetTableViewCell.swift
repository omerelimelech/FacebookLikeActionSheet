//
//  ActionSheetTableViewCell.swift
//  FacebookLikeActionSheet
//
//  Created by Omer Elimelech on 4/28/19.
//  Copyright © 2019 Omer Elimelech. All rights reserved.
//

import UIKit

class ActionSheetTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var expLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
   
    @IBOutlet weak var button: UIButton!
    
    var item: ActionItem?{
        didSet{
            guard let item = item else {return}
            self.iconImageView.image = UIImage(named: item.iconName ?? "")
            self.titleLabel.text = item.titleString ?? ""
            self.expLabel.text = item.expString ?? ""
            button.addTarget(item.target, action: item.selector!, for: .touchUpInside)
            
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        button.removeTarget(nil, action: nil, for: .touchUpInside)
    }


    
}



