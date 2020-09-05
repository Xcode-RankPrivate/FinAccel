//
//  FinishPaymentViewController.swift
//  FinAccel
//
//  Created by JAN FREDRICK on 05/09/20.
//  Copyright © 2020 JFSK. All rights reserved.
//

import UIKit

class FinishPaymentViewController : UIViewController {
    
    var scrollview : UIScrollView!
    
    var numberToShow = ""
    var priceToShow = ""
    var imgToShow : UIImage!
    
    let fSW = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        if UIScreen.main.bounds.height >= 812 {
            //add safe area into account
            scrollview = UIScrollView(frame: CGRect(x: 0, y: 40 + 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50 - 50 - 40 - 34))
        }else{
            //normal 20 points for status bar
            scrollview = UIScrollView(frame: CGRect(x: 0, y: 20 + 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50 - 50 - 20))
        }
        view.addSubview(scrollview)
        
        scrollview.backgroundColor = UIColor.white
        
        var nextY = 20
        
        let orderDetailsCard = UIView(frame: CGRect(x: 20, y: nextY, width: Int(fSW - 40), height: 100))
        scrollview.addSubview(orderDetailsCard)
        
        orderDetailsCard.layer.masksToBounds = true
        orderDetailsCard.layer.cornerRadius = 5.0
        orderDetailsCard.layer.borderColor = UIColor.systemGray.cgColor
        orderDetailsCard.layer.borderWidth = 1
        
        nextY += setupOrderDetailsCard(view: orderDetailsCard) + 20
        
        let paymentDetailsCard = UIView(frame: CGRect(x: 20, y: nextY, width: Int(fSW - 40), height: 100))
        scrollview.addSubview(paymentDetailsCard)
        
        paymentDetailsCard.layer.masksToBounds = true
        paymentDetailsCard.layer.cornerRadius = 5.0
        paymentDetailsCard.layer.borderColor = UIColor.systemGray.cgColor
        paymentDetailsCard.layer.borderWidth = 1
        
        nextY += setupPaymentDetailsCard(view: paymentDetailsCard) + 20
        
        let noticeView = UIView(frame: CGRect(x: 20, y: nextY, width: Int(fSW - 40), height: 60))
        scrollview.addSubview(noticeView)
        
        noticeView.backgroundColor = .systemGray
        
        let noticeL = UILabel(frame: CGRect(x: 10, y: 10, width: Int(fSW - 60), height: 40))
        noticeView.addSubview(noticeL)
        
        noticeL.numberOfLines = 0
        noticeL.adjustsFontSizeToFitWidth = true
        noticeL.text = "Invoice has been emailed to you.\nHave problem? Email us at support@kredivo.com"
        
        let rangeOfColoredString = (noticeL.text! as NSString).range(of: "support@kredivo.com")

        // Create the attributedString.
        let attributedString = NSMutableAttributedString(string:noticeL.text!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], range: rangeOfColoredString)
        noticeL.attributedText = attributedString
        
        nextY += 70
        
        scrollview.contentSize = CGSize(width: Int(fSW), height: nextY)
        
    }
    
    func setupOrderDetailsCard(view: UIView) -> Int {
        
        var innerNextY = 0
        
        let vWidth = view.frame.width
        
        let orderDetailsHeader = UILabel(frame: CGRect(x: 0, y: innerNextY, width: Int(vWidth), height: 50))
        view.addSubview(orderDetailsHeader)
        
        orderDetailsHeader.backgroundColor = .systemGray
        orderDetailsHeader.textAlignment = .center
        orderDetailsHeader.text = "Order Details"
        orderDetailsHeader.font = UIFont.boldSystemFont(ofSize: 17)
        
        innerNextY += 60
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: innerNextY, width: 40, height: 40))
        view.addSubview(imageView)
        
        imageView.image = imgToShow
        imageView.backgroundColor = .systemGray
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20.0
        
        let numberL = UILabel(frame: CGRect(x: 60, y: innerNextY, width: Int(fSW/2), height: 40))
        view.addSubview(numberL)
        
        numberL.text = numberToShow
        
        innerNextY += 50
        
        let sepLine = UIView(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth-20), height: 1))
        view.addSubview(sepLine)
        
        sepLine.backgroundColor = .systemGray
        
        innerNextY += 10
        
        let statusL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(statusL)
        
        statusL.text = "Status"
        
        let stateL = UILabel(frame: CGRect(x: Int(vWidth/2), y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(stateL)
        
        stateL.text = "Success"
        stateL.textAlignment = .right
        stateL.textColor = .systemTeal
        
        innerNextY += 30
        
        let orderL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(orderL)
        
        orderL.text = "Order ID"
        
        let codeL = UILabel(frame: CGRect(x: Int(vWidth/2), y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(codeL)
        
        codeL.text = "KB-8027de03"
        codeL.textAlignment = .right
        
        innerNextY += 35
        
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: vWidth, height: CGFloat(innerNextY))
        
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
        
        let itemsPriceL = UILabel(frame: CGRect(x: Int(vWidth/3 * 2), y: innerNextY, width: Int(vWidth/3 - 10), height: 60))
        view.addSubview(itemsPriceL)
        
        itemsPriceL.text = priceToShow
        itemsPriceL.textAlignment = .right
        itemsPriceL.sizeToFit()
        
        innerNextY += 60
        
        let adminL = UILabel(frame: CGRect(x: 10, y: innerNextY, width: Int(vWidth/2 - 10), height: 30))
        view.addSubview(adminL)
        
        adminL.text = "Admin Fee"
        adminL.sizeToFit()
        
        let adminFeeL = UILabel(frame: CGRect(x: Int(vWidth/3 * 2), y: innerNextY, width: Int(vWidth/3 - 10), height: 30))
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
        
        let totalPayL = UILabel(frame: CGRect(x: Int(vWidth/3 * 2), y: innerNextY, width: Int(vWidth/3 - 10), height: 30))
        view.addSubview(totalPayL)
        
        totalPayL.text = priceToShow
        totalPayL.textColor = .systemOrange
        totalPayL.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        innerNextY += 40
        
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: vWidth, height: CGFloat(innerNextY))
        
        return innerNextY
        
    }
    
    @IBAction func okDone(_ sender: Any) {
        performSegue(withIdentifier: "unwindFrom_endOfPurchase", sender: self)
    }
    
    @IBAction func closeDone(_ sender: Any) {
        performSegue(withIdentifier: "unwindFrom_endOfPurchase", sender: self)
    }
    
    
}
