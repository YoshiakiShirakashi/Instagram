//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 白樫芳昭 on 2019/07/21.
//  Copyright © 2019 yoshiaki.sjirakashi. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

var comment = ""

class PostTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var comTextField: UITextField!
    @IBOutlet weak var commentButton: UIButton!
    @IBAction func comButtonAction(_ sender: Any) {
        comment = comTextField.text!
        comTextField.text = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        comTextField.delegate = self
        // Initialization code
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
