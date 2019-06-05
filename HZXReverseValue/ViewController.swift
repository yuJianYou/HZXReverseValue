//
//  ViewController.swift
//  HZXReverseValue
//
//  Created by 1 on 2019/6/5.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

//@objcMembers 未所有的成员添加支持OC的代用 如果不添加这个关键字 那就需要在button的点击函数前添加@objc关键字否则会报错
@objcMembers class ViewController: UIViewController , VCDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///接受通知的方法
        NotificationCenter.default.addObserver(self, selector: #selector(noticeChangeTextAction(noti:)), name: NSNotification.Name(rawValue: "refreshFirstViewNewText"), object: nil)
        
        
        let tempLabel = UILabel()
        tempLabel.frame = CGRect(x: self.view.bounds.width/2 - 200/2, y: 100, width: 200, height: 30)
        tempLabel.backgroundColor = UIColor.green
        tempLabel.font = UIFont.systemFont(ofSize: 15)
        tempLabel.text = "这是一段文字"
        tempLabel.tag = 100
        tempLabel.textAlignment = .center
        self.view.addSubview(tempLabel)
        
        //闭包传值  因为闭包同OC中的block一样  所以我这里名字就叫block了
        let blockButton = UIButton.init(frame: CGRect(x: self.view.bounds.width/2 - 200/2, y: tempLabel.frame.origin.y + 100, width: 200, height: 30))
        blockButton.setTitle("闭包传值", for: .normal)
        blockButton.setTitleColor(UIColor.black, for: .normal)
        blockButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        blockButton.addTarget(self, action: #selector(blockReserveValue), for: .touchUpInside)
        self.view.addSubview(blockButton)
        //通知传值
        let noticeButton = UIButton.init(frame: CGRect(x: self.view.bounds.width/2 - 200/2, y: blockButton.frame.origin.y + 60, width: 200, height: 30))
        noticeButton.setTitle("通知传值", for: .normal)
        noticeButton.setTitleColor(UIColor.black, for: .normal)
        noticeButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        noticeButton.addTarget(self, action: #selector(noticeAction), for: .touchUpInside)
        self.view.addSubview(noticeButton)
        //代理传值
        let delegateButton = UIButton.init(frame: CGRect(x: self.view.bounds.width/2 - 200/2, y: noticeButton.frame.origin.y + 60, width: 200, height: 30))
        delegateButton.setTitle("代理传值", for: .normal)
        delegateButton.setTitleColor(UIColor.black, for: .normal)
        delegateButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        delegateButton.addTarget(self, action: #selector(delegateAction), for: .touchUpInside)
        self.view.addSubview(delegateButton)
    }
    
    
    
    //MARK: ========== 闭包传值
    ///闭包点击事件
    func blockReserveValue(){
        let newLabel: UILabel = self.view.viewWithTag(100) as! UILabel
        let blockVC = BlockViewController.init()
        
        blockVC.labelText = newLabel.text
        blockVC.changeBlock = { newStr in
            newLabel.text = newStr
        }
        self.present(blockVC, animated: true, completion: nil)
        
    }
    
    
    
    
    
    //MARK: ========== 通知传值
    //通知按钮事件
    func noticeAction() {
        
        let newLabel: UILabel = self.view.viewWithTag(100) as! UILabel
        
        let notificationVC = NotificationViewController.init()
        notificationVC.labelText = newLabel.text
        self.present(notificationVC, animated: true, completion: nil)
        
    }
    func noticeChangeTextAction(noti: Notification){
        let newLabel: UILabel = self.view.viewWithTag(100) as! UILabel
        
        guard let tempDic = noti.userInfo else {
            return
        }
        
        newLabel.text = tempDic["newText"] as? String
        
    }
    //移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    
    
    //MARK: ========== 代理传值
    //代理按钮事件
    func delegateAction(){
        
        let newLabel: UILabel = self.view.viewWithTag(100) as! UILabel
        
        let delegateVC = DelegateViewController.init()
        delegateVC.labelText = newLabel.text
        delegateVC.delegate = self
        self.present(delegateVC, animated: true, completion: nil)
        
    }
    func delegateReverseValue(newText: String?) {
        let newLabel: UILabel = self.view.viewWithTag(100) as! UILabel
        
        newLabel.text = newText!
    }
    

}

