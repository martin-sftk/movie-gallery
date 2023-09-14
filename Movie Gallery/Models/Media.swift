//
//  Movie.swift
//  Movie Gallery
//
//  Created by Martín Serrano on 13/09/23.
//

import Foundation

struct Media: Codable {
    let id: Int
    let name: String?
    let title: String?
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let first_air_date: String?
    let vote_average: Double
}

struct MediaResponse: Codable {
    let results : [Media]
}

/*
 MOVIE
 {
   "adult": false,
   "backdrop_path": "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg",
   "id": 346698,
   "title": "Barbie",
   "original_language": "en",
   "original_title": "Barbie",
   "overview": "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
   "poster_path": "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
   "media_type": "movie",
   "genre_ids": [
     35,
     12,
     14
   ],
   "popularity": 3792.387,
   "release_date": "2023-07-19",
   "video": false,
   "vote_average": 7.338,
   "vote_count": 4281
 }
*/

/*
 TV SHOW
 {
   "adult": false,
   "backdrop_path": "/mvoW41kdSxiobGZ9ONL1Tqrpt3h.jpg",
   "id": 114461,
   "name": "Ahsoka",
   "original_language": "en",
   "original_name": "Ahsoka",
   "overview": "Former Jedi Knight Ahsoka Tano investigates an emerging threat to a vulnerable galaxy.",
   "poster_path": "/laCJxobHoPVaLQTKxc14Y2zV64J.jpg",
   "media_type": "tv",
   "genre_ids": [
     10765,
     10759
   ],
   "popularity": 1226.854,
   "first_air_date": "2023-08-22",
   "vote_average": 8.071,
   "vote_count": 184,
   "origin_country": [
     "US"
   ]
 }
*/
