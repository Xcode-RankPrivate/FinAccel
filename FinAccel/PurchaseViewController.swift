//
//  PurchaseViewController.swift
//  FinAccel
//
//  Created by JAN FREDRICK on 05/09/20.
//  Copyright © 2020 JFSK. All rights reserved.
//

import UIKit

class PurchaseViewController : UIViewController {
    
    @IBOutlet weak var topView: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var backB: UIButton!
    
    var imgToUse : UIImage!
    var numberToUse = ""
    
    let fSW = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        print(topView.frame.origin.y)
        
        view.backgroundColor = .white
        
        if UIScreen.main.bounds.height >= 812 {
            //add safe area into account
            scrollview.frame = CGRect(x: 0, y: 40 + 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50 - 50 - 40 - 34)
        }else{
            //normal 20 points for status bar
            scrollview.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50 - 50 - 20)
        }
        
        scrollview.backgroundColor = UIColor.white
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        scrollview.addSubview(imageView)
        
        imageView.layer.cornerRadius = 25
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.layer.borderWidth = 2.0
        imageView.backgroundColor = .gray
        imageView.image = imgToUse
        
        let numberL = UILabel(frame: CGRect(x: 80, y: 20, width: 200, height: 50))
        scrollview.addSubview(numberL)
        
        numberL.text = numberToUse
        
        var nextY = 90
        
        let noticeView = UIView(frame: CGRect(x: 20, y: nextY, width: Int(fSW - 40), height: 60))
        scrollview.addSubview(noticeView)
        
        noticeView.backgroundColor = .systemYellow
        noticeView.layer.cornerRadius = 5.0
        noticeView.layer.masksToBounds = true
        
        let noticeL = UILabel(frame: CGRect(x: 10, y: 10, width: Int(fSW - 60), height: 40))
        noticeView.addSubview(noticeL)
        
        noticeL.text = "OTP is not needed for the first transaction of the day that is less than Rp 200.000"
        noticeL.adjustsFontSizeToFitWidth = true
        noticeL.numberOfLines = 0
        
        nextY += 80
        
        let paymentDetailsCard = UIView(frame: CGRect(x: 20, y: nextY, width: Int(fSW - 40), height: 100))
        scrollview.addSubview(paymentDetailsCard)
        
        paymentDetailsCard.layer.masksToBounds = true
        paymentDetailsCard.layer.cornerRadius = 5.0
        paymentDetailsCard.layer.borderColor = UIColor.systemGray.cgColor
        paymentDetailsCard.layer.borderWidth = 1
        
        nextY += setupPaymentDetailsCard(view: paymentDetailsCard) + 20
        
        let kredivoPinCard = UIView(frame: CGRect(x: 20, y: nextY, width: Int(fSW - 40), height: 100))
        scrollview.addSubview(kredivoPinCard)
        
        kredivoPinCard.layer.masksToBounds = true
        kredivoPinCard.layer.cornerRadius = 5.0
        kredivoPinCard.layer.borderColor = UIColor.systemGray.cgColor
        kredivoPinCard.layer.borderWidth = 1
        
        nextY += setupKredivoPinCard(view: kredivoPinCard) + 20
        
        scrollview.contentSize = CGSize(width: fSW, height: CGFloat(nextY))
        
    }
    
    func setupKredivoPinCard(view: UIView) -> Int {
        
        var innerNextY = 0
        
        let vWidth = view.frame.width
        
        let kredivoPinHeader = UILabel(frame: CGRect(x: 0, y: innerNextY, width: Int(vWidth), height: 50))
        view.addSubview(kredivoPinHeader)
        
        kredivoPinHeader.backgroundColor = .systemGray
        kredivoPinHeader.textAlignment = .center
        kredivoPinHeader.text = "Kredivo PIN"
        kredivoPinHeader.font = UIFont.boldSystemFont(ofSize: 17)
        
        innerNextY += 60
        
        let pinL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth - 20), height: 30))
        view.addSubview(pinL)
        
        pinL.textColor = .systemGray
        pinL.text = "PIN"
        
        innerNextY += 30
        
        let pinTF = UITextField(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth - 70), height: 40))
        view.addSubview(pinTF)
        
        pinTF.placeholder = "enter pin here.."
        
        let pinHideB = UIButton(frame: CGRect(x: Int(vWidth - 50), y: innerNextY, width: 40, height: 40))
        view.addSubview(pinHideB)
        
        
        return innerNextY
    }
    
    func setupPaymentDetailsCard(view: UIView) -> Int {
        
        var innerNextY = 0
        
        let vWidth = view.frame.width
        
        let payDetailsHeader = UILabel(frame: CGRect(x: 0, y: innerNextY, width: Int(vWidth), height: 50))
        view.addSubview(payDetailsHeader)
        
        payDetailsHeader.backgroundColor = .systemGray
        payDetailsHeader.textAlignment = .center
        payDetailsHeader.text = "Payment Details"
        payDetailsHeader.font = UIFont.boldSystemFont(ofSize: 17)
        
        innerNextY += 60
        
        let itemsL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth/2 - 10), height: 60))
        view.addSubview(itemsL)
        
        itemsL.text = "Packet Data Indosat Freedom Paket M"
        itemsL.numberOfLines = 0
        itemsL.sizeToFit()
        
        let itemsPriceL = UILabel(frame: CGRect(x: Int(vWidth/2), y: innerNextY, width: Int(vWidth - 10), height: 60))
        view.addSubview(itemsPriceL)
        
        itemsPriceL.text = "Rp 500.000"
        itemsPriceL.textAlignment = .right
        itemsPriceL.sizeToFit()
        
        innerNextY += 60
        
        let adminL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(adminL)
        
        adminL.text = "Admin Fee"
        adminL.sizeToFit()
        
        let adminFeeL = UILabel(frame: CGRect(x: Int(vWidth/2), y: innerNextY, width: Int(vWidth - 10), height: 30))
        view.addSubview(adminFeeL)
        
        adminFeeL.text = "Rp 0"
        adminFeeL.textAlignment = .right
        adminFeeL.sizeToFit()
        
        innerNextY += 40
        
        let sepLine = UIView(frame: CGRect(x: 0, y: innerNextY, width: Int(vWidth), height: 1))
        view.addSubview(sepLine)
        
        sepLine.backgroundColor = .black
        
        innerNextY += 10
        
        let daysL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(daysL)
        
        daysL.text = "Pay in 30 days"
        daysL.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        let totalPayL = UILabel(frame: CGRect(x: Int(vWidth/2), y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(totalPayL)
        
        totalPayL.text = "Rp 500.000"
        totalPayL.textColor = .systemOrange
        totalPayL.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        innerNextY += 40
        
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: vWidth, height: CGFloat(innerNextY))
        
        return innerNextY
        
    }
    
    @IBAction func backNow(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
