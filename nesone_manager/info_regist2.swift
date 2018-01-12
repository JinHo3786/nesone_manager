//
//  Info_regist.swift
//  nesone
//
//  Created by JH on 2017. 4. 5..
//  Copyright © 2017년 JH. All rights reserved.
//

import UIKit
import Foundation

class Info_regist2: UIViewController, UITextFieldDelegate {
    
    
    var add_temp1 : String = ""
    var add_temp2 : String = ""
    var add_temp3 : String = ""
    var msg : String = ""
    var num_chk : String = ""
    var retval : String = ""
    @IBOutlet weak var btn_info_reg: UIButton!
    @IBOutlet weak var IDname: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var adr: UITextField!
    @IBOutlet weak var Phonenum: UITextField!
    @IBOutlet weak var emergency1: UITextField!
    @IBOutlet weak var emergency2: UITextField!
    @IBOutlet weak var emergency3: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var info2: UITextField!
    
    @IBOutlet var add1: UITextField!
    @IBOutlet var add2: UITextField!
    @IBOutlet var add3: UITextField!
    
    @IBOutlet var add_text1: UILabel!
    @IBOutlet var add_text2: UILabel!
    @IBOutlet var add_text3: UILabel!
    
//    @IBOutlet var stackview: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var add1View = UIView()
    var add2View = UIView()
    var add3View = UIView()
    var add_text1tView = UIView()
    var add_text2tView = UIView()
    var add_text3tView = UIView()
    
    var mac_addr_fix : String = ""
    var user_name_fix : String = ""
    var user_addr_fix : String = ""
    var user_tel03_fix : String = ""
    var user_tel01_fix : String = ""
    var user_tel02_fix : String = ""
    var user_tel04_fix : String = ""
    var iphone_phone_num_fix : String = ""
    var install_info_fix : String = ""
    var board_info_fix : String = ""
    var usable_tel_01_fix : String = ""
    var usable_tel_02_fix : String = ""
    var usable_tel_03_fix : String = ""
    
    var input : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //stackview.removeFromSuperview()
//        add1View = stackview.arrangedSubviews[0]
//        add2View = stackview.arrangedSubviews[2]
//        add3View = stackview.arrangedSubviews[4]
//        add_text1tView = stackview.arrangedSubviews[1]
//        add_text2tView = stackview.arrangedSubviews[3]
//        add_text3tView = stackview.arrangedSubviews[5]
        
//                add1View.isHidden = true
//                add2View.isHidden = true
//                add3View.isHidden = true
//        add_text1tView.isHidden = true
//        add_text2tView.isHidden = true
//        add_text3tView.isHidden = true
        
        add1.isHidden = true
        add2.isHidden = true
        add3.isHidden = true
        
        IDname.placeholder = "단말기(보드)의 맥어드레스를 입력 하세요."
        name.placeholder = "고객 이름을 입력 하세요."
        adr.placeholder = "고객 주소를 입력 하세요."
        Phonenum.placeholder = "관리자 연락처를 입력 하세요."
        emergency1.placeholder = "-제외한 전화번호를 입력 하세요."
        emergency2.placeholder = "-제외한 전화번호를 입력 하세요."
        emergency3.placeholder = "-제외한 전화번호를 입력 하세요."
        info.placeholder = "설치 건물명을 입력 하세요."
        info2.placeholder = "경보기 정보를 입력 하세요."
        
        
        
     
        let defaults = UserDefaults.standard
        let infofix = defaults.bool(forKey: "infofix")  //가져오기
        
        print("input :",input)
        print("infofix :",infofix)
        
        if(infofix == true)
        {
            do {  //정보 수정하기
                
                let url=URL(string:"http://"+testurl+".cafe24.com/appdata/rfa/rfa_info_read.do?mac_addr="+input)
                let allContactsData = try Data(contentsOf: url!)
                _ = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
                let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
                mac_addr_fix.append(allContacts["mac_addr"] as! String)
                user_name_fix.append(allContacts["user_name"] as! String)
                user_addr_fix.append(allContacts["user_addr"] as! String)
                user_tel03_fix.append(allContacts["user_tel03"] as! String)
                user_tel01_fix.append(allContacts["user_tel01"] as! String)
                user_tel02_fix.append(allContacts["user_tel02"] as! String)
                user_tel04_fix.append(allContacts["user_tel04"] as! String)
                //iphone_phone_num_fix.append(allContacts["iphone_phone_num"] as! String)
                install_info_fix.append(allContacts["install_info"] as! String)
                board_info_fix.append(allContacts["board_info"] as! String)
                usable_tel_01_fix.append(allContacts["usable_tel_01"] as! String)
                usable_tel_02_fix.append(allContacts["usable_tel_02"] as! String)
                usable_tel_03_fix.append(allContacts["usable_tel_03"] as! String)
                
                IDname.text = mac_addr_fix
                name.text = user_name_fix
                adr.text = user_addr_fix
                Phonenum.text = user_tel03_fix
                emergency1.text = user_tel01_fix
                emergency2.text = user_tel02_fix
                emergency3.text = user_tel04_fix
                info.text = install_info_fix
                info2.text = board_info_fix
                
            
                
                
                self.add_temp1 = usable_tel_01_fix
                self.add_temp2 = usable_tel_02_fix
                self.add_temp3 = usable_tel_03_fix
                
                
                UserDefaults.standard.removeObject(forKey: "infofix")
                
            }
            catch {
            }
            
            
            
            
        }
        else
        {
            
        }
        
        
        
        
        
        
        //1
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
        
    }
    //6
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    //7
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeObserver()
    }
    
    //2
    @objc func didTapView(gesture: UITapGestureRecognizer){
        view.endEditing(true)
    }
    //3
    func addObservers(){
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) {
            Notification in
            self.keyboardWillShow(notification: Notification)
        }
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) {
            Notification in
            self.keyboardWillHide(notification: Notification)
        }
    }
    //6
    func removeObserver(){
        NotificationCenter.default.removeObserver(self)
    }
    //4
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
    }
    //5
    func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        
//        
//    }
//    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        var cnt = 0
        let maxLength = 15
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        
        
        if(newString.length <= maxLength)
        {
            cnt = cnt + 1
        }
        if(cnt < 15)
        {
            
        }
        print("",cnt)
        
        let matched = matches(for: "^[a-zA-Z0-9]+$", in: string)
        print(matched)
        
        let invalidCharacters = CharacterSet(charactersIn: "0123456789abcdefghijklmnopqrstuvwxyzㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍ하ㅑㅓㅕㅗㅛㅜㅠㅢㅐㅔ").inverted
        
        
        return newString.length <= maxLength && string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
        
    }
    
    //맥 어드레스 파싱 함수
    func MacAddressParsing(mac_addrs : String) ->String
    {
        
        let num1 : String = IDname.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num2 : String = name.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num3 : String = adr.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num4 : String = Phonenum.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num5 : String = emergency1.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num6 : String = emergency2.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num7 : String = emergency3.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num8 : String = info.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num9 : String = info2.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num10 : String = add1.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num11 : String = add2.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num12 : String = add3.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        do {  //정보 수정하기
            //http://naviquest.cafe24.com/appdata/rfa/rfa_info_update.do
            //            let url=URL(string:"http://"+uploadurl+".cafe24.com/appdata/rfa/rfa_info_update.do?mac_addr="+num1+"&user_name="+num2+"&user_addr="+num3+"&user_tel03="+num4+"&user_tel01="+num5+"&user_tel02="+num6+"&user_tel04="+num7+"&install_info="+num8+"&board_info="+num9+"&usable_tel_01="+num10+"&usable_tel_02"+num11+"&usable_tel_03="+num12)
            
            let url=URL(string:"http://"+testurl+".cafe24.com/appdata/rfa/rfa_info_update.do?mac_addr="+num1+"&user_name="+num2+"&user_addr="+num3+"&user_tel03="+num4+"&user_tel01="+num5+"&user_tel02="+num6+"&user_tel04="+num7+"&install_info="+num8+"&board_info="+num9+"&usable_tel_01="+num10+"&usable_tel_02="+num11+"&usable_tel_03="+num12)
            let allContactsData = try Data(contentsOf: url!)
            _ = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            
            self.msg.append(allContacts["msg"] as! String)
            
            print("msg :",self.msg)

        
            
        }
        catch {
        }
        
        return mac_addrs
    }
    
    
    
    
    
    
    @IBAction func Info_regist_btn(_ sender: UIButton) {
        
        //등록하기
        
        
        let num1 : String = IDname.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num2 : String = name.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num3 : String = adr.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num4 : String = Phonenum.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num5 : String = emergency1.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num6 : String = emergency2.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num7 : String = emergency3.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num8 : String = info.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num9 : String = info2.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num10 : String = add1.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num11 : String = add2.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let num12 : String = add3.text!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        if(num1 == "")
        {
            let redTapImage = UIImage(named: "btn_info_reg_n")
            btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
            let alertController = UIAlertController(title: "고객 ID는 필수 입니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        else if(num2 == "")
        {
            let redTapImage = UIImage(named: "btn_info_reg_n")
            btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
            let alertController = UIAlertController(title: "고객 이름은 필수 입니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        else if(num3 == "")
        {
            let redTapImage = UIImage(named: "btn_info_reg_n")
            btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
            let alertController = UIAlertController(title: "고객 주소는 필수 입니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        else if(num4 == "")
        {
            let redTapImage = UIImage(named: "btn_info_reg_n")
            btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
            let alertController = UIAlertController(title: "관리자 연락처는 필수 입니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        else if(num8 == "")
        {
            let redTapImage = UIImage(named: "btn_info_reg_n")
            btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
            let alertController = UIAlertController(title: "설치 건물명은 필수 입니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        else
        {
            

            
            let message = "고객 ID : \t\t\t"+IDname.text!+"\n"+"고객이름 : \t\t\t"+name.text!+"\n"+"고객주소 : \t\t\t"+adr.text!+"\n"+"관리자 연락처 : \t\t"+Phonenum.text!+"\n"+"비상 연락망(1) : \t"+emergency1.text!+"\n"+"비상 연락망(2) : \t"+emergency2.text!+"\n"+"비상 연락망(3) : \t"+emergency3.text!+"\n"+"설치건물명 : \t\t"+info.text!+"\n"+"경보기 정보 : \t\t"+info2.text!+"\n"+"추가 사용자1 : \t\t"+add_temp1+"\n"+"추가 사용자2 : \t\t"+add_temp2+"\n"+"추가 사용자3 : \t\t"+add_temp3
            
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.left
            let attributedMessage: NSMutableAttributedString = NSMutableAttributedString(
                string: message, // your string message here
                attributes: [
                    NSAttributedStringKey.paragraphStyle: paragraphStyle,
                    NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13.0)
                ]
            )
            
            
            let redTapImage = UIImage(named: "btn_info_reg_n")
            btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
            let nID = UIAlertController(title: "등록 정보 확인", message: "고객 ID : \t"+IDname.text!+"\n"+"고객이름 : \t"+name.text!+"\n"+"고객주소 : \t"+adr.text!+"\n"+"관리자 연락처 : \t"+Phonenum.text!+"\n"+"비상 연락망(1) : \t"+emergency1.text!+"\n"+"비상 연락망(2) : \t"+emergency2.text!+"\n"+"비상 연락망(3) : \t"+emergency3.text!+"\n"+"설치건물명 : \t"+info.text!+"\n"+"경보기 정보 : \t"+info2.text!+"\n"+"추가 사용자1 : \t"+add_temp1+"\n"+"추가 사용자2 : \t"+add_temp2+"\n"+"추가 사용자3 : \t"+add_temp3, preferredStyle: UIAlertControllerStyle.alert)

            
            
            
            present(nID, animated: true, completion: nil)
            
            
            let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("취소")
                
            }
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
//                let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
//                let vc = storyBoard.instantiateViewController(withIdentifier: "FirstVC") as! ViewController //캐스팅
//                print("info:",num4)
//                vc.info_n = num4
//                self.present(vc, animated: true, completion: nil)
                
                do {
                    
                    
                    
                    
                    // http://naviquest.cafe24.com/appdata/rfa/rfa_info_reg.do?mac_addr=150000000000&user_name=dd&user_addr=aa&user_tel03=01012345678
                    
                    //                    let url=URL(string:"http://"+uploadurl+".cafe24.com/appdata/rfa/rfa_info_reg.do?mac_addr="+num1+"&user_name="+num2+"&user_addr="+num3+"&user_tel03="+num4+"&user_tel01="+num5+"&user_tel02="+num6+"&user_tel04="+num7+"&install_info="+num8+"&board_info="+num9)
                    
                    
                    let url=URL(string:"http://"+testurl+".cafe24.com/appdata/rfa/rfa_info_reg.do?mac_addr="+num1+"&user_name="+num2+"&user_addr="+num3+"&user_tel03="+num4+"&user_tel01="+num5+"&user_tel02="+num6+"&user_tel04="+num7+"&install_info="+num8+"&board_info="+num9+"&usable_tel_01="+num10+"&usable_tel_02="+num11+"&usable_tel_03="+num12)
                    let allContactsData = try Data(contentsOf: url!)
                    let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                    
                    regist_reg_state.append(allContacts["status"] as! String)
                    self.msg.append(allContacts["msg"] as! String)
                    
                    if(regist_reg_state == "0")
                    {
                        print("실패:",self.msg)
                    }
                    if(regist_reg_state == "1")
                    {
                        let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
                        let vc = storyBoard.instantiateViewController(withIdentifier: "main") as! main_ViewController //캐스팅
                        self.present(vc, animated: true, completion: nil)
                        
                        
                        
                    }
                    if(regist_reg_state == "2")
                    {
                        let redTapImage = UIImage(named: "btn_info_reg_n")
                        self.btn_info_reg.setImage(redTapImage, for: UIControlState.normal)
                        print("존재:",self.msg)
                        let alertController = UIAlertController(title: "고객 정보 수정", message: self.msg, preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                            
                            print("취소")
                            
                        }
                        
                        let okAction = UIAlertAction(title: "수정", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                            
                            
                            let nID = UIAlertController(title: "등록 정보 확인", message: "고객 ID\t"+self.IDname.text!+"\n"+"고객이름\t"+self.name.text!+"\n"+"고객주소\t"+self.adr.text!+"\n"+"관리자 연락처 \t"+self.Phonenum.text!+"\n"+"비상 연락망(1)\t"+self.emergency1.text!+"\n"+"비상 연락망(2)\t"+self.emergency2.text!+"\n"+"비상 연락망(3)\t"+self.emergency3.text!+"\n"+"설치건물명\t"+self.info.text!+"\n"+"경보기 정보           \t"+self.info2.text!, preferredStyle: UIAlertControllerStyle.alert)
                            nID.setValue(attributedMessage, forKey: "attributedMessage")
                            
                            let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                                print("취소")
                                
                            }
                            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                                _ = self.MacAddressParsing(mac_addrs: num1)
                                
                                
                                let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
                                let vc = storyBoard.instantiateViewController(withIdentifier: "main") as! main_ViewController //캐스팅
                                self.present(vc, animated: true, completion: nil)
                            }
                            nID.addAction(DestructiveAction)
                            nID.addAction(okAction)
                            
                            
                            self.present(nID, animated: true, completion: nil)
                            
                            
//                                                    _ = self.MacAddressParsing(mac_addrs: num1)
//                            
//                            
//                                                    let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
//                                                    let vc = storyBoard.instantiateViewController(withIdentifier: "FirstVC") as! ViewController //캐스팅
//                                                    print("info:",num4)
//                                                    vc.info_n = num4
//                                                    self.present(vc, animated: true, completion: nil)
                            
                        }
                        alertController.addAction(DestructiveAction)
                        alertController.addAction(okAction)
                        
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
                    
                    regist_reg_state = ""
                    self.msg = ""
                    
                }
                    
                catch {
                }
                
            }
            
            print("성공:",msg)
            nID.setValue(attributedMessage, forKey: "attributedMessage")
            
            nID.addAction(DestructiveAction)
            nID.addAction(okAction)
        }
        
    }
    @IBAction func user_add(_ sender: UIButton) {
        
        
        
        
        //        let lampOnAlert = UIAlertController(title: "인증 번호를 입력해 주세요.",message: "", preferredStyle: UIAlertControllerStyle.alert)
        //        let onAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
        //
        //        let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
        //            print("취소")
        //
        //        }
        //
        //
        //        lampOnAlert.addAction(onAction)
        //        lampOnAlert.addAction(DestructiveAction)
        //        present(lampOnAlert, animated: true, completion: nil)
        
        
        let alertController = UIAlertController(
            title: nil,
            message: "인증 번호를 입력해 주세요.",
            preferredStyle: .alert)
        
        let loginAction = UIAlertAction(title: "확인", style: .default) { (_) in
            
            if(self.num_chk == "ok")
            {
                print("인증에 성공")
                let lampOnAlert = UIAlertController(title: "인증에 성공했습니다.",message: "", preferredStyle: UIAlertControllerStyle.alert)
                let onAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                    
                    print("확인")
//                    self.add1View.isHidden = false
//                    self.add2View.isHidden = false
//                    self.add3View.isHidden = false
//                    self.add_text1tView.isHidden = false
//                    self.add_text2tView.isHidden = false
//                    self.add_text3tView.isHidden = false
                    
                    self.add1.isHidden = false
                    self.add2.isHidden = false
                    self.add3.isHidden = false
                    
                    self.add1.text = self.usable_tel_01_fix
                    self.add2.text = self.usable_tel_02_fix
                    self.add3.text = self.usable_tel_03_fix
                    
                    
                }
                
                lampOnAlert.addAction(onAction)
                self.present(lampOnAlert, animated: true, completion: nil)
                
            }
            else
            {
                print("인증에 실패")
                let lampOnAlert = UIAlertController(title: "인증에 실패했습니다.",message: "", preferredStyle: UIAlertControllerStyle.alert)
                let onAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                    
                    print("확인")
                    
                    
                }
                
                lampOnAlert.addAction(onAction)
                self.present(lampOnAlert, animated: true, completion: nil)
                
            }
        }
        loginAction.isEnabled = false
        
        
        alertController.addTextField { (textField) in
            textField.placeholder = "인증번호"
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { (notification) in
                print("\(String(describing: textField.text))")
                loginAction.isEnabled = textField.text != ""
                //textField.delegate = self
                
                //if(textField.text == "ㄱ")
                
                do {
                    //let phoneurl=URL(string:"http://"+uploadurl+".cafe24.com/appdata/rfa/certification_num.do?cert_num="+textField.text!)
                    
                    
                    let phoneurl=URL(string:"http://"+testurl+".cafe24.com/appdata/rfa/certification_num.do?cert_num="+textField.text!)
                    
                    let numallContactsData = try Data(contentsOf: phoneurl!)
                    let numallContacts = try JSONSerialization.jsonObject(with: numallContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                    
                    
                    self.retval.append(numallContacts["retval"] as! String)
                    
                    print("aa",self.retval)
                    if(self.retval == "1")
                    {
                        print("1")
                        self.num_chk = "ok"
                    }
                    else
                    {
                        print("0")
                        self.num_chk = "false"
                    }
                    self.retval = ""
                    
                    
                }
                catch {
                }
                
                
                
                
                
                
            }
        }
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(loginAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController,animated: true,completion: nil)
    }
    
    
    
}

