Class {
	#name : #CHInterpretable,
	#superclass : #CHInterpretableSuperclass,
	#instVars : [
		'x',
		'collaborator',
		'evaluationOrder',
		'current'
	],
	#category : #'Champollion-Core'
}

{ #category : #visiting }
CHInterpretable >> callingFailingPrimitive [

	^ self failingPrimitive 
]

{ #category : #visiting }
CHInterpretable >> changeCollaboratorWithArgument [

	collaborator x: 500
]

{ #category : #visiting }
CHInterpretable >> changeCollaboratorX [

	collaborator store100IntoX 
]

{ #category : #visiting }
CHInterpretable >> collaborator [

	^ collaborator 
]

{ #category : #visiting }
CHInterpretable >> collaborator: anObject [ 

	collaborator := anObject
]

{ #category : #visiting }
CHInterpretable >> currentMethod [

	^ self tempAt: #___method
]

{ #category : #visiting }
CHInterpretable >> doesNotUnderstand: aMessage [

	^ aMessage
]

{ #category : #visiting }
CHInterpretable >> doesSuperLookupFromSuperclass [

	^ super isInSuperclass
]

{ #category : #visiting }
CHInterpretable >> evaluateReceiver [

	evaluationOrder := self next.
	^ self
]

{ #category : #visiting }
CHInterpretable >> evaluationOrder [

	^ evaluationOrder 
]

{ #category : #visiting }
CHInterpretable >> failingPrimitive [

	<primitive: 1>
	^ 'failure'
]

{ #category : #visiting }
CHInterpretable >> initialize [

	super initialize .
	current := { "empty " }.
]

{ #category : #visiting }
CHInterpretable >> isInSuperclass [

	^ false
]

{ #category : #visiting }
CHInterpretable >> messageArg1: arg1 arg2: arg2 arg3: arg3 [

	^ { arg1 . arg2 . arg3  }
]

{ #category : #visiting }
CHInterpretable >> next [

	"Implement a stram as an increment in terms of Peano axiom"
	| result |
	result := current.
	"We increment the counter"
	current := { current }.
	"we return the previous result"
	^ result 
]

{ #category : #visiting }
CHInterpretable >> overriddenMethod [

	^ super overriddenMethod
]

{ #category : #visiting }
CHInterpretable >> returnBoolean [

	^ false
]

{ #category : #visiting }
CHInterpretable >> returnEmptyLiteralArray [

	^ #()
]

{ #category : #visiting }
CHInterpretable >> returnEvaluationOrder [

	^ self evaluateReceiver 
	messageArg1: self next 
	arg2: self next 
	arg3: self next 
]

{ #category : #visiting }
CHInterpretable >> returnFloat [

	^ 3.14
]

{ #category : #visiting }
CHInterpretable >> returnGlobal [

	^ Global
]

{ #category : #visiting }
CHInterpretable >> returnInteger [

	^ 5
]

{ #category : #visiting }
CHInterpretable >> returnRecursiveLiteralArray [

	^ #(true 1 #('ahah'))
]

{ #category : #visiting }
CHInterpretable >> returnSelf [

	^ self
]

{ #category : #visiting }
CHInterpretable >> returnSuper [

	^ super
]

{ #category : #visiting }
CHInterpretable >> returnUnassignedTemp [

	| temp |
	^ temp
]

{ #category : #visiting }
CHInterpretable >> returnX [

	^ x
]

{ #category : #visiting }
CHInterpretable >> sendMessageInSuperclass [

	^ self methodInSuperclass
]

{ #category : #visiting }
CHInterpretable >> sendMessageNotUnderstood [

	^ self messageIDoNotUnderstandWithArg1: 17 withArg2: 27
]

{ #category : #visiting }
CHInterpretable >> sendMessageReturnX [

	^ self returnX
]

{ #category : #visiting }
CHInterpretable >> setXAndMessage [

	x := 1000.
	collaborator returnX.
	^ x
]

{ #category : #visiting }
CHInterpretable >> store100IntoX [

	^ x := 100
]

{ #category : #visiting }
CHInterpretable >> writeTemporaryVariable [

	| temp |
	temp := 100.
	^ temp
]

{ #category : #visiting }
CHInterpretable >> x [

	^ x
]

{ #category : #visiting }
CHInterpretable >> x: anInteger [

	x := anInteger 
]
