//
//  OneViewCell.swift
//  nesone
//
//  Created by JH on 2017. 5. 22..
//  Copyright © 2017년 JH. All rights reserved.
//

import UIKit


class JSONTableData_one
{
    var title:String
    var num:String
    var re_num:String
    var contents:String
    var reg_date:String
    
    init(title:String,num:String,re_num:String,contents:String,reg_date:String)
    {
        self.title = title
        self.num = num
        self.re_num = re_num
        self.contents = contents
        self.reg_date = reg_date
    }
}

//class JSONTableData_one
//{
//    var title:String
//   
//
//    init(title:String)
//    {
//        self.title = title
//
//    }
//}




class OneViewCell: UITableViewCell {

 
    @IBOutlet var aTitle: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var mRe: UIView!
    @IBOutlet var mRetext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
