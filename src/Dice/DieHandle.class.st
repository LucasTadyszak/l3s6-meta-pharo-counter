Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #initialization }
DieHandle >> addDie: aDie [

	dice add: aDie
]

{ #category : #initialization }
DieHandle >> dice [

	^ dice
]

{ #category : #initialization }
DieHandle >> diceNumber [

	^ dice size
]

{ #category : #initialization }
DieHandle >> initialize [ 

	super initialize.
	dice := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
DieHandle >> maxNumber [
	"Sum of the faces of each die"
	| result |
	result := 0.
	dice do: [ :each | result := result + each faces].
	^ result 
]

{ #category : #initialization }
DieHandle >> roll [

	| result |
	result := 0.
	dice do: [ :each | result := result + each roll ].
	^ result
]
