//
//  ToolViewController.swift
//  ThemSuaXoa2dulieuTableview
//
//  Created by Mac on 3/1/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class ToolViewController: UIViewController {
    var data:String?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            textField.text = data
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        data = textField.text
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
