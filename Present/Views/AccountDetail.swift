//
//  AccountDetail.swift
//  Present
//
//  Created by Lauren Kelz (student LM) on 3/1/22.
//

import SwiftUI

struct AccountDetail: View {
    class AccountDetail : ObservableObject{
        var name : String
        var email : String
        var password : String
    }
}

struct AccountDetail_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetail()
    }
}
