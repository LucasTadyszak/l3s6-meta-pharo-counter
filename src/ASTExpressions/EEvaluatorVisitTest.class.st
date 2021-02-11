Class {
	#name : #EEvaluatorVisitTest,
	#superclass : #TestCase,
	#category : #ASTExpressions
}

{ #category : #tests }
EEvaluatorVisitTest >> testVisitAdditionToAdditionResult [

	| expression res |
	expression := EAddition 
		left: (EConstant value: 1)
		right: (EConstant value: 2).
	res := expression accept: EEvaluatorVisitor new.
	self assert: res equals: 3
]

{ #category : #tests }
EEvaluatorVisitTest >> testVisitConstantToConstantValue [

	| constant res |
	constant := EConstant value: 3.
	res := constant accept: EEvaluatorVisitor new.
	self assert: res equals: 3
]

{ #category : #tests }
EEvaluatorVisitTest >> testVisitMultiplicationToMultiplicationResult [

	| expression res |
	expression := EMultiplication 
		left: (EConstant value: 3)
		right: (EConstant value: 5).
	res := expression accept: EEvaluatorVisitor new.
	self assert: res equals: 15
]

{ #category : #tests }
EEvaluatorVisitTest >> testVisitNegationReturnsNegatedConstant [

	| expression res |
	expression := (EConstant value: 5) negated.
	res := expression accept: EEvaluatorVisitor new.
	self assert: res equals: -5
]
