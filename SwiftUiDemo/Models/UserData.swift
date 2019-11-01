//
//  UserData.swift
//  SwiftUiDemo
//
//  Created by Irshadali Palsaniya on 26/09/19.
//  Copyright © 2019 Irshadali Palsaniya. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = true
    @Published var landmarks = landmarkData
}
