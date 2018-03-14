//
//  FullStoryViewController.swift
//  SheduleNews
//
//  Created by Антон Вовк on 12.03.2018.
//  Copyright © 2018 Anton Vovk. All rights reserved.
//

import UIKit


extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}



class FullStoryViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDataLabel: UILabel!
    @IBOutlet weak var postContentTextView: UITextView!
    
    
    var news: NewsInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       postTitleLabel.text = news?.POST_TITLE
       postDataLabel.text = news?.POST_DATE
       postContentTextView.text = news?.POST_CONTENT.html2String
        
       let urlString = (news?.IMAGE)!
        
        print(urlString)
       let url = URL(string: urlString)
       imageView.downloadedFrom(url: url!)

    }

    

}
