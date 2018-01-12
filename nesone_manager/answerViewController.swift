//
//  answerViewController.swift
//  nesone
//
//  Created by JH on 2017. 5. 22..
//  Copyright © 2017년 JH. All rights reserved.
//
// 1:1 문의 답변부분
import UIKit

class answerViewController: UIViewController {

    
    @IBOutlet var aTilte: UITextView!
    @IBOutlet var aReTitle: UITextView!
    @IBOutlet var aTimedate: UILabel!
    @IBOutlet var aContents: UITextView!
    @IBOutlet var aRecontents: UITextView!
    
    var status: String = ""
    var msg: String = ""
    var input: String = ""
    
    var re_contents: String = ""
    var titles: String = ""
    var re_reg_date: String = ""
    var re_num: String = ""
    var contents: String = ""
    var re_title: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aTilte.layer.borderWidth = 1.0
        aContents.layer.borderWidth = 1.0
        aReTitle.layer.borderWidth = 1.0
        aRecontents.layer.borderWidth = 1.0
        
        aContents.isEditable = false
        aRecontents.isEditable = false
        aTilte.isEditable = false
        aReTitle.isEditable = false
        
        let defaults = UserDefaults.standard
        let mPhone_num = defaults.string(forKey: "mPhone_num")  //가져오기
        let mTitle = defaults.string(forKey: "mTitle")  //가져오기
        let mContents = defaults.string(forKey: "mContents")  //가져오기
        let mNum = defaults.string(forKey: "mNum")  //가져오기
        
        print("answer")
        
        print("mPhone_num",mPhone_num)
        print("mTitle",mTitle)
        print("mContents",mContents)
        print("mNum",mNum)
        
        do {
         
            //print("input : ", input)
            //let phoneurl=URL(string:"http://"+uploadurl+".cafe24.com/appdata/rfa/rfa_qna_reply.do?qna_num="+input)
            
//            let urlstr = ".cafe24.com/appdata/rfa/qna/reply/reg.do?phone_num="+mPhone_num!+"&re_title="+(mTitle?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
//            let urlstr2 = "&re_contents="+mContents!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!+"&qna_num="+mNum!
//            let phoneurl=URL(string:"http://"+testurl+urlstr+urlstr2)
            
            let phoneurl=URL(string:"http://"+testurl+".cafe24.com/appdata/rfa/rfa_qna_reply.do?qna_num="+mNum!)
            
            let numallContactsData = try Data(contentsOf: phoneurl!)
            let numallContacts = try JSONSerialization.jsonObject(with: numallContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            
            re_contents.append(numallContacts["re_contents"] as! String)
            titles.append(numallContacts["title"] as! String)
            re_reg_date.append(numallContacts["re_reg_date"] as! String)
            re_num.append(numallContacts["re_num"] as! String)
            contents.append(numallContacts["contents"] as! String)
            re_title.append(numallContacts["re_title"] as! String)
            
            
            aTilte.text = titles
            aContents.text = contents
            aReTitle.text = re_title
            aRecontents.text = re_contents
            aTimedate.text = re_reg_date
            
            
            
        }
        catch {
        }
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Delete(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "1:1문의를 삭제 하시겠습니까?", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            
            print("취소")
            
            
        }
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            
            
            let lampOnAlert = UIAlertController(title: self.msg,message: "1:1문의 삭제에 성공했습니다.", preferredStyle: UIAlertControllerStyle.alert)
            do {
                
                // let phoneurl=URL(string:"http://"+uploadurl+".cafe24.com/appdata/rfa/rfa_qna_delete.do?num="+self.input)
                
                let phoneurl=URL(string:"http://"+testurl+".cafe24.com/appdata/rfa/rfa_qna_delete.do?num="+self.input)
                let numallContactsData = try Data(contentsOf: phoneurl!)
                let numallContacts = try JSONSerialization.jsonObject(with: numallContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
                self.status.append(numallContacts["status"] as! String)
                self.msg.append(numallContacts["msg"] as! String)
                
                if(self.status == "1" ) {
                    
                    print("들어오고나서상태값2",self.msg)
                    print("들어오고나서상태값3",self.status)
                    
                    
                    
                }
                else
                {
                    print("들어오고나서상태값2",self.msg)
                    print("들어오고나서상태값3",self.status)
                    
                    
                    
                    let lampOnAlert = UIAlertController(title: self.msg,message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let onAction = UIAlertAction(title: "확인.", style: UIAlertActionStyle.default, handler: nil)
                    self.status = ""
                    self.msg = ""
                    lampOnAlert.addAction(onAction)
                    self.present(lampOnAlert, animated: true, completion: nil)
                }
                
            }
            catch
            {
                
            }
            
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                self.status = ""
                self.msg = ""
                let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
                let vc = storyBoard.instantiateViewController(withIdentifier: "onVC") as! one_on_one //캐스팅
                self.present(vc, animated: true, completion: nil) //storyboardid가 IS_B인 화면 화면 띄움
            }
            lampOnAlert.addAction(action)
            self.present(lampOnAlert, animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        alertController.addAction(DestructiveAction)
        present(alertController, animated: true, completion: nil)
    }
    
}




