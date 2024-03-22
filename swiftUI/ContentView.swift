//
//  ContentView.swift
//  SwiftfulTest
//
//  Created by Yupeng Wang on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gender: String=""
    @State private var age: String=""
    @State private var air_polution: String=""
    @State private var alcohol_use: String=""
    @State private var dust_allergy: String=""
    @State private var occupational_hazards: String=""
    @State private var genetic_risk: String=""
    @State private var chronic_lung_disease: String=""
    @State private var balanced_diet: String=""
    @State private var obesity: String=""
    @State private var smoking: String=""
    @State private var passive_smoker: String=""
    @State private var chest_pain: String=""
    @State private var coughing_of_blood: String=""
    @State private var fatigue: String=""
    @State private var weight_loss: String=""
    @State private var shortness_of_breath: String=""
    @State private var wheezing: String=""
    @State private var swallowing_difficulty: String=""
    @State private var clubbing_of_finger_nails: String=""
    @State private var frequent_cold: String=""
    @State private var dry_cough: String=""
    @State private var snoring: String=""
    var body: some View {
        NavigationStack {
            Form {
                 ScrollView{
                        Text("Evaluate your lung cancer risk")
                        TextField("Enter gender 1 for male or 2 for femail", text: $gender)
                        TextField("Enter age", text: $age)
                        TextField("Enter air polution level 1-8", text: $air_polution)
                        TextField("Enter alcohol use level 1-8", text: $alcohol_use)
                        TextField("Enter dust allergy level 1-8", text: $dust_allergy)
                        TextField("Enter occupational hazard level 1-8", text: $occupational_hazards)
                        TextField("Enter genetic risk level 1-7", text: $genetic_risk)
                        TextField("Enter chronic lun disease level 1-7", text: $chronic_lung_disease)
                        TextField("Enter balanced diet level 1-7", text: $balanced_diet)
                        TextField("Enter obesity level 1-7", text: $obesity)
                        TextField("Enter smoking level 1-8", text: $smoking)
                        TextField("Enter passive smoker level 1-8", text: $passive_smoker)
                        TextField("Enter chest pain level 1-8", text: $chest_pain)
                        TextField("Enter coughing of blood level 1-9", text: $coughing_of_blood)
                        TextField("Enter fatigue level 1-9", text: $fatigue)
                        TextField("Enter weight loss level 1-8", text: $weight_loss)
                        TextField("Enter shortness of breath level 1-8", text: $shortness_of_breath)
                        TextField("Enter wheezing level 1-8", text: $wheezing)
                        TextField("Enter swalling difficulty level 1-8", text: $swallowing_difficulty)
                        TextField("Enter clubbing of finger nails level 1-9", text: $clubbing_of_finger_nails)
                        TextField("Enter frequent cold level 1-7", text: $frequent_cold)
                        TextField("Enter dry cough level 1-7", text: $dry_cough)
                        TextField("Enter snoring level 1-7", text: $snoring)
                     NavigationLink("Show your risk level") {
                 OutcomeView(gender: $gender,
                             age: $age,
                             air_polution: $air_polution,
                             alcohol_use: $alcohol_use,
                             dust_allergy: $dust_allergy,
                             occupational_hazards: $occupational_hazards,
                             genetic_risk: $genetic_risk,
                             chronic_lung_disease: $chronic_lung_disease,
                             balanced_diet: $balanced_diet,
                             obesity: $obesity,
                             smoking: $smoking,
                             passive_smoker: $passive_smoker,
                             chest_pain: $chest_pain,
                             coughing_of_blood: $coughing_of_blood,
                             fatigue: $fatigue,
                             weight_loss: $weight_loss,
                             shortness_of_breath: $shortness_of_breath,
                             wheezing: $wheezing,
                             swallowing_difficulty: $swallowing_difficulty,
                             clubbing_of_finger_nails: $clubbing_of_finger_nails,
                             frequent_cold: $frequent_cold,
                             dry_cough: $dry_cough,
                             snoring: $snoring
                             )
                     }
                    }
                }
            }.navigationTitle("Form")
        }
}
#Preview {
    ContentView()
}

