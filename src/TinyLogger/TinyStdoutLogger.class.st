"
I am a logger that will log the informations in the StdOut.

I should not be used directly but via a `TinyLogger`.

## Examples

```
	(TinyStdoutLogger for: aTinyLogger) record: 'First log'
```
"
Class {
	#name : #TinyStdoutLogger,
	#superclass : #TinyLeafLogger,
	#instVars : [
		'streamClassProvider'
	],
	#category : #'TinyLogger-Core'
}

{ #category : #accessing }
TinyStdoutLogger class >> kind [
	<ignoreForCoverage>
	^ 'stdout'
]

{ #category : #logging }
TinyStdoutLogger >> clearLog [
	"We do nothing here since we cannot clear stdout"

	
]

{ #category : #initialization }
TinyStdoutLogger >> initialize [
	super initialize.
	streamClassProvider := Stdio 
]

{ #category : #logging }
TinyStdoutLogger >> record: aString [
	| stream |
	stream := streamClassProvider stdout.
	self record: aString on: stream.

	"The flush is needed to send the record in the stdout."
	stream flush
]
