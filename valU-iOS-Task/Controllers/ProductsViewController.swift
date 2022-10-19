//
//  ProductsViewController.swift
//  valU-iOS-Task
//
//  Created by Ashraf Essam on 19/10/2022.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        fetchProducts()
    }
    private func registerTableView(){
        tableView.registerCellNib(cellClass: ProductCell.self)
    }
    
    private func fetchProducts(){
            APIManager.shared.fetchProductsJSON { (res) in
                switch res {
                case .success(let products):
                    DispatchQueue.main.async {
                        self.products = products
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Failed to fetch products", error)
                }
            }
        }}


extension ProductsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ProductCell
        let item = products[indexPath.row]
        cell.configureCell(product: item)
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = products[indexPath.row]
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        vc.productDetails = item
        navigationController?.pushViewController(vc, animated: true)

    }
}

