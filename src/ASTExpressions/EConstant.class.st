Class {
	#name : #EConstant,
	#superclass : #EExpression,
	#instVars : [
		'value'
	],
	#category : #ASTExpressions
}

{ #category : #accessing }
EConstant class >> constant3 [
	
	<sampleInstance>
	^ self new value: 3
]

{ #category : #accessing }
EConstant class >> constant5 [

	<sampleInstance>
	^ self new value: 5
]

{ #category : #accessing }
EConstant class >> value: anInteger [ 

	^ self new value: anInteger
]

{ #category : #'as yet unclassified' }
EConstant >> * anEConstant [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
EConstant >> + anEConstant [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
EConstant >> accept: aVisitor [

	^ aVisitor visitConstant: self
]

{ #category : #accessing }
EConstant >> evaluate [ 

	^ value 
]

{ #category : #accessing }
EConstant >> evaluateWith: anObject [ 

	^ value 
]

{ #category : #accessing }
EConstant >> negated [

	^ ENegation new expression: self 
]

{ #category : #accessing }
EConstant >> printOn: aStream [

	aStream nextPutAll: value printString 
]

{ #category : #accessing }
EConstant >> value: anInteger [ 

	value := anInteger
]
