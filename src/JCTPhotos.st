Smalltalk createPackage: 'JCTPhotos'!
(Smalltalk packageAt: 'JCTPhotos' ifAbsent: [ self error: 'Package not created: JCTPhotos' ]) imports: {'amber/jquery/Wrappers-JQuery'. 'amber/web/Web'. 'silk/Silk'}!
Object subclass: #JCTCours
	instanceVariableNames: 'cours'
	package: 'JCTPhotos'!

!JCTCours methodsFor: 'as yet unclassified'!

do: aBlock
	cours do: aBlock
!

first
	^ cours first
!

initialize
	cours := #(
'Baby 1'
'Baby 2'
'Baby 3'
'Blanche 1 Blanche Jaune 1'
'Blanche 2'
'Blanche Jaune 2'
'Blanche Jaune 3'
'Jaune'
'Jaune Orange'
'Orange'
'Moyen'
'Adulte Loisir'
'Adulte'
'Jujitsu' )
! !

Object subclass: #JCTGallerie
	instanceVariableNames: 'cours photos'
	package: 'JCTPhotos'!

!JCTGallerie methodsFor: 'as yet unclassified'!

active: group
	| elt |
	elt := group element firstElementChild.
	elt className: (elt className, ' active')
!

addIndicator: num
	^ self indicators LI: {
		'data-target'->'#gallerie'.
		'data-slide-to'->num
		}
!

addMenu
	cours do: [ :cour |
		self addMenuEntry: cour ]
!

addMenuEntry: cour
	| a |
	a := '#menu' asSilk LI A: {
			'href'->'#'.
			cour
			}.
	a on: 'click' bind: [
		self select: cour ]
!

addPhoto: photo
	^ self images DIV: { 'class'->'item'.
		Silk IMG: {
			'src'->photo src.
			'class'->'img-rounded center-block'.
			'alt'->photo name }.
		Silk DIV: {
			'class'->'carousel-caption'.
			Silk H3: photo name }
		}
!

images
	^ '.carousel-inner' asSilk
!

indicators
	^ '.carousel-indicators' asSilk
!

initialize
    "creation des objets de base"
	cours := JCTCours new.
	photos := JCTPhotos new
!

select: cour
	| imgs inds num |
	imgs := self images.
	inds := self indicators.
	
	imgs resetContents.
	inds resetContents.

	num := 0.
	photos select: cour do: [ :photo |
		self addPhoto: photo.
		self addIndicator: num.
		num := num+1
		].

	self active: inds.
	self active: imgs.

	self slide
!

slide
	| carousel |
	carousel := '#gallerie' asJQuery data: 'bs.carousel'.
	carousel ifNotNil: [
		carousel slide ]
!

start
	"ajout des elements d'interface"
	self addMenu.
	self select: cours first
! !

!JCTGallerie class methodsFor: 'starting'!

start
	self new start
! !

Object subclass: #JCTPhoto
	instanceVariableNames: 'src'
	package: 'JCTPhotos'!

!JCTPhoto methodsFor: 'as yet unclassified'!

name
	| raw |
	raw := (self src subStrings: $/) last.
	raw := raw replace: $_ with: String space.
	^ raw := (raw subStrings: $.) first
!

ref: aRef
	src := aRef
!

src
	^ src
! !

!JCTPhoto class methodsFor: 'as yet unclassified'!

new: ref
	^ self new ref: ref
! !

Object subclass: #JCTPhotos
	instanceVariableNames: 'base'
	package: 'JCTPhotos'!

!JCTPhotos methodsFor: 'as yet unclassified'!

initialize
	| listing |
	listing :='
www.photographe.com.fr/jct2017/content/images/large/Adulte_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Adulte_Loisir_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_2_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_3_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_3_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_1.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_39.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_40.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_41.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_42.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_43.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_44.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_45.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_46.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_47.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_Orange_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Jujitsu_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Moyen_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_26.jpg
'.
	base := listing lines collect: [ :img |
		JCTPhoto new: img ]
!

select: cours
	^ base select: [ :img | img name match: $^,cours,' -' ]
!

select: cours do: aBlock
	(self select: cours) do: aBlock
! !

!JCTPhotos methodsFor: 'private'!

filenameFrom: cours
	^ cours replace: String space with: $_
! !

