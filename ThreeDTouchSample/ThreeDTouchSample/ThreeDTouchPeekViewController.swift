//
//  ThreeDTouchPeekViewController.swift
//  ThreeDTouchSample
//
//  Created by 藤本譲 on 2017/05/07.
//  Copyright © 2017年 jofujimoto. All rights reserved.
//

import UIKit

class ThreeDTouchPeekViewController: UIViewController
{
    var paramTitle: String?
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lblTitle.text = paramTitle
    }
    
    // 3D Touch メニュー
    override var previewActionItems: [UIPreviewActionItem]
    {
        let menu1 = UIPreviewAction(title: "メニュー１", style: .default) { (_, _) in
            print("メニュー１")
        }
        
        let menu2 = UIPreviewAction(title: "メニュー２", style: .default) { (_, _) in
            print("メニュー２")
        }
        let menu3 = UIPreviewAction(title: "メニュー３", style: .default) { (_, _) in
            print("メニュー３")
        }
        
        return [menu1, menu2, menu3]
    }
    
    @IBAction func tapCloseBtn(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
