//
//  userDataBase.swift
//  Present
//
//  Created by Inbal David (student LM) on 4/18/22.
//
//celebrity birthdays, month gemstone, zodiac signs
import SwiftUI

struct userDataBase{
    
@EnvironmentObject var userInfo : UserInfo
//@StateObject var userInfo :  UserInfo = UserInfo()
/*
func (userinfo: UserInfo){
    private var year : String = "0000"
    @State private var month: String = "00"
    @State private var day : String = "00"
}

    init(userInfo : UserInfo){
        let dateString = "\(userInfo.birthday.description.replacingOccurrences(of: "+0000", with: ""))UTC"

        let formatter = DateFormatter()
        guard let date = formatter.date(from: dateString) else {return}
        //let someDateTime = formatter.date(from: "2016/10/08 22:31")

        formatter.dateFormat = "yyyy"
        self.year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        self.month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        self.day = formatter.string(from: date)
    
    }


var celebrities: [date: String] = [0000/00/00 : ""]
*/
}
