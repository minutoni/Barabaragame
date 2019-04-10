//
//  GameViewController.swift
//  Barabaragame
//
//  Created by 所　紀彦 on 2019/04/10.
//  Copyright © 2019年 所　紀彦. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    
    @IBOutlet var imgView1 : UIImageView! //上の画像
    @IBOutlet var imgView2 : UIImageView! //真ん中の画像
    @IBOutlet var imgView3 : UIImageView! //下の画像
    
    @IBOutlet var resultLabel:UILabel! //スコアを表示するラベル
    
    var timer : Timer! //画像を動かすためのタイマー
    var score: Int = 1000 //スコアの値
    
    let defaults : UserDefaults = UserDefaults.standard //スコアを保存するための変数
    
    let width: CGFloat = UIScreen.main.bounds.size.width //画像幅
    
    var positionX:[CGFloat] = [0.0,0.0,0.0] //画面の位置の配列
    
    var dx: [CGFloat] = [1.0,0.5,-1.0] //画面を動かす幅の配列
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionX = [width/2,width/2,width/2] //画像の表示を画面幅の中心にする
        self.start() //前ページでかいたstartというメソッドを呼び出す

        // Do any additional setup after loading the view.
    }
    
    
    func up(){
        for i in 0..<3 {
            //橋に来たら動かす向きを逆にする
            if positionX[i] > width || positionX[i] < 0 {
                dx[i]  = dx[i] * (-1)
        }
            positionX[i] += dx[i] //画像の位置をdxずらす
    }
        imgView1.center.x = positionX[0] //上の画像をずらした位置に移動させる
        imgView2.center.x = positionX[1] //真ん中の画像をずらした位置に移動させる
        
    
    func start(){
        //結果ラベルを見えなくする
        resultLabel.isHidden = true
        
        //タイマーを動かす
        //「先ほど作ったupメソッド」がない(後のページだった）
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        //        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        timer.fire()
        
        
        }
    }
    //ストップボタンを押したら
    @IBAction func stop(){
        if timer.isValid == true{ //もしタイマーが動いていたら
            timer.invalidate()//タイマーを止める(無効にする)
        }
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
