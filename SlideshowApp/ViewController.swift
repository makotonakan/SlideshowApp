//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中野誠 on 2021/09/01.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var imageview: UIImageView!
    // いる？
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var startbutton: UIButton!
    // いる？
    @IBOutlet weak var forwardbutton: UIButton!
    
    //画像ファイル
    var imageNames = [
    "MtFuji.jpg",
    "Shinkansen.jpg",
    "summer-beach.jpg",
    "TokyoTower.jpg",
    ]
    
    var showindex = 0
    
    //タイマー
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // 画像表示　いる？
        showimage()
    }
    
    @IBAction func tapplaybutton(_ sender: Any) {
        if timer == nil {
            // スライドショー開始
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            //　ボタンを停止に
            startbutton.setTitle("停止", for: .normal)
            forwardbutton.isEnabled = false
            backbutton.isEnabled = false
        } else {
            
            //　スライドショー停止
            timer.invalidate()
            timer = nil
            
            // ボタンを停止に
            startbutton.setTitle("再生", for: .normal)
            forwardbutton.isEnabled = true
            backbutton.isEnabled = true
        }
    }
        
        @objc func updateTimer() {
            showindex += 1
            if showindex >= imageNames.count {
                showindex = 0
            }
        
            showimage()
        }
    
    
    @IBAction func tapforwardbutton(_ sender: Any) {
    showindex += 1
        if showindex >= imageNames.count {
            showindex = 0
        }
        
        showimage()
        
    }
    
    @IBAction func tapbackbutton(_ sender: Any) {
    showindex -= 1
        if showindex < 0 {
            showindex = imageNames.count - 1
        }
    
        showimage()
    }
    
    //showindexの画像表示
    
    func showimage() {
    imageview.image = UIImage(named: imageNames[showindex])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //　スライドショー停止から画面遷移
        
        if timer != nil {
        
            //　スライドショー停止
            
            timer.invalidate()
            timer = nil
            
            //　ボタンを再生に戻す
        
            startbutton.setTitle("再生", for: .normal)
            forwardbutton.isEnabled = true
            backbutton.isEnabled = true
        }
        
        // 表示中の画像を引き継ぎ
        let resultviewcontroller = segue.destination as! ResultViewController
        resultviewcontroller.image = imageview.image
    }
        // 画面遷移の戻り用
        @IBAction func unwind(_ segue:UIStoryboardSegue) {
        }
    }


