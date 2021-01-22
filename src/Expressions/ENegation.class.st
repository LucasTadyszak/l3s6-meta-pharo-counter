Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #'public access' }
ENegation >> evaluate [

	^ expression evaluate negated
]

{ #category : #'public access' }
ENegation >> expression: anExpression [

	expression := anExpression
]

{ #category : #'public access' }
ENegation >> negated [

	^ self class new expression: self
]
