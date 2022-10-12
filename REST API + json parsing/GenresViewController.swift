//
//  GenresViewController.swift
//  REST API + json parsing
//
//  Created by Кунгурцев Эдуард Сергеевич on 08.10.2022.
//

import UIKit
import Alamofire

class GenresViewController: UIViewController {

	@IBOutlet weak var tableVIewGenres: UITableView!
	
	var arrayOfGenres: [Genre] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		let request = AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=fc30c5953820dcac4a86a4be32a9fe7a", method: .get)
		
		// Старый метод обрабоки
		
//		request.responseJSON { recievedData in
//			let decoder = JSONDecoder()
//
//			guard let responsedData = recievedData.data else { return }
//
//			do {
//
//				let data = try decoder.decode(GenresResponced.self, from: responsedData)
//				print(data)
//			} catch {
//				print("Model error")
//			}
//		}
		
		//  Новый метод с responseJSON, потому что в 6.0 он исчезнет
		// Но тут все равно через do - catch
		
		request.responseDecodable(of: GenresResponced.self) { responce in
			do {
//				try responce.result.get().genres
				self.arrayOfGenres = try responce.result.get().genres
				self.tableVIewGenres.reloadData()
			} catch {
				
			}
		}
		

    }

}

extension GenresViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		arrayOfGenres.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = arrayOfGenres[indexPath.row].name
		return cell
	}
	
	
}
