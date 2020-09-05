//
//  ViewController.swift
//  FinAccel
//
//  Created by JAN FREDRICK on 03/09/20.
//  Copyright © 2020 JFSK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var topTabbedView: UIView!
    @IBOutlet weak var mobileImageView: UIImageView!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var viewForSVs: UIView!
    @IBOutlet weak var promosLabelV: UIView!
    
    var scrollView1, scrollView2 : UIScrollView!
    var tableView1, tableView2 : UITableView!
    var tabButtons : [tabbedButton] = []
    
    let fSW = UIScreen.main.bounds.width
    
    let colors = [UIColor.purple, UIColor.systemBlue, UIColor.systemGray]
    let pulsas = ["25.000", "50.000", "100.000", "150.000", "200.000", "250.000"]
    let packetDatas = [["5 GB", "25.000"], ["10 GB", "50.000"], ["20 GB", "100.000"], ["30 GB", "150.000"], ["40 GB", "200.000"], ["50 GB", "250.000"]]
    
    var promosObjStart : CGFloat = 0
    var promosItemWidth : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        let tabButton1 = tabbedButton(frame: CGRect(x: 0, y: 0, width: fSW/2, height: topTabbedView.frame.height))
        topTabbedView.addSubview(tabButton1)
        
        tabButton1.setTitle("Pulsa", for: .normal)
        tabButton1.setTitleColor(.black, for: .normal)
        tabButton1.addTarget(self, action: #selector(changeTableView(sender:)), for: .touchUpInside)
        
        let tabButton2 = tabbedButton(frame: CGRect(x: fSW/2, y: 0, width: fSW/2, height: topTabbedView.frame.height))
        topTabbedView.addSubview(tabButton2)
        
        tabButton2.setTitle("Packet Data", for: .normal)
        tabButton2.setTitleColor(.black, for: .normal)
        tabButton2.lineView.isHidden = true
        tabButton2.addTarget(self, action: #selector(changeTableView(sender:)), for: .touchUpInside)
        
        tabButtons.append(tabButton1)
        tabButtons.append(tabButton2)
        
        mobileImageView.frame = CGRect(x: 20, y: 20, width: 80, height: 80)
        
        mobileImageView.layer.borderWidth = 2.0
        mobileImageView.layer.borderColor = UIColor.systemBlue.cgColor
        mobileImageView.layer.masksToBounds = true
        mobileImageView.layer.cornerRadius = mobileImageView.frame.height/2
        mobileImageView.backgroundColor = .gray
        
        numberLabel.frame = CGRect(x: 120, y: 20, width: fSW - 120 - 20, height: 35)
        mobileTF.frame = CGRect(x: 120, y: 55, width: fSW - 120 - 20, height: 40)
        
        mobileTF.delegate = self
        mobileTF.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: UIControl.Event.editingChanged)
        
        if UIScreen.main.bounds.height >= 812 {
            viewForSVs.frame = CGRect(x: 0, y: 40 + 50 + 60 + 120, width: fSW, height: UIScreen.main.bounds.height - 40 - 50 - 60 - 120 - 34)
        }else{
            viewForSVs.frame = CGRect(x: 0, y: 20 + 50 + 60 + 120, width: fSW, height: UIScreen.main.bounds.height - 20 - 50 - 60 - 120)
        }
        
        scrollView2 = UIScrollView(frame: CGRect(x: 0, y: viewForSVs.frame.height - (fSW * 0.5), width: fSW, height: fSW * 0.5))
        viewForSVs.addSubview(scrollView2)
        
        scrollView2.showsHorizontalScrollIndicator = false
        scrollView2.delegate = self
        
        ///promosLabelV is without contraints in storyboard, that is why we can change its position
        promosLabelV.frame = CGRect(x: 0, y: scrollView2.frame.origin.y - 50, width: fSW, height: 50)
        
        scrollView1 = UIScrollView(frame: CGRect(x: 0, y: 0, width: fSW, height: viewForSVs.frame.height - scrollView2.frame.height - 50 - 2))
        viewForSVs.addSubview(scrollView1)
        
        scrollView1.isHidden = true
        
        ///Scrollview 1 fillings containing : 2 table views
        tableView1 = UITableView(frame: CGRect(x: 0, y: 0, width: fSW, height: scrollView1.frame.height))
        scrollView1.addSubview(tableView1)
        
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.showsVerticalScrollIndicator = false
        
        tableView2 = UITableView(frame: CGRect(x: fSW, y: 0, width: fSW, height: scrollView1.frame.height))
        scrollView1.addSubview(tableView2)
        
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.showsVerticalScrollIndicator = false
        
        ///Scrollview 2 fillings using : array from 'colors[]'
        let objWidth = fSW * 0.8
        let objHeight = objWidth/2
        let objY = (scrollView2.frame.height - objHeight)/2
        let objSpacing : CGFloat = 20
        
        var objX = objSpacing
        
        for i in 0..<colors.count {
            
            let colorB = UIButton(frame: CGRect(x: objX, y: objY, width: objWidth, height: objHeight))
            scrollView2.addSubview(colorB)
            
            colorB.backgroundColor = colors[i]
            colorB.layer.masksToBounds = true
            colorB.layer.cornerRadius = 20.0
            colorB.addTarget(self, action: #selector(toPromoPage), for: .touchUpInside)
            
            objX += objWidth + objSpacing
            
        }
        
        /// promosObjStart & promosItemWidth for scrollview snap effect usage
        promosObjStart = objSpacing/2
        promosItemWidth = objWidth + objSpacing
        
        scrollView2.contentSize = CGSize(width: objX, height: scrollView2.frame.height)
        
    }
    
    @objc func changeTableView(sender: tabbedButton) {
        
        for button in tabButtons {
            button.lineView.isHidden = true
        }
        
        sender.lineView.isHidden = false
        
        if sender.titleLabel?.text!.lowercased() == "pulsa" {
            scrollView1.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }else{
            scrollView1.setContentOffset(CGPoint(x: fSW, y: 0), animated: true)
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == scrollView2 {
            print(scrollView.contentOffset.x)
            print(scrollView.contentSize.width)
            
            if scrollView.contentOffset.x < promosObjStart + promosItemWidth/2 {
                scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }else if scrollView.contentOffset.x < promosObjStart + promosItemWidth + promosItemWidth/2 {
                scrollView.setContentOffset(CGPoint(x: promosItemWidth, y: 0), animated: true)
            }else{
                scrollView.setContentOffset(CGPoint(x: scrollView.contentSize.width - fSW, y: 0), animated: true)
            }
            
        }
        
    }
    
    @objc func toPromoPage(sender: UIButton) {
        print("promo \(sender.backgroundColor)")
    }
    
    let allowedCharacters = CharacterSet(charactersIn:"0123456789").inverted

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let components = string.components(separatedBy: allowedCharacters)
        let filtered = components.joined(separator: "")
        
        if string == filtered {
            
            return true

        } else {
            
            return false
        }
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text!.count >= 4 {
            scrollView1.isHidden = false
        }else{
            scrollView1.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return pulsas.count
        }else {
            return packetDatas.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCell()
        
        cell.selectionStyle = .none
        
        if tableView == tableView1 {
            cell.headerLabel.text = "Nominal :"
            cell.valueLabel.text = pulsas[indexPath.row]
            cell.buyButton.setTitle("Rp \(pulsas[indexPath.row])", for: .normal)
        }else{
            cell.headerLabel.text = "Data :"
            let nextArray = packetDatas[indexPath.row]
            cell.valueLabel.text = nextArray[0]
            cell.buyButton.setTitle("Rp \(nextArray[1])", for: .normal)
        }
        
        cell.buyButton.addTarget(self, action: #selector(toPurchaseView(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    @objc func toPurchaseView(sender: UIButton) {
        performSegue(withIdentifier: "segue_purchase", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! PurchaseViewController
        nvc.numberToUse = mobileTF.text!
        nvc.imgToUse = mobileImageView.image
    }
    
    @IBAction func returnFromEndOfPurchase(_ segue: UIStoryboardSegue) {
        
    }
}

class tableCell : UITableViewCell {
    var headerLabel, valueLabel : UILabel!
    var buyButton : UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        headerLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 200, height: 25))
        self.contentView.addSubview(headerLabel)
        
        valueLabel = UILabel(frame: CGRect(x: 20, y: 30, width: 200, height: 25))
        self.contentView.addSubview(valueLabel)
        
        buyButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 140, y: 10, width: 120, height: 40))
        self.contentView.addSubview(buyButton)
        
        buyButton.backgroundColor = UIColor.systemBlue
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class tabbedButton : UIButton {
    var lineView : UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lineView = UIView(frame: CGRect(x: 0, y: self.frame.height - 3, width: self.frame.width, height: 3))
        self.addSubview(lineView)
        
        lineView.backgroundColor = UIColor.systemRed
        
    }
    
}

