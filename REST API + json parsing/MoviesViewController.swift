//
//  MoviesViewController.swift
//  REST API + json parsing
//
//  Created by Кунгурцев Эдуард Сергеевич on 08.10.2022.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {

	@IBOutlet weak var tableViewMovies: UITableView!
	
	var arrayOfMovies: [Movie] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		let request = AF.request("https://api.themoviedb.org/3/trending/movie/day?api_key=fc30c5953820dcac4a86a4be32a9fe7a", method: .get)
	
	
	request.responseDecodable(of: MoviesResponced.self) { responce in
		do {
			self.arrayOfMovies =  try responce.result.get().results
			self.tableViewMovies.reloadData()
		} catch {
			
		}
	}
}
}
extension MoviesViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		arrayOfMovies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = arrayOfMovies[indexPath.row].title
		return cell
	}
	
	
}
