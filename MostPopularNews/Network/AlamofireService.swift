//
//  AlamofireService.swift
//  MostPopularNews
//
//  Created by Developer on 07.05.2021.
//

import Alamofire

class AlamofireNetwork {

    static func getNews(filterType: String, completion: @escaping (News) -> Void) {

        let urlParams = [
            "api-key": "Som88U1dOL4DndAc7giDtX1xn5iAiwB4"
        ]

        guard let url = URL(string: APIEndpoint.baseURL + filterType) else { return }

        AF.request(url, parameters: urlParams).validate().responseJSON { (response) in

            switch response.result {
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let news: News = try JSONDecoder().decode(News.self, from: data)
                    completion(news)
                } catch {
                    print(error.localizedDescription)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
