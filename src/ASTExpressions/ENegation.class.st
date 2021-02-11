Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #ASTExpressions
}

{ #category : #'instance creation' }
ENegation class >> expression: anExpression [

	^ self new expression: anExpression 
]

{ #category : #'public access' }
ENegation >> accept: aVisitor [

	^ aVisitor visitNegation: self
]

{ #category : #'public access' }
ENegation >> evaluate [

	^ expression evaluate negated
]

{ #category : #'public access' }
ENegation >> evaluateWith: anObject [ 

	^ self accept: EEvaluatorVisitor new
]

{ #category : #'as yet unclassified' }
ENegation >> expression [
	^ expression
]

{ #category : #'public access' }
ENegation >> expression: anExpression [

	expression := anExpression
]

{ #category : #'public access' }
ENegation >> negated [

	^ expression
]

{ #category : #'public access' }
ENegation >> printOn: aStream [

	aStream 
		nextPutAll: '- ';
		nextPutAll: expression printString. 
]
