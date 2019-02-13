//
//  CardViewController.swift
//  deckOfOneCardOBJC
//
//  Created by RYAN GREENBURG on 2/13/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func drawCard() {
        RLGCardController.drawNewCard(1) { (card) in
            guard let card = card else { return }
            RLGCardController.fetchImage(for: card, completion: { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            })
        }
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        drawCard()
    }
}
