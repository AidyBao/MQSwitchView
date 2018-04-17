//
//  ZXSwitch.swift
//  Test
//
//  Created by 120v on 2018/4/16.
//  Copyright © 2018年 MQ. All rights reserved.
//

import UIKit

protocol ZXSwitchDelegate {
    func didZXSwitchAction(sender:UIButton)
}

class ZXSwitch: UIView {
    
    var delegate:ZXSwitchDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setUI(){
        
        //
        self.backgroundColor = UIColor.init(red: 51/255.0, green: 123/255.0, blue: 250/255.0, alpha: 1.0)
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.cornerRadius = self.frame.size.height/2;
        self.clipsToBounds  = true;
        self.isUserInteractionEnabled = true;
        
        //
        let backView: UIView = UIView.init(frame: self.bounds)
        backView.backgroundColor = UIColor.white
        self.addSubview(backView)
        
        //
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width*0.5, height: self.frame.size.height);
        leftBtn.isSelected = true;
        leftBtn.addTarget(self, action:#selector(changeSwitchAction(sender:)), for: .touchUpInside);
        leftBtn.tag = 55501
        addSubview(leftBtn);
        
        rightBtn.frame = CGRect.init(x: leftBtn.frame.maxX, y: 0, width: self.frame.size.width*0.5, height: self.frame.size.height);
        rightBtn.addTarget(self, action:#selector(changeSwitchAction(sender:)), for: .touchUpInside);
        rightBtn.tag = 55502
        addSubview(rightBtn);
        
        //
        backView.mask = moveView;
        moveView.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width*0.5, height: self.frame.size.height)
        moveView.backgroundColor = UIColor.white;
        moveView.layer.cornerRadius = self.frame.size.height*0.5;
        moveView.layer.masksToBounds = true;
    }
    
    //MAKR: - Action
    @objc private func changeSwitchAction(sender: UIButton){
        sender.isSelected = false
        switch sender.tag {
        case 55501:
            sender.isSelected = true
        case 55502:
            sender.isSelected = true
        default:
            break
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.moveView.frame.origin.x = sender.frame.origin.x;
        }) { (success) in
            self.layoutIfNeeded()
        }
        
        if delegate != nil{
            delegate?.didZXSwitchAction(sender: sender)
        }
    }
    
    //MARK: - Lazy
    lazy var leftBtn: UIButton = {
        let btn: UIButton = UIButton.init()
        btn.setTitle("活动", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal);
        btn.setTitleColor(UIColor.blue, for: .selected);
        return btn
    }()
    
    lazy var rightBtn: UIButton = {
        let btn: UIButton = UIButton.init()
        btn.setTitle("通知", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal);
        btn.setTitleColor(UIColor.blue, for: .selected);
        return btn
    }()
    
    lazy var moveView: UIView = {
        let view: UIView = UIView.init()
        return view
    }()
}
