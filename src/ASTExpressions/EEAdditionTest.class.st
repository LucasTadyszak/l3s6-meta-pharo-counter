Class {
	#name : #EEAdditionTest,
	#superclass : #TestCase,
	#category : #ASTExpressions
}

{ #category : #tests }
EEAdditionTest >> testEvaluate [ 

	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EAddition new right: ep1; left: ep2) evaluate equals: 8.
]

{ #category : #tests }
EEAdditionTest >> testEvaluationWithClassCreationMessage [

	| ep1 ep2|
	ep1 := EConstant new value: 5.
	ep2 := EConstant  new value: 3.
	self assert: (EAddition left: ep1 right: ep2) evaluate equals: 8. 
]

{ #category : #tests }
EEAdditionTest >> testEvaluationWithNegation [ 

	| ep1 ep2|
	ep1 := ENegation new expression: (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EAddition new right: ep1; left: ep2 ) evaluate equals: -2.
]

{ #category : #tests }
EEAdditionTest >> testNegated [
	
	| ep1 ep2|
	ep1 := EConstant new value: 5.
	ep2 := EConstant  new value: 3.
	self assert: (EAddition left: ep1 right: ep2) evaluate equals: -8.
]

{ #category : #tests }
EEAdditionTest >> testPrinting [

	self assert: (EAddition fivePlusThree) printString equals: '( 5 + 3 )'.
	self assert: (EAddition fivePlusThree) negated printString equals: '-( 5 + 3 )'.
]
