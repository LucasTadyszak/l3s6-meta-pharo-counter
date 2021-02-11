Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#category : #ASTExpressions
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
EMultiplication >> accept: aVisitor [

	^ aVisitor visitMultiplication: self
]

{ #category : #'public access' }
EMultiplication >> evaluate [

	^ right evaluate * left evaluate
]

{ #category : #'public access' }
EMultiplication >> evaluateWith: anObject [
	
	^ (left evaluateWith: anObject) * (right evaluateWith: anObject) 
]

{ #category : #'public access' }
EMultiplication >> operatorString [

	^ ' * '
]
