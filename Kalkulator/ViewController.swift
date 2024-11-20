

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    var obliczanie:String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        clean()
    }
    
    func clean()
    {
        obliczanie = " "
        calculatorWorkings.text = " "
        calculatorResults.text = " "
        
        
    }
    
    

    
    func dodajznak(liczba: String)
    {
        obliczanie = obliczanie + liczba
        calculatorWorkings.text = obliczanie
    }

    @IBAction func deletee(_ sender: Any) {
        if(!obliczanie.isEmpty)
        {
            obliczanie = " "
            calculatorWorkings.text = obliczanie
        }
    }
    
    @IBAction func percente(_ sender: Any) {
        dodajznak(liczba: "%")
    }
    
    	
    @IBAction func divide(_ sender: Any) {
        dodajznak(liczba: "÷")
    }
    
    @IBAction func multiply(_ sender: Any) {
        dodajznak(liczba: "*")
    }
    
    @IBAction func subtract(_ sender: Any) {
        dodajznak(liczba: "-")
    }
    
    @IBAction func add(_ sender: Any) {
        dodajznak(liczba: "+")
    }
    
    @IBAction func equals(_ sender: Any) {
        if(validInput()){
            let sprLiczbaProcent = obliczanie.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: obliczanie)
            let wynik = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(wynik: wynik)
            calculatorResults.text=resultString
        }
        else
        {
            let alert = UIAlertController(
                title:"Invalid ",
                message: "ERR",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true,completion: nil)
        }
        
    }
    func validInput() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in obliczanie
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            if(index == obliczanie.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
               if(index - previous == 1)
                {
                   return false
               }
            }
            previous = index
        }
        
        return true
    }
    func specialCharacter (char:Character)-> Bool
    {
        if(char=="*")
        {
            return true
        }
        if(char=="/")
        {
            return true
        }
        if(char=="+")
        {
            return true
        }
        return false
        
    }
    func formatResult(wynik: Double) -> String
    {
        if(wynik.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", wynik)
        }
        else
        {
            return String(format: "%.2f", wynik)
        }
    }
    

    @IBAction func dot(_ sender: Any) {
        dodajznak(liczba: ".")
    }
    
    @IBAction func zero(_ sender: Any) {
        dodajznak(liczba: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        dodajznak(liczba: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        dodajznak(liczba: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        dodajznak(liczba: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        dodajznak(liczba: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        dodajznak(liczba: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        dodajznak(liczba: "6")
    }
    
    @IBAction func seven(_ sender: Any) {
        dodajznak(liczba: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
        dodajznak(liczba: "8")
    }
    
    @IBAction func nine(_ sender: Any) {
        dodajznak(liczba: "9")
    }
}

