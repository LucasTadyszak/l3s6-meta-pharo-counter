Class {
	#name : #EMultiplication,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'instance creation' }
EMultiplication class >> fiveTimesThree [

	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	^ self new left: ep1; right: ep2
]

{ #category : #'instance creation' }
EMultiplication class >> left: anExp right: anExp2 [

	^ self new left: anExp ; right: anExp2
]

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
