Smalltalk createPackage: 'JCTPhotos'!
(Smalltalk packageAt: 'JCTPhotos' ifAbsent: [ self error: 'Package not created: JCTPhotos' ]) imports: {'amber/jquery/Wrappers-JQuery'. 'amber/web/Web'. 'silk/Silk'}!
Object subclass: #JCTPhotos
	instanceVariableNames: ''
	package: 'JCTPhotos'!

!JCTPhotos methodsFor: 'as yet unclassified'!

start
	'#app' asSilk << 'test'
! !

!JCTPhotos class methodsFor: 'starting'!

start
	self new start
! !

