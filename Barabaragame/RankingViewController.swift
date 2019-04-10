//
//  RankingViewController.swift
//  Barabaragame
//
//  Created by 所　紀彦 on 2019/04/10.
//  Copyright © 2019年 所　紀彦. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet var rankingLabel1: UILabel! //一位のスコアを表示するラベル
    @IBOutlet var rankingLabel2: UILabel! //2位のスコアry
    @IBOutlet var rankingLabel3: UILabel! //3位のスコアry
    
    let defaults: UserDefaults = UserDefaults.standard //スコアを保存するための変数

    override func viewDidLoad() {
        //"score1"というキーの値を取得して表示
        rankingLabel1.text = String(defaults.integer(forKey: "score1"))
        //"score2"というキーの値を取得して表示
        rankingLabel2.text = String(defaults.integer(forKey: "score2"))
        //"score3"というキーの値を取得して表示
        rankingLabel3.text = String(defaults.integer(forKey: "score3"))
        //super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTop(){
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
