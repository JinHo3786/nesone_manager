//
//  one_on_one.swift
//  nesone
//
//  Created by JH on 2017. 5. 22..
//  Copyright © 2017년 JH. All rights reserved.
//
// 1:1문의 부분 

import UIKit

class one_on_one: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    @IBOutlet var table_View: UITableView!
    
    var mTitle = ""
    var mNum = ""
    var mRe_num = ""
    var mContents = ""
    var mReg_date = ""
    var mPhone_num = ""

    
    //let test : String = "국립농업과학원"
    
    
    var tableData = Array<JSONTableData_one>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        print("one_on_one")
       // let test = defaults.string(forKey: "phonenum")  //프리퍼런스에 저장한 폰넘버 가져오기
        //print("phonenum :", test!)
        //let phoneurl=URL(string:"http://naviquest.cafe24.com/appdata/rfa/rfa_qna_list.do?phone_num=01012345678" )
        
        //let phoneurl=NSURL(string:"http://"+uploadurl+".cafe24.com/appdata/rfa/rfa_qna_list.do?phone_num="+test!)
        
        let phoneurl=NSURL(string:"http://"+testurl+".cafe24.com/appdata/rfa/qna//list_all.do")
        //let phoneurl=NSURL(string:"http://kbeng999.cafe24.com/appdata/lab.do?school_name="+(test.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!))

        let request = NSMutableURLRequest(url: phoneurl! as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
            guard error == nil && data != nil else
            {
                print("Error:", error!)
                return
            }
            let httpStatus = response as? HTTPURLResponse
            if httpStatus!.statusCode == 200
            {
                
                if data?.count != 0
                {
                    
                    let received = try! JSONSerialization.jsonObject(with: data!, options:.allowFragments) //as? [AnyObject]
                    let namma = received as? [AnyObject]
                    //print("ㄲㄲㄲ",namma!)
                    print("namma:",namma?.count ?? 0)
                    if(namma?.count == 0)
                    {
                        print("aa")
                        let lampOnAlert = UIAlertController(title: "등록된 1:1문의가 없습니다",message: "", preferredStyle: UIAlertControllerStyle.alert)
                        let onAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                        lampOnAlert.addAction(onAction)
                        self.present(lampOnAlert, animated: true, completion: nil)

                    }
                    for porduk in namma!
                    {
                        print("ㅁㅁㅁㅁ",porduk)
                        
                         self.mTitle = porduk["title"] as! String
                         self.mNum = porduk["num"] as! String
                         self.mContents = porduk["contents"] as! String
                         self.mPhone_num = porduk["phone_num"] as! String
                         self.mReg_date = porduk["reg_date"] as! String
                         self.mRe_num = porduk["re_num_iphone"] as! String
                        
                            //self.mTitle = porduk["lab_num"] as! String
                        let defaults = UserDefaults.standard
                        defaults.setValue(self.mPhone_num, forKey: "mPhone_num")
                        defaults.setValue(self.mTitle, forKey: "mTitle")
                        defaults.setValue(self.mContents, forKey: "mContents")
                        defaults.setValue(self.mNum, forKey: "mNum")
                        
                        
                    
                        DispatchQueue.main.sync
                        {
                            self.tableData.append(JSONTableData_one(title: self.mTitle,num: self.mNum, re_num: self.mRe_num, contents: self.mContents, reg_date: self.mReg_date))
                            
                            self.table_View.reloadData()
                        }
//                        DispatchQueue.main.sync
//                            {
//                                self.tableData.append(JSONTableData_one(title: self.mTitle))
//                                
//                                self.table_View.reloadData()
//                        }
                        
//
                        
                    }
                    
                    
                }
                else
                {
                    print("No Data got from URL")
                }
            }
            else
            {
                print("HTTP Status is 200. But error is: ",httpStatus!.statusCode)
            }
        }
        task.resume()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table_View.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! OneViewCell
        
        let tableObject:JSONTableData_one = tableData[indexPath.row]
        
        cell.aTitle.text = tableObject.title
        cell.time.text = tableObject.reg_date
        print("renum:",tableObject.re_num)
        if(tableObject.re_num != "")     //답변 부분
        {
            print("12",tableObject.re_num)
            cell.mRe.isHidden = false
            cell.mRetext.isHidden = false
        }
        else
        {
            print("else:",tableObject.re_num)
            cell.mRe.isHidden = true
            cell.mRetext.isHidden = true
        }

        // Configure the cell...

        return cell
    }
    
    //눌렀을때 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        //textLabel?.text = data[(indexPath as NSIndexPath).row]
        print("You tapped cell number ",tableData[(indexPath as NSIndexPath).row])
       
        let storyBoard = UIStoryboard(name:"Main", bundle: nil) //스토리보드 가져오기
        let vc = storyBoard.instantiateViewController(withIdentifier: "answer") as! answerViewController //캐스팅
        vc.input = tableData[(indexPath as NSIndexPath).row].num //해당 뷰와 관련된 .swift 파일의 변수에 값 전달
        self.present(vc, animated: true, completion: nil) //storyboardid가 IS_B인 화면 화면 띄움
        
    }
    
    
}
