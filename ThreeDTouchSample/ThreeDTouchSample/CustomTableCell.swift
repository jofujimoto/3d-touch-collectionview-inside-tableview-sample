//
//  CustomTableCell.swift
//  ThreeDTouchSample
//
//  Created by 藤本譲 on 2017/05/07.
//  Copyright © 2017年 jofujimoto. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setData(title: String)
    {
        lblTitle.text = title
    }
}

extension CustomTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: CustomCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionCell", for: indexPath) as! CustomCollectionCell
        return cell
    }
}

extension CustomTableCell: UIViewControllerPreviewingDelegate
{
    // 長押しされた時に呼ばれる
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        // 長押しされたセルのindexを取得
        guard let indexPath = collectionView.indexPathForItem(at: location) else {
            return nil
        }
        
        // 長押しされたセルを取得
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return nil
        }
        
        // Peek画面を生成
        let peek = UIStoryboard(name: "ThreeDTouchPeek", bundle: nil).instantiateViewController(withIdentifier: "ThreeDTouchPeek") as! ThreeDTouchPeekViewController
        peek.paramTitle = "タイトル"+String(indexPath.row)
        
        // Peek画面の表示領域を設定
        peek.preferredContentSize = CGSize(width: 0.0, height: 200)
        
        // 長押しされたセルをハイライト表示
        var frm = cell.frame
        frm.origin.y = -35 // 微調整
        frm.origin.x = frm.origin.x + collectionView.contentOffset.x - 10 // 微調整
        previewingContext.sourceRect = self.convert(frm, from: collectionView)
        
        return peek
    }
    
    // さらに深く押されたときに呼ばれる
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
    {
        // ここで画面は表示できないので、delegateやclosureなどを使って、親画面から呼ぶようにする
    }
}
