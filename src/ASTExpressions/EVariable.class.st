Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #ASTExpressions
}

{ #category : #accessing }
EVariable class >> id: aId [

	^ self new 
	id: aId;
	yourself
]

{ #category : #accessing }
EVariable >> accept: aVisitor [

	^ aVisitor visitVariable: self
]

{ #category : #accessing }
EVariable >> evaluateWith: aBindingDictionary [

	^ aBindingDictionary at: id
]

{ #category : #'as yet unclassified' }
EVariable >> id [
	^ id
]

{ #category : #accessing }
EVariable >> id: aSymbol [

	id := aSymbol
]

{ #category : #accessing }
EVariable >> printOn: aStream [

	aStream nextPutAll: id asString
]
