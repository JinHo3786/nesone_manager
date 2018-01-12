//
//  ViewController.swift
//  nesone_manager
//
//  Created by JH on 2018. 1. 5..
//  Copyright © 2018년 JH. All rights reserved.
//

import UIKit

class login: UIViewController, UITextFieldDelegate {

    @IBOutlet var id_text_field: UITextField!
    @IBOutlet var password_text_field: UITextField!
    
    var status : String = ""
    var msg : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //*** 키보드올라왔을때 밖에 터치시 내려가게 하는 부분
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        id_text_field.resignFirstResponder()
        password_text_field.resignFirstResponder()
        
    }
    
    @IBAction func login_btn(_ sender: UIButton) {
        
        let id = id_text_field.text
        let password = password_text_field.text
        let urlstr = ".cafe24.com/appdata/rfa/login.do?id="+id!+"&password="+password!
        
        let url=URL(string:"http://"+testurl+urlstr)

        do {
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            
            self.status.append(allContacts["status"] as! String)
            self.msg.append(allContacts["msg"] as! String)
            
            if(status == "1")
            {
                let lampOnAlert = UIAlertController(title: msg,message: "", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                    self.msg = ""
                    self.status = ""
                    self.performSegue(withIdentifier: "gomain", sender: self) //세그이동
                }
                lampOnAlert.addAction(action)
                self.present(lampOnAlert, animated: true, completion: nil)
               
                print(msg)
                
//                let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
//                let vc = storyBoard.instantiateViewController(withIdentifier: "main") as! main_ViewController //캐스팅
//
//                self.present(vc, animated: true, completion: nil)
                
               
                
            }
            else
            {
                let lampOnAlert = UIAlertController(title: msg,message: "", preferredStyle: UIAlertControllerStyle.alert)
                let onAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                msg = ""
                lampOnAlert.addAction(onAction)
                self.present(lampOnAlert, animated: true, completion: nil)
                print(msg)
            }
            
            msg = ""
            status = ""

            
            
        }
        catch {
            
        }
        
    }
    
    
//    //* 키보드 올라왔을때 전체적으로 키보드만큼 올리는부분
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        moveTextField(textField: textField, moveDistance: -230, up: true)
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        moveTextField(textField: textField, moveDistance: -230, up: false)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//
//    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool){
//        let moveDuration = 0.3
//        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
//
//        UIView.beginAnimations("animateTextFiled", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(moveDuration )
//        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
//        UIView.commitAnimations()
//
//    }
//    //*


}

