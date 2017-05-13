//
//  MainViewController.swift
//  ThreeDTouchSample
//
//  Created by 藤本譲 on 2017/05/07.
//  Copyright © 2017年 jofujimoto. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    @IBOutlet weak var tblBase: UITableView!
    
    fileprivate var titleList: Array<String> = ["タイトル１", "タイトル２", "タイトル３", "タイトル４", "タイトル５", "タイトル６", "タイトル７", "タイトル８", "タイトル９", "タイトル１０"]
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: CustomTableCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell")! as! CustomTableCell
        
        cell.setData(title: titleList[indexPath.row])
        
        // 3D Touchを有効にする
        if self.traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: cell, sourceView: cell.collectionView)
        }
        
        return cell
    }

}

