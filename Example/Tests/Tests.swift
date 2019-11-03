// https://github.com/Quick/Quick

import Quick
import Nimble
import SimpleCCForm

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        
        describe("Card Manager") {
            it("Can identify Visa") {
                let result = CardManager.calculateCardType(cardNumber: "4")
                expect(result.count) >= 1
                expect(result.contains(where: { (card) -> Bool in
                    card.name == "Visa"
                })) == true
                
            }
            
            it("Can identify Amex") {
                let result = CardManager.calculateCardType(cardNumber: "37")
                expect(result.count) >= 1
                expect(result.contains(where: { (card) -> Bool in
                    card.name == "American Express"
                })) == true
                
            }
            
            it("Can identify Bankcard") {
                let result = CardManager.calculateCardType(cardNumber: "560223")
                expect(result.count) >= 1
                expect(result.contains(where: { (card) -> Bool in
                    card.name == "Bankcard"
                })) == true
                
            }
            
            it("Can identify Discover") {
                let result = CardManager.calculateCardType(cardNumber: "622127")
                expect(result.count) >= 1
                expect(result.contains(where: { (card) -> Bool in
                    card.name == "Discover Card"
                })) == true
                
            }
            
            it("Can identify Mastercard") {
                let result = CardManager.calculateCardType(cardNumber: "51")
                expect(result.count) >= 1
                expect(result.contains(where: { (card) -> Bool in
                    card.name == "Mastercard"
                })) == true
                
            }
        }
        
        /*
        describe("these will fail") {
            
            context("these will pass") {

                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
         */
    }
}
