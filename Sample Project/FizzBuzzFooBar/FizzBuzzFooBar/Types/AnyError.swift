//
//  AnyError.swift
//  SwipeRX
//
//  Created by Zonily Jame Pesquera on 08/08/2018.
//

import Foundation

public struct AnyError: Error {
    public let error: Error

    public init(_ error: Error) {
        if let anyError = error as? AnyError {
            self = anyError
        } else {
            self.error = error
        }
    }
}

extension AnyError: CustomStringConvertible {
    public var description: String {
        return String(describing: self.error)
    }
}

extension AnyError: LocalizedError {
    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        return self.error.localizedDescription
    }

    public var failureReason: String? {
        return (self.error as? LocalizedError)?.failureReason
    }

    public var recoverySuggestion: String? {
        return (self.error as? LocalizedError)?.recoverySuggestion
    }

    public var helpAnchor: String? {
        return (self.error as? LocalizedError)?.helpAnchor
    }
}

extension Swift.Error {
    func toAnyError() -> AnyError {
        if let error = self as? AnyError {
            return error
        }
        return AnyError(self)
    }
}
