Class {
	#name : #EExpression,
	#superclass : #Object,
	#category : #ASTExpressions
}

{ #category : #accessing }
EExpression >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : #accessing }
EExpression >> evaluateWith: anObject [

	| visitor |
	visitor := EEvaluatorVisitor new.
	visitor bindings: anObject.
	^ self accept: visitor.
]

{ #category : #accessing }
EExpression >> negated [

	^ ENegation new expression: self
]
