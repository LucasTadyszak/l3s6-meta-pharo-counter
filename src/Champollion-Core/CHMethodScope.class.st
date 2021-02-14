Class {
	#name : #CHMethodScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'variables',
		'parentScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #testing }
CHMethodScope >> includesKey: aString [

	^ variables includesKey: aString
]

{ #category : #testing }
CHMethodScope >> initialize [

	super initialize .
	variables := Dictionary new.
]

{ #category : #testing }
CHMethodScope >> parentScope [

	^ parentScope
]

{ #category : #testing }
CHMethodScope >> parentScope: aScope [

	parentScope := aScope
]

{ #category : #testing }
CHMethodScope >> read: aString [

	^ variables at: aString
]

{ #category : #testing }
CHMethodScope >> receiver [

	^ receiver 
]

{ #category : #testing }
CHMethodScope >> receiver: aCHInterpretable [

	receiver := aCHInterpretable
]

{ #category : #testing }
CHMethodScope >> scopeDefining: aString [

	(variables includesKey: aString )
	ifTrue: [ ^ self ].
	^ self parentScope scopeDefining: aString
]

{ #category : #testing }
CHMethodScope >> write: aString withValue: aValue [

	variables at: aString put: aValue
]
