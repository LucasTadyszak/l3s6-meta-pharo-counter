Class {
	#name : #EAddition,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'instance creation' }
EAddition class >> fivePlusThree [

	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	^ self new left: ep1; right: ep2
]

{ #category : #'instance creation' }
EAddition class >> left: anInteger right: anInteger2 [

	^ self new left: anInteger; right: anInteger2
]

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
