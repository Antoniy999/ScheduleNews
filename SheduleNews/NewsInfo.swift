//
//  NewsInfo.swift
//  SheduleNews
//
//  Created by Антон Вовк on 12.03.2018.
//  Copyright © 2018 Anton Vovk. All rights reserved.
//

import Foundation

struct NewsInfo: Decodable {
    let POST_DATE: String
    let POST_TITLE: String
    let IMAGE: String
    let POST_CONTENT: String
}

