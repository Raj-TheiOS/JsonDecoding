//
//  ItemsTableViewCell.swift
//  SmartkargoTask
//
//  Created by Arjun  on 24/02/21.
//

import UIKit

class ItemsTableViewCell: UITableViewCell , ReusableCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var object: Item? {
        didSet {
            print(object?.name)
            self.nameLabel.text = object?.name
        }
    }
}


import Foundation
import UIKit

protocol ReusableCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension ReusableCell where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension ReusableCell where Self: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
