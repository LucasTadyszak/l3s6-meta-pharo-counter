Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: anInteger [ 
	"Create and initialize a new die with anInteger faces."
	| instance |
	instance := self new.
	instance faces: anInteger.
	^ instance 
	
]

{ #category : #acccessing }
Die >> faces [

	^ faces
]

{ #category : #accessing }
Die >> faces: anInteger [

	faces := anInteger
]

{ #category : #initialization }
Die >> initialize [ 

	super initialize.
	faces := 6
]

{ #category : #'as yet unclassified' }
Die >> roll [

	^ faces atRandom 
]
