//
//  PromoDetailViewController.swift
//  FinAccel
//
//  Created by JAN FREDRICK on 05/09/20.
//  Copyright © 2020 JFSK. All rights reserved.
//

import UIKit

class PromoDetailViewController : UIViewController {
    
    var scrollview : UIScrollView!
    var codeL : UILabel!
    
    let fSW = UIScreen.main.bounds.width
    
    let termsAndConditions = ["Promo berlaku untuk transaksi yang dilakukan diaplikasi terbaru Bukalapak.", "Gunakan kode BIRTHDAY9 untuk dapatkan cashback sebesar 3%.", "Promo hanya berlaku untuk transaksi yang mengunakan metode pengiriman J&T Express dan Ninja Xpress (REG dan FAST).", "Setiap pengguna bisa mengunakan promo sebanyak 1 (satu) kali per hari dan maksimal 2 (dua) kali selama periode Promo.", "Promo bisa digunakan untuk belanja produk kategori apa saja yang ada di Bukalapak, kecuali kategori tiket dan voucher, produk virtual (pulsa, packet data, voucher game, listrik prabayar & pascabayar, tiket event, tiket pesawat, tiket kereta, pembayaran zakat online, pembayaran tagihan listrik, air PDAM, dan BPJS) dan produk keuangan (BukaEmas dan BukaReksa)"]
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        if UIScreen.main.bounds.height >= 812 {
            //add safe area into account
            scrollview = UIScrollView(frame: CGRect(x: 0, y: 40 + 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50 - 40 - 34))
        }else{
            //normal 20 points for status bar
            scrollview = UIScrollView(frame: CGRect(x: 0, y: 20 + 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50 - 20))
        }
        view.addSubview(scrollview)
        
        scrollview.backgroundColor = UIColor.white
        
        var nextY = 0
        
        let topImageView = UIImageView(frame: CGRect(x: 0, y: CGFloat(nextY), width: fSW, height: fSW/16 * 9))
        scrollview.addSubview(topImageView)
        
        topImageView.contentMode = .scaleAspectFill
        topImageView.backgroundColor = .systemPurple
        
        nextY += Int(topImageView.frame.height) + 10
        
        let headerL = UILabel(frame: CGRect(x: 10, y: nextY, width: Int(fSW - 20), height: 50))
        scrollview.addSubview(headerL)
        
        headerL.text = "Discount 20% at Kedai Hape Original, Mall Kota Kasablanka"
        headerL.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        headerL.numberOfLines = 0
        headerL.adjustsFontSizeToFitWidth = true
        
        nextY += 60
        
        let validL = UILabel(frame: CGRect(x: 10, y: nextY, width: Int(fSW - 20), height: 20))
        scrollview.addSubview(validL)
        
        validL.text = "Valid Date"
        validL.textColor = .systemGray
        validL.font = UIFont.systemFont(ofSize: 14)
        
        nextY += 25
        
        let dateRangeL = UILabel(frame: CGRect(x: 10, y: nextY, width: Int(fSW - 20), height: 30))
        scrollview.addSubview(dateRangeL)
        
        dateRangeL.text = "10 - 31 Januari 2019"
        dateRangeL.font = UIFont.systemFont(ofSize: 15)
        
        nextY += 40
        
        let voucherL = UILabel(frame: CGRect(x: 10, y: nextY, width: Int(fSW - 20), height: 20))
        scrollview.addSubview(voucherL)
        
        voucherL.text = "Voucher Code"
        voucherL.textColor = .systemGray
        voucherL.font = UIFont.systemFont(ofSize: 14)
        
        nextY += 25
        
        codeL = UILabel(frame: CGRect(x: 10, y: nextY, width: Int((fSW - 20) * 0.7 - 10), height: 40))
        scrollview.addSubview(codeL)
        
        codeL.text = "BIRTHDAY9"
        codeL.textAlignment = .center
        codeL.backgroundColor = .systemGray
        codeL.layer.borderColor = UIColor.black.cgColor
        codeL.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        let copyB = UIButton(frame: CGRect(x: Int((fSW - 20) * 0.7 + 10), y: nextY, width: Int((fSW - 20) * 0.3), height: 40))
        scrollview.addSubview(copyB)
        
        copyB.setTitle("Copy", for: .normal)
        copyB.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        copyB.layer.borderColor = UIColor.systemGray.cgColor
        copyB.layer.borderWidth = 1.0
        copyB.setTitleColor(.systemOrange, for: .normal)
        copyB.addTarget(self, action: #selector(textCopied(sender:)), for: .touchUpInside)
        
        nextY += 50
        
        let termsL = UILabel(frame: CGRect(x: 10, y: nextY, width: Int(fSW - 20), height: 25))
        scrollview.addSubview(termsL)
        
        termsL.text = "Terms & Conditions"
        termsL.font = UIFont.systemFont(ofSize: 15)
        termsL.textColor = .systemGray
        
        nextY += 30
        
        let textView = UITextView(frame: CGRect(x: 10, y: nextY, width: Int(fSW - 20), height: Int(scrollview.frame.height/2)))
        scrollview.addSubview(textView)
        
        textView.isEditable = false
        
        textView.attributedText = add(stringList: termsAndConditions, font: UIFont.systemFont(ofSize: 14), bullet: "\u{2022}", indentation: 20, lineSpacing: 2, paragraphSpacing: 12, textColor: .black, bulletColor: .black)
        
        nextY += Int(textView.frame.height) + 15
        
        scrollview.contentSize = CGSize(width: Int(fSW), height: nextY)
        
    }
    
    @objc func textCopied(sender: UIButton) {
        print("came here")
        UIPasteboard.general.string = codeL.text
        print(UIPasteboard.general.string!)
    }
    
    func add(stringList: [String],
             font: UIFont,
             bullet: String = "\u{2022}",
             indentation: CGFloat = 20,
             lineSpacing: CGFloat = 2,
             paragraphSpacing: CGFloat = 12,
             textColor: UIColor = .gray,
             bulletColor: UIColor = .green) -> NSAttributedString {

        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor]

        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        //paragraphStyle.firstLineHeadIndent = 0
        //paragraphStyle.headIndent = 20
        //paragraphStyle.tailIndent = 1
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation

        let bulletList = NSMutableAttributedString()
        for string in stringList {
            let formattedString = "\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)

            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))

            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))

            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }

        return bulletList
    }
    
    @IBAction func returnNow(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
