//
//  SS_Metadata.swift
//  testFileInfo
//
//  Created by Blake Martin on 5/20/18.
//  Copyright © 2018 Blake Martin. All rights reserved.
//

import AVFoundation

class SS_Metadata {
    
    // Audio File Metadata Items
    class func audioFileData(parmURL: URL) -> [AVMetadataItem] {
        
        var returnMetadata: [AVMetadataItem]
        
        let playerItem = AVPlayerItem(url: parmURL as URL)
        returnMetadata = playerItem.asset.commonMetadata

        return returnMetadata
        
    }
    
    
    // Extract Common Metadata
    class func extractCommon(parmMetadata: [AVMetadataItem], parmKey: AVMetadataKey) -> String  {

        var returnValue: String

        var tempValue: String = ""
        let metadataItem = AVMetadataItem.metadataItems(from: parmMetadata, withKey: parmKey, keySpace: AVMetadataKeySpace.common).first
        
        do {
            if metadataItem != nil {
                tempValue = try extractString(parmMetadataItem: metadataItem!)
            } else {
                tempValue = "unknown"
            }
        }
        catch {
            tempValue = "unknown type"
//            print(error)
        }
        
        returnValue = tempValue

        return returnValue

    }

    // Extract String
    class func extractString(parmMetadataItem: AVMetadataItem) throws -> String  {
        
        var returnString: String = ""
        
        enum MyError: Error {
            case runtimeError(String)
        }
        
        guard let tempValue: String = parmMetadataItem.value as? String else {
            returnString = "unknown"
            throw MyError.runtimeError("unknown data type")
        }
        
        returnString = tempValue
        
        return returnString
        
    }
    
    
    
    
    // Audio Title
    class func audioTitle(parmMetadata: [AVMetadataItem]) -> String {

        var returnValue: String

        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyTitle)

        return returnValue
        
    }
    
    
    // Audio Creator
    class func audioCreator(parmMetadata: [AVMetadataItem]) -> String {
        
        var returnValue: String
        
        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyCreator)

        return returnValue
        
    }
    
    // Audio Publisher
    class func audioPublisher(parmMetadata: [AVMetadataItem]) -> String {
        
        var returnValue: String
        
        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyPublisher)
        
        return returnValue
        
    }
    
    // Album Name
    class func audioAlbumName(parmMetadata: [AVMetadataItem]) -> String {
        
        var returnValue: String
        
        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyAlbumName)
        
        return returnValue
        
    }
    
    // Album Artist
    class func audioArtist(parmMetadata: [AVMetadataItem]) -> String {
        
        var returnValue: String
        
        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyArtist)
        
        return returnValue
        
    }
    
    // Album Type
    class func audioType(parmMetadata: [AVMetadataItem]) -> String {
        
        var returnValue: String
        
        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyType)
        
        return returnValue
        
    }
    
    
    // Audio Copyrightsx
    class func audioCopyrights(parmMetadata: [AVMetadataItem]) -> String {
        
        var returnValue: String
        
        returnValue = extractCommon(parmMetadata: parmMetadata, parmKey: AVMetadataKey.commonKeyCopyrights)
        
        return returnValue
        
    }
    
    
}


