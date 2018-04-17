//
//  ViewController.swift
//  MQSwitchView
//
//  Created by 120v on 2018/4/17.
//  Copyright © 2018年 MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let zxSwith = ZXSwitch.init(frame: CGRect.init(x: 100, y: 300, width: 140, height: 40));
        zxSwith.delegate = self;
        self.view.addSubview(zxSwith);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: ZXSwitchDelegate {
    func didZXSwitchAction(sender: UIButton) {
        print(sender.tag)
    }
}

