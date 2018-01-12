//
//  main_ViewController.swift
//  nesone_manager
//
//  Created by JH on 2018. 1. 5..
//  Copyright © 2018년 JH. All rights reserved.
//

import UIKit

class main_ViewController: UIViewController {
    var info_n: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func info_registrat(_ sender: UIButton) {
        print("정보등록")
        
        let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
        let vc = storyBoard.instantiateViewController(withIdentifier: "Info_regist") as! Info_regist //캐스팅

        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func info_Change(_ sender: UIButton) {
        print("정보수정")
        
        let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
        let vc = storyBoard.instantiateViewController(withIdentifier: "Info_regist2") as! Info_regist2 //캐스팅
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func question(_ sender: UIButton) {
        print("1:1문의")
        
        let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
        let vc = storyBoard.instantiateViewController(withIdentifier: "onVC") as! one_on_one //캐스팅
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func reg_terminal(_ sender: UIButton) {
        print("등록단말기")
    }
    
    
   

}
