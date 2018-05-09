//
//  WBMoviePickerViewController.swift
//  JSTest-first
//
//  Created by wenbin on 2018/5/9.
//  Copyright © 2018年 WeDoMusic. All rights reserved.
//

import UIKit

class WBMoviePickerViewController: UIViewController {

    var min : Float = 0.0
    var max : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: 300, height: 50))
        label.text = "我是 WBMoviePickerViewController"
        self.view.addSubview(label)
        
        let label1 = UILabel.init(frame: CGRect.init(x: 10, y: 110, width: 300, height: 50))
        label1.text = "min->\(min) max->\(max)"
        self.view.addSubview(label1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
