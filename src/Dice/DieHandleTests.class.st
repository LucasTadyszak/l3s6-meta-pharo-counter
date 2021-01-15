Class {
	#name : #DieHandleTests,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieHandleTests >> testAddingTwiceTheSameDice [

	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber = 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber = 2
]

{ #category : #tests }
DieHandleTests >> testCreationAdding [

	| handle |
	handle := DieHandle new
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	self assert: handle diceNumber = 2
]
