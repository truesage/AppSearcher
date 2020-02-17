//
//  Result.swift
//  AppSearcher
//
//  Created by JinSung Lee on 2020/02/14.
//  Copyright © 2020 JinSung Lee. All rights reserved.
//

import UIKit

class Result: Codable, CustomStringConvertible {
    var isGameCenterEnabled: Bool?
    var artistViewUrl: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var artworkUrl512: String?
    var screenshotUrls: [String]?
    var supportedDevices: [String]?
    var kind: String?
    var contentAdvisoryRating: String?
    var languageCodesISO2A: [String]?
    var fileSizeBytes: String?
    var averageUserRatingForCurrentVersion: Double?
    var userRatingCountForCurrentVersion: Int?
    var trackContentRating: String?
    var trackViewUrl: String?
    var trackCensoredName: String?
    var trackId: Int?
    var trackName: String?
    var releaseDate: String?
    var currentVersionReleaseDate: String?
    var formattedPrice: String?
    var releaseNotes: String?
    var isVppDeviceBasedLicensingEnabled: Bool?
    var primaryGenreName: String?
    var genreIds: [String]?
    var minimumOsVersion: String?
    var primaryGenreId: Int?
    var sellerName: String?
    var version: String?
    var wrapperType: String?
    var currency: String?
    var artistId: Int?
    var artistName: String?
    var genres: [String]?
    var price: Double?
    var bundleId: String?
    var averageUserRating: Double?
    var userRatingCount: Int?

    var description: String {
        "Result(isGameCenterEnabled: \(isGameCenterEnabled), artistViewUrl: \(artistViewUrl), artworkUrl60: \(artworkUrl60), artworkUrl100: \(artworkUrl100), artworkUrl512: \(artworkUrl512), screenshotUrls: \(screenshotUrls), supportedDevices: \(supportedDevices), kind: \(kind), contentAdvisoryRating: \(contentAdvisoryRating), languageCodesISO2A: \(languageCodesISO2A), fileSizeBytes: \(fileSizeBytes), averageUserRatingForCurrentVersion: \(averageUserRatingForCurrentVersion), userRatingCountForCurrentVersion: \(userRatingCountForCurrentVersion), trackContentRating: \(trackContentRating), trackViewUrl: \(trackViewUrl), trackCensoredName: \(trackCensoredName), trackId: \(trackId), trackName: \(trackName), releaseDate: \(releaseDate), currentVersionReleaseDate: \(currentVersionReleaseDate), formattedPrice: \(formattedPrice), releaseNotes: \(releaseNotes), isVppDeviceBasedLicensingEnabled: \(isVppDeviceBasedLicensingEnabled), primaryGenreName: \(primaryGenreName), genreIds: \(genreIds), minimumOsVersion: \(minimumOsVersion), primaryGenreId: \(primaryGenreId), sellerName: \(sellerName), version: \(version), wrapperType: \(wrapperType), currency: \(currency), artistId: \(artistId), artistName: \(artistName), genres: \(genres), price: \(price), bundleId: \(bundleId), averageUserRating: \(averageUserRating), userRatingCount: \(userRatingCount))"
    }
}
