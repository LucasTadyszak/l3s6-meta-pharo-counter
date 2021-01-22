Class {
	#name : #EAddition,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'public access' }
EAddition >> evaluate [ 

	^ left evaluate + right evaluate 
]

{ #category : #'public access' }
EAddition >> left: anInteger [

	left := anInteger
]

{ #category : #'public access' }
EAddition >> right: anInteger [ 

	right:= anInteger
]
