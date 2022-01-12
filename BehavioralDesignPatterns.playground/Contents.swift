import UIKit

//Behavioral Design Patterns

//1. Strategy

    //Implementation

protocol CreditCardValidator {
    func validate(card: CreditCard) -> Bool
}

class VisaValidator: CreditCardValidator {
    private var isValid: Bool = false
    
    func validate(card: CreditCard) -> Bool{
        if card.number.count == 16 {
            print("I'm here, visa")
            isValid = true
            print("card is valid")
        }
        return isValid
    }
}

class MasterCardValidator: CreditCardValidator {
    private var isValid: Bool = false
    
    func validate(card: CreditCard) -> Bool{
        if card.number.count == 16 {
            print("I'm here, master")
            isValid = true
            print("card is valid")
        }
        return isValid
    }
}

class CreditCard {
    var holderName: String
    var number: String
    var cvv: Int
    
    var validator: CreditCardValidator
    
    init(holderName: String, number: String, cvv: Int, validator: CreditCardValidator) {
        self.holderName = holderName
        self.number = number
        self.cvv = cvv
        self.validator = validator
    }
    
    func validateCard() -> Bool{
        return validator.validate(card: self)
    }
}

    //Using
let visaValidator  = VisaValidator()
let firstCard = CreditCard(holderName: "Noor", number: "1234597891234567", cvv: 999, validator: visaValidator)
print(firstCard.validateCard())


let masterCardValidator = MasterCardValidator()
let secondCard = CreditCard(holderName: "Walid", number: "123456", cvv: 112, validator: masterCardValidator)
print(secondCard.validateCard())
