//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Chance Payne on 9/21/19.
//  Copyright © 2019 Chance Payne. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func themeSwitchChanged(_ sender: UISwitch) {
        themeHelper?.setThemePreference(to: sender.isOn ? ThemeHelper.Themes.DARK : ThemeHelper.Themes.LIGHT)
        dismiss(animated: true, completion: nil)
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
