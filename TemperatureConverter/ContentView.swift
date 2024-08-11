//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Bahar Atbaş on 11.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State var fahrenheaitValue : String = ""
    
    //numberFormeter yine appel'a ait bir kütüphane istediğin sayıyı farklı formatta oluşturur.
    let numberFormeter : NumberFormatter = {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 3
        return numberFormatter
    }()
    
    func convertToCelsius() -> String {
        
        if let value = Double(fahrenheaitValue) {
            
            //measurement objesi oluşturuyoruz apple'ın kendine ait çevirme işlemlerini yapar sıcaklık çevirisi olduğu için <UniteTemperature> yazıyoruz.
            let fahrenheait = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            //fahrenheaitten yeni bir değer oluşturup Celsius'a dönüştürüyor.
            let celciusValue = fahrenheait.converted(to: .celsius)
            return numberFormeter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
            

        }else{
            return "???"
        }
    }
    
    
    var body: some View {
        VStack {
            
            TextField("Value", text: $fahrenheaitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 62))
                .multilineTextAlignment(.center)
                
            
            Text("Fahrenheit")
            Text("İs Actually")
                .foregroundStyle(.gray)
            Text(convertToCelsius())
                .font(Font.system(size: 62))
            Text("Degrees Celsius")
            Spacer()
            
        }
        .foregroundColor(.indigo)
        .font(.title)
        .padding()
    }
}

#Preview {
    ContentView()
}
