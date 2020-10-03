//
//  BaseViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/25.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class BaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func changeTabIcon(tab:Int){
        if let tabItems = self.tabBarController?.tabBar.items {
           switch tab {
           case 0:
                tabItems[tab].selectedImage = UIImage(named: "house_fill")
           case 1:
               tabItems[tab].selectedImage = UIImage(named: "folder_fill")
           default:
               var _ = "something wrong"
           }
        }
    }


}
