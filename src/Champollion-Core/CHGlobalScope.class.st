Class {
	#name : #CHGlobalScope,
	#superclass : #Object,
	#instVars : [
		'globalsDictionary'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHGlobalScope >> at: aKey put: aValue [

	globalsDictionary at: aKey put: aValue 
]

{ #category : #accessing }
CHGlobalScope >> globalsDictionary: anObject [

	globalsDictionary := anObject 
]

{ #category : #accessing }
CHGlobalScope >> initialize [

	super initialize .
	globalsDictionary := Dictionary new
]

{ #category : #accessing }
CHGlobalScope >> read: aString [

	^ globalsDictionary at: aString 
]

{ #category : #accessing }
CHGlobalScope >> scopeDefining: aString [

	^ self
]
