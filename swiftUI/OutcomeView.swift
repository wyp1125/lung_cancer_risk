//
//  OutcomeView.swift
//  SwiftfulTest
//
//  Created by Yupeng Wang on 3/21/24.
//

import SwiftUI

struct OutcomeView: View {
    @Binding var gender: String
    @Binding var age: String
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
    var body: some View {
        Text("""
            gender: \(gender)
            age: \(age)
            air_polution: \(air_polution)
            """)
    }
}
