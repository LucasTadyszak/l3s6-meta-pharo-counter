Class {
	#name : #EEvaluatorVisitor,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #ASTExpressions
}

{ #category : #accessing }
EEvaluatorVisitor >> at: aId put: aValue [ 

	bindings at: aId put: aValue
]

{ #category : #accessing }
EEvaluatorVisitor >> bindings: aDictionary [

	bindings := aDictionary

	
]

{ #category : #visiting }
EEvaluatorVisitor >> visitAddition: anEAddition [

	| evaluationOfLeft evaluationOfRight |
	evaluationOfLeft := anEAddition left accept: self.
	evaluationOfRight := anEAddition right accept: self.
	^ evaluationOfLeft + evaluationOfRight
]

{ #category : #visiting }
EEvaluatorVisitor >> visitConstant: aConstant [

	^ aConstant value 
]

{ #category : #visiting }
EEvaluatorVisitor >> visitMultiplication: anEMultiplication [

	| evaluationOfLeft evaluationOfRight|
	evaluationOfLeft := anEMultiplication  left accept: self.
	evaluationOfRight := anEMultiplication right accept: self.
	^ evaluationOfLeft * evaluationOfRight
]

{ #category : #visiting }
EEvaluatorVisitor >> visitNegation: anENegation [

	|aNumber|
	aNumber := anENegation expression accept: self.
	^ aNumber negated
]

{ #category : #visiting }
EEvaluatorVisitor >> visitVariable: aVariable [

	^ bindings at: aVariable id
]
