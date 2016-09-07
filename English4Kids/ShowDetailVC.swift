//
//  ShowDetailVC.swift
//  English4Kids
//
//  Created by Hoàng Minh Thành on 9/7/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ShowDetailVC: UIViewController {

    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var img: UIImageView!
    var name : String = ""
    var image : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_name.text = name
        img.image = UIImage(named: "\(image)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
