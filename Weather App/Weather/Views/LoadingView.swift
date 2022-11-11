//
//  LoadingView.swift
//  Weather
//
//  Created by 杨小涵 on 2022/9/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
