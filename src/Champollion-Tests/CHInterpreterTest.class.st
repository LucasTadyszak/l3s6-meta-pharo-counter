Class {
	#name : #CHInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'receiver',
		'collaborator'
	],
	#category : #'Champollion-Tests'
}

{ #category : #testing }
CHInterpreterTest >> executeSelector: aSymbol [

	^ self executeSelector: aSymbol withReceiver: receiver
]

{ #category : #testing }
CHInterpreterTest >> executeSelector: aSymbol withReceiver: aReceiver [

	| ast |
	ast := (CHInterpretable >> aSymbol ) parseTree .
	^ self interpreter execute: ast withReceiver: aReceiver
]

{ #category : #testing }
CHInterpreterTest >> interpreter [

	^ CHInterpreter new
]

{ #category : #testing }
CHInterpreterTest >> peanoToInt: aPeanoNumber [

	"Helper method to transform a peano number to a normal Pharo integer"
	^ aPeanoNumber 
	ifEmpty: [ 0 ]
	ifNonEmpty: [ 1 + (self peanoToInt: aPeanoNumber first ) ]
]

{ #category : #testing }
CHInterpreterTest >> setUp [ 

	super setUp.
	receiver := CHInterpretable new.
	interpreter := CHInterpreter new.
	collaborator := CHInterpretable new.
	receiver collaborator: collaborator 
]

{ #category : #testing }
CHInterpreterTest >> testArgumentAccess [

	receiver x: 200.
	collaborator x: 300.
	self executeSelector: #changeCollaboratorWithArgument .
	self assert: receiver x equals: 200.
	self assert: collaborator x equals: 500
]

{ #category : #testing }
CHInterpreterTest >> testAssignmentReturnsAssignedValue [

	self assert: (self executeSelector: #store100IntoX) equals: 100
]

{ #category : #testing }
CHInterpreterTest >> testBalancingStack [

	self assert: (self executeSelector: #setXAndMessage ) equals: 1000
]

{ #category : #testing }
CHInterpreterTest >> testDoesNotUnderstandReifiesMessageWithArguments [

	self assert: (self executeSelector: #sendMessageNotUnderstood ) arguments equals: #( 17 27)
]

{ #category : #testing }
CHInterpreterTest >> testDoesNotUnderstandReifiesMessageWithSelector [

	self assert: (self executeSelector: #sendMessageNotUnderstood ) selector equals: #messageIDoNotUnderstandWithArg1:withArg2: 
]

{ #category : #testing }
CHInterpreterTest >> testEvaluationOrder [

	| argumentEvaluationOrder |
	argumentEvaluationOrder := self executeSelector: #returnEvaluationOrder .
	self assert: (self peanoToInt: receiver evaluationOrder ) equals: 0.
	self assert: (argumentEvaluationOrder collect: [ :peano | self peanoToInt: peano ]) equals: #(1 2 3) 
]

{ #category : #testing }
CHInterpreterTest >> testFailingPrimitive [

	self assert: (self executeSelector: #callingFailingPrimitive ) equals: 'failure'
]

{ #category : #testing }
CHInterpreterTest >> testInstanceVariableStoreInMethodActivationDoesNotChangeSender [

	receiver x: 200.
	collaborator x: 300.
	"changeCollaboratorX will replace collaborator's x but not the receiver's"
	self executeSelector: #changeCollaboratorX .
	self assert: receiver x equals: 200.
	self assert: collaborator x equals: 100
]

{ #category : #testing }
CHInterpreterTest >> testLookupInSuperclass [

	self assert: (self executeSelector: #sendMessageInSuperclass ) equals: 5
]

{ #category : #testing }
CHInterpreterTest >> testLookupRedefineMethod [

	self assert: (self executeSelector: #overriddenMethod ) equals: 5
]

{ #category : #testing }
CHInterpreterTest >> testLookupSuperMessage [

	self assert: (self executeSelector: #doesSuperLookupFromSuperclass )
]

{ #category : #testing }
CHInterpreterTest >> testReturnBoolean [

	"Do not use deny: to make explicit that we expect the value false"
	self
		assert: (self executeSelector: #returnBoolean  )
		equals: false
]

{ #category : #testing }
CHInterpreterTest >> testReturnEmptyLiteralArray [

	self
		assert: (self executeSelector: #returnEmptyLiteralArray )
		equals: #()
]

{ #category : #testing }
CHInterpreterTest >> testReturnFloat [

	self
		assert: (self executeSelector: #returnFloat  )
		equals: 3.14
]

{ #category : #testing }
CHInterpreterTest >> testReturnGlobal [

	| globalObject |
	globalObject := Object new.
	interpreter globalEnvironmentAt: #Global put: globalObject .
	self assert: (self executeSelector: #returnGlobal) equals: globalObject 
]

{ #category : #testing }
CHInterpreterTest >> testReturnInstanceVariableRead [

	receiver x: 100.
	self assert: (self executeSelector: #returnX withReceiver: receiver ) equals: 100
]

{ #category : #testing }
CHInterpreterTest >> testReturnInteger [

	self
		assert: (self executeSelector: #returnInteger )
		equals: 5
]

{ #category : #testing }
CHInterpreterTest >> testReturnRecursiveLiteralArray [

	self
		assert: (self executeSelector: #returnRecursiveLiteralArray  )
		equals: #(true 1 #('ahah'))
]

{ #category : #testing }
CHInterpreterTest >> testReturnSelf [

	"Convey our intention of checking identity by using an explicit identity check"
	self assert: (self executeSelector: #returnSelf withReceiver: receiver ) == receiver 
]

{ #category : #testing }
CHInterpreterTest >> testReturnSuper [

	"Convey our intention of checking identity by using an explicit identity check"
	self assert: (self executeSelector: #returnSuper withReceiver: receiver ) == receiver
]

{ #category : #testing }
CHInterpreterTest >> testSelfSend [

	receiver x: 100.
	self assert: (self executeSelector: #sendMessageReturnX ) equals:100
]

{ #category : #testing }
CHInterpreterTest >> testSmallIntAddPrimitive [

	self assert: (self executeSelector: #smallintAdd ) equals: 6
]

{ #category : #testing }
CHInterpreterTest >> testStore100IntoX [

	receiver x: 17.
	self executeSelector: #store100IntoX .
	self assert: receiver x equals: 100
]

{ #category : #testing }
CHInterpreterTest >> testUnassignedTempHasNilValue [

	self assert: (self executeSelector: #returnUnassignedTemp ) equals: nil
]

{ #category : #testing }
CHInterpreterTest >> testWriteTemporaryVariable [

	self assert: (self executeSelector: #writeTemporaryVariable ) equals: 100
]

{ #category : #testing }
CHInterpreterTest >> visitMessageNode: aMessageNode [

	| newReceiver method args lookupClass pragma |
	newReceiver := self visitNode: aMessageNode receiver.
	args := aMessageNode arguments collect: [ :each | self visitNode: each ].
	lookupClass := aMessageNode receiver isSuper 
		ifTrue: [ self currentMethod methodClass superclass ]
		ifFalse: [ newReceiver class ].
	method := self lookup: aMessageNode selector fromClass: lookupClass.
	^ self executeMethod: method withReceiver: newReceiver  andArguments: args
]
