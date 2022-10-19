//
//  UITableView+Extension.swift
//  valU-iOS-Task
//
//  Created by Ashraf Essam on 19/10/2022.
//

import UIKit

extension UITableView {
    
    func registerHeaderNib<Cell: UITableViewHeaderFooterView>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: Cell.self))
    }
    
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
}
