//
//  ProductDetailsViewController.swift
//  valU-iOS-Task
//
//  Created by Ashraf Essam on 19/10/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    @IBOutlet weak var productImageView: CustomImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productRateLabel: UILabel!
    
    var productDetails:  Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInputs()
    }
    
    private func setupInputs(){
        guard let image = productDetails?.image else { return }
        productImageView.loadImageUsingUrlString(urlString: image)
        productTitle.text = productDetails?.title
        productDescription.text = productDetails?.productDescription
        productPriceLabel.text = "Price: \(productDetails?.price ?? 0) EGP"
        productRateLabel.text = "\(productDetails?.rating.rate ?? 0) ⭐️"
    }
}
