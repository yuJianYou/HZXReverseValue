//
//  DelegateViewController.swift
//  HZXReverseValue
//
//  Created by 1 on 2019/6/5.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit


///设置代理
protocol VCDelegate {
    ///代理方法
    func delegateReverseValue(newText:String?)
}

class DelegateViewController: UIViewController {

    ///上个界面传过来的值
    var labelText: String?
    let textField = UITextField()
    var delegate: VCDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        textField.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
        textField.placeholder = "请输入内容"
        textField.textColor = UIColor.black
        textField.text = labelText ?? ""
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.backgroundColor = UIColor.red
        self.view.addSubview(textField)
        
        
        let confirmButton = UIButton.init(frame: CGRect(x: self.view.bounds.width/2 - 100/2, y: 220, width: 100, height: 30))
        confirmButton.setTitle("确定", for: .normal)
        confirmButton.setTitleColor(UIColor.black, for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        confirmButton.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        self.view.addSubview(confirmButton)
    }
    
    @objc func confirmAction() {
        ///判断是否有遵循的代理
        guard let customDelegate = delegate else {
            return
        }
        customDelegate.delegateReverseValue(newText: textField.text)
        
        
        
        self.dismiss(animated: true, completion: nil)
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
