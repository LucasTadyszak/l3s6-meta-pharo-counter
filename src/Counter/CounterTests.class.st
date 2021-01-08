Class {
	#name : #CounterTests,
	#superclass : #TestCase,
	#category : #Counter
}

{ #category : #tests }
CounterTests >> testInitialize [ 
	| c |
	c := Counter new.
	self assert: c count equals: 0 "assert:equals:"
]
