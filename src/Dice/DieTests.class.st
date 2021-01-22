Class {
	#name : #DieTests,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTests >> testAddingADieAndHandle [

	| hd |
	hd := (Die withFaces: 6)
	 + 
	 (DieHandle new 
		addDie: 6;
		yourself).
	self assert: hd dice size equals: 2
]

{ #category : #tests }
DieTests >> testCreationIsOk [

	self assert: (Die withFaces: 20) faces equals: 20
]

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

{ #category : #tests }
DieTests >> testaddTwoDice [

	| hd |
	hd := (Die withFaces: 6) + (Die withFaces: 6).
	self assert: hd dice size equals: 2.
]
