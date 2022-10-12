//
//  GenresModels.swift
//  REST API + json parsing
//
//  Created by Кунгурцев Эдуард Сергеевич on 08.10.2022.
//

import Foundation

// MARK: - Welcome
struct GenresResponced: Codable {
	let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
	let id: Int
	let name: String
}
