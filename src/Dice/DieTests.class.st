Class {
	#name : #DieTests,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTests >> testInitializeIsOk [

	self assert: Die new faces equals: 6
]

{ #category : #tests }
DieTests >> testRolling [

	| d |
	d := Die new.
	10 timesRepeat: [  self assert: (d roll between: 1 and: 6) ]
]