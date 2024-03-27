//
//  OutcomeView.swift
//  SwiftfulTest
//
//  Created by Yupeng Wang on 3/21/24.
//

import SwiftUI

struct OutcomeView: View {
    @Binding var age: String
    @Binding var gender: String
    @Binding var air_polution: String
    @Binding var alcohol_use: String
    @Binding var dust_allergy: String
    @Binding var occupational_hazards: String
    @Binding var genetic_risk: String
    @Binding var chronic_lung_disease: String
    @Binding var balanced_diet: String
    @Binding var obesity: String
    @Binding var smoking: String
    @Binding var passive_smoker: String
    @Binding var chest_pain: String
    @Binding var coughing_of_blood: String
    @Binding var fatigue: String
    @Binding var weight_loss: String
    @Binding var shortness_of_breath: String
    @Binding var wheezing: String
    @Binding var swallowing_difficulty: String
    @Binding var clubbing_of_finger_nails: String
    @Binding var frequent_cold: String
    @Binding var dry_cough: String
    @Binding var snoring: String
    @State private var pred: Prediction?
    var body: some View {
        let query=age+","+gender+","+air_polution+","+alcohol_use+","+dust_allergy+","+occupational_hazards+","+genetic_risk+","+chronic_lung_disease+","+balanced_diet+","+obesity+","+smoking+","+passive_smoker+","+chest_pain+","+coughing_of_blood+","+fatigue+","+weight_loss+","+shortness_of_breath+","+wheezing+","+swallowing_difficulty+","+clubbing_of_finger_nails+","+frequent_cold+","+dry_cough+","+snoring

        VStack(spacing:20) {
            Circle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 100,height: 100)
            Text("Predicted level of lung cancer risks")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(pred?.outcome ?? "Login Placeholder")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding()
        .task {
            do {
                pred=try await getPrediction(queryStr: query)
            } catch GHError.invalidURL{
                print("invalid URL")
            } catch GHError.invalidResponse{
                print("invalid response")
            } catch GHError.invalidData{
                print("invalid data")
            } catch {
                print("unexpected error")
            }
        }
    }
    func getPrediction(queryStr: String) async throws -> Prediction {
        let endpoint="https://b1evxcq7v3.execute-api.us-east-1.amazonaws.com/test/lung-cancer?data="+queryStr
        print(endpoint)
        guard let url=URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        let (data, response)=try await URLSession.shared.data(from: url)
        guard let response=response as? HTTPURLResponse, response.statusCode == 200 else{
            throw GHError.invalidResponse
        }
        do {
            let decoder=JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Prediction.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

struct Prediction: Codable {
    let outcome: String
}

