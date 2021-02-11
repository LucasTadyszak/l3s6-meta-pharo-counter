Class {
	#name : #EAddition,
	#superclass : #EBinaryExpression,
	#category : #ASTExpressions
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
EAddition >> accept: aVisitor [

	^ aVisitor visitAddition: self
]

{ #category : #'public access' }
EAddition >> evaluate [ 

	^ right evaluate + left evaluate
]

{ #category : #'public access' }
EAddition >> evaluateWith: anObject [

	^ self accept: EEvaluatorVisitor new
]

{ #category : #'public access' }
EAddition >> operatorString [

	^ ' + '
]
