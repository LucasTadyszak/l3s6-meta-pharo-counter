Class {
	#name : #EMultiplication,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'public access' }
EMultiplication >> evaluate [
	
	^ left evaluate * right evaluate 
]

{ #category : #'public access' }
EMultiplication >> left: anInteger [
	
	left := anInteger 
]

{ #category : #'public access' }
EMultiplication >> right: anInteger [
	
	right := anInteger 
]
