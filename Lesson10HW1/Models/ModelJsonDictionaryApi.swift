//
//  ModelJsonDictionaryApi.swift
//  Lesson10HW1
//
//  Created by vaksakalov on 20.06.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

struct ModelJsonDictionaryApi: Decodable {
    let word: String?
    let phonetic: String?
    let origin: String?
    let meaning: Meaning?
    
    func showResult() -> String {
        var resultString = ""
        if let word = word {
            resultString += "Word: \(word)\n\n"
        }
        if let phonetic = phonetic {
            resultString += "Phonetic: \(phonetic)\n\n"
        }
        if let origin = origin {
            resultString += "Origin: \(origin)\n\n"
        }
        if let meaning = meaning {
            resultString += "Meaning: \n\(meaning.showResult())\n"
        }
        return resultString
    }
}

struct Meaning: Decodable {
    let noun: [Example]?
    let adjective: [Example]?
    let adverb: [Example]?
    let intransitiveVerb: [Example]?
    let exclamation: [Example]?
    
    enum CodingKeys: String, CodingKey {
        case noun
        case adjective
        case adverb
        case intransitiveVerb = "intransitive verb"
        case exclamation
    }
    
    func showResult() -> String {
        var resultString = ""
        if let noun = noun {
            resultString += "\nNuon:\n"
            for example in noun {
                resultString += "\(example.showResult())\n"
            }
        }
        if let adjective = adjective {
            resultString += "\nAdjective:\n"
            for example in adjective {
                resultString += "\(example.showResult())\n"
            }
        }
        if let adverb = adverb {
            resultString += "\nAdverb:\n"
            for example in adverb {
                resultString += "\(example.showResult())\n"
            }
        }
        if let intransitiveVerb = intransitiveVerb {
            resultString += "\nIntransitive verb:\n"
            for example in intransitiveVerb {
                resultString += "\(example.showResult())\n"
            }
        }
        if let exclamation = exclamation {
            resultString += "\nExclamation:\n"
            for example in exclamation {
                resultString += "\(example.showResult())\n"
            }
        }
        return resultString
    }
}

struct Example: Decodable {
    let definition: String?
    let example: String?
    let synonyms: [String]?
    
    func showResult() -> String {
        var resultString = ""
        if let definition = definition {
            resultString += "Definition: \(definition)\n\n"
        }
        if let example = example {
            resultString += "Example: \(example)\n\n"
        }
        if let synonyms = synonyms {
            resultString += "Synonyms: \n"
            for item in synonyms {
                resultString += "\(item)\n"
            }
        }
        return resultString
    }
}



