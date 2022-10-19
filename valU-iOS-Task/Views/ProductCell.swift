//
//  ProductCell.swift
//  valU-iOS-Task
//
//  Created by Ashraf Essam on 19/10/2022.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImageView: CustomImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(product: Product){
        productImageView.loadImageUsingUrlString(urlString: product.image)
        productTitle.text = product.title
        priceLabel.text = "Price: \(product.price) EGP"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
