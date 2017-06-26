//
//  StringCase.swift
//  StringCase
//
//  Created by Benoit BRIATTE on 26/06/2017.
//

import Foundation

public extension String {

    public enum CaseFormat {

        public enum SnakeCase {
            case lower
            case upper
            case capitalized
        }

        public enum CamelCase {
            case `default`
            case capitalized
        }
    }

    public func snakeCased(_ format: CaseFormat.SnakeCase = .lower) -> String {
        let alphanumerics = CharacterSet.alphanumerics
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let lowercaseLetters = CharacterSet.lowercaseLetters
        var underscore = false
        var previousCase = 0 // 0 none, 1 upper, 2 lower, 3 other
        var currentCase = 0 // 0 none, 1 upper, 2 lower, 3 other
        var letterInWord = 0
        var res = ""
        for ch in self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
            for scalar in ch.unicodeScalars {
                if alphanumerics.contains(scalar) {
                    if uppercaseLetters.contains(scalar) {
                        currentCase = 1
                    } else if lowercaseLetters.contains(scalar) {
                        currentCase = 2
                    } else {
                        currentCase = 0
                    }
                    var str = String(scalar)
                    var caseChange = underscore
                    if !caseChange && letterInWord > 0 {
                        if currentCase != previousCase {
                            if previousCase == 1 {
                                if letterInWord > 1 {
                                    caseChange = true
                                }
                            } else {
                                caseChange = true
                            }
                        }
                    }
                    if caseChange {
                        res += "_"
                        letterInWord = 0
                    }
                    letterInWord += 1
                    if format == .capitalized {
                        if currentCase != 1 {
                            if caseChange || previousCase == 0 {
                                str = str.uppercased()
                            }
                        } else if !caseChange {
                            str = str.lowercased()
                        }
                    } else if format == .upper && currentCase != 1{
                        str = str.uppercased()
                    } else if format == .lower && currentCase != 2 {
                        str = str.lowercased()
                    }
                    res += str
                    underscore = false;
                    previousCase = currentCase;
                } else {
                    underscore = true
                }
            }
        }
        return res
    }

    public func camelCased(_ format: CaseFormat.CamelCase = .default) -> String {
        var uppercase = format == .capitalized;
        var res = ""
        let alphanumerics = CharacterSet.alphanumerics
        let lowercaseLetters = CharacterSet.lowercaseLetters
        for ch in self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
            for scalar in ch.unicodeScalars {
                if alphanumerics.contains(scalar) {
                    var str = String(scalar)
                    if uppercase {
                        if lowercaseLetters.contains(scalar) {
                            str = str.uppercased()
                        }
                        uppercase = false
                    } else if res.count == 0 {
                        str = str.lowercased()
                    }
                    res += str
                } else {
                    uppercase = true
                }
            }
        }
        return res
    }
}

