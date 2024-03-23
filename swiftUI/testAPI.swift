//
//  testapi.swift
//  SwiftfulTest
//
//  Created by Yupeng Wang on 3/23/24.
//

import SwiftUI

struct testapi: View {
    @State private var user: GitHubUser?
    var body: some View {
        VStack(spacing:20) {
            Circle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 100,height: 100)
            Text(user?.login ?? "Login Placeholder")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(user?.bio ?? "Bio Placeholder")
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding()
        .task {
            do {
                user=try await getUser()
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
    func getUser() async throws -> GitHubUser {
        let endpoint="https://api.github.com/users/wyp1125"
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
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

#Preview {
    testapi()
}
struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}


enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

