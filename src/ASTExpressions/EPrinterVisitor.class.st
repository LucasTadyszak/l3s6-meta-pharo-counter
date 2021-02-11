Class {
	#name : #EPrinterVisitor,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #'ASTExpressions-Model'
}

{ #category : #visiting }
EPrinterVisitor >> visitAddition: anAddition [

	| left right |
	left := anAddition left accept: self.
	right := anAddition right accept: self.
	^ '(', left , ' + ', right, ')'
]

{ #category : #visiting }
EPrinterVisitor >> visitMultiplication: aMultiplication [

	| left right |
	left := aMultiplication left accept: self.
	right := aMultiplication right accept: self.
	^ '(', left, ' * ', right, ')'
]

{ #category : #visiting }
EPrinterVisitor >> visitNegation: aNegation [

	| subExpression |
	subExpression := aNegation expression accept: self.
	^ subExpression , ' -'
]

{ #category : #visiting }
EPrinterVisitor >> visitVariable: aVariable [

	^ aVariable id asString 
]
