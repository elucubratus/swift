// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

// RUN: %target-swift-frontend %s -emit-sil -verify

// Issue found by http://github.com/valfer (Valerio Ferrucci)

protocol C {
    static func c(o: AnyObject) -> Self?
}
func d<A,B>(a : A, _ f : A -> B) -> B {
} // expected-error {{missing return in a function expected to return 'B'}}
class D<A:C> {
    func e(o: AnyObject) {
        d(o, A.c)
    }
}
