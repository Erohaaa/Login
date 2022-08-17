//
//  firstViewTabBar.swift
//  HomeWork4
//
//  Created by oleg on 13.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: logIn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = ("\(user.name)!")
    }
    

    

}
