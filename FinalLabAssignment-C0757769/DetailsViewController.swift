//
//  DetailsViewController.swift
//  FinalLabAssignment-C0757769
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    
    @IBOutlet weak var idLabel: UILabel!
    var product = Item()
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "\(product.price)"
        titleLabel.text  = product.name
        descLabel.text = product.description
        idLabel.text = product.id
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
