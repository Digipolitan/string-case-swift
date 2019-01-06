//
//  StringCase.swift
//  StringCase
//
//  Created by Benoit BRIATTE on 26/06/2017.
//

import Foundation

public enum StringCaseFormat {

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

public extension String {

    public func caseSplit() -> [String] {
        var res: [String] = []
        let trim = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let alphanumerics = CharacterSet.alphanumerics
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let lowercaseLetters = CharacterSet.lowercaseLetters
        trim.split(separator: " ").forEach { str in
            var previousCase = 0
            var currentCase = 0
            var caseChange = false
            var scalars = UnicodeScalarView()
            for scalar in str.unicodeScalars {
                if alphanumerics.contains(scalar) {
                    if uppercaseLetters.contains(scalar) {
                        currentCase = 1
                    } else if lowercaseLetters.contains(scalar) {
                        currentCase = 2
                    } else {
                        currentCase = 0
                    }
                    let letterInWord = scalars.count
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
                        res.append(String(scalars))
                        scalars.removeAll()
                    }
                    scalars.append(scalar)
                    caseChange = false
                    previousCase = currentCase
                } else {
                    caseChange = true
                }
            }
            if scalars.count > 0 {
                res.append(String(scalars))
            }
        }
        return res
    }

    public func snakeCased(_ format: StringCaseFormat.SnakeCase = .lower) -> String {
        let split = self.caseSplit()
        if format == .lower {
            return split.map { $0.lowercased() }.joined(separator: "_")
        } else if format == .upper {
            return split.map { $0.uppercased() }.joined(separator: "_")
        }
        return split.map { $0.capitalized }.joined(separator: "_")
    }

    public func camelCased(_ format: StringCaseFormat.CamelCase = .default) -> String {
        var res: [String] = []
        for (idx, str) in self.caseSplit().enumerated() {
            if idx == 0 && format == .default {
                res.append(str.lowercased())
                continue
            }
            res.append(str.capitalized)
        }
        return res.joined()
    }
}
