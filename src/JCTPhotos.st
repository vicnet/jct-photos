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
"
	cours := {
#('Baby 1' 'mercredi' '13h00-14h00' 'Guillaume'),
#('Baby 2' 'mercredi' '17h30-18h30' 'Corinne'),
#('Baby 3' '' '' ''),
#('Blanche 1 Blanche Jaune 1' 'mercredi' '14h00-15h00' 'Guillaume'),
#('Blanche 2' 'mercredi' '15h00-16h00' 'Guillaume'),
#('Blanche 3' 'vendredi' '17h00-18h00' 'Corinne'),
#('Blanche Jaune 1' 'mercredi' '14h00-15h00' 'Yvan'),
#('Blanche Jaune 2' 'mercredi' '15h00-16h00' 'Yvan'),
#('Blanche Jaune 3' 'lundi' '18h30-19h30' 'Corinne'),
#('Jaune' 'mardi/jeudi' '17h00-18h00/18h30-19h30' 'Corinne'),
#('Jaune Orange' '' '' ''),
#('Orange' '' '' ''),
#('Moyen' '' '' ''),
#('Adulte Loisir' '' '' ''),
#('Adulte' '' '' ''),
#('Jujitsu' '' '' ''),
}"
	cours := #(
'Baby 1'
'Baby 2'
'Baby 3'
'Blanche 1 Blanche Jaune 1'
'Blanche 2'
'Blanche 3'
'Blanche Jaune 2'
'Blanche Jaune 3'
'Jaune'
'Jaune Orange'
'Orange'
'Moyen'
'Adulte Loisir'
'Adulte'
'Jujitsu'
'Perfectionnement Adulte'
'Tai so'
)
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
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Baby_1_-_39.jpg
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
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_39.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_40.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_41.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_42.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_43.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_44.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_45.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_46.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_47.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_48.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_49.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_50.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_51.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_52.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_53.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_54.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_55.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_1_Blanche_Jaune_1-_56.jpg
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
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_39.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_40.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_41.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_42.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_43.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_44.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_45.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_46.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_47.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_48.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_49.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_50.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_51.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_52.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_53.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_54.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_55.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_5.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_6.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_7.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_8.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_2_-_9.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_07.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_08.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_09.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_3_-_21.jpg
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
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_2.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_39.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_3.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_40.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_41.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_42.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_43.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_44.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_45.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_46.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_47.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_48.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_49.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_50.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_51.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_52.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_53.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_54.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_55.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_56.jpg
www.photographe.com.fr/jct2017/content/images/large/Blanche_Jaune_2_-_57.jpg
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
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_48.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_49.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_4.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_50.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_51.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_52.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_53.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_54.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_55.jpg
www.photographe.com.fr/jct2017/content/images/large/Jaune_-_56.jpg
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
www.photographe.com.fr/jct2017/content/images/large/Orange_-_100.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_101.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_102.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_103.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_104.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_105.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_106.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_107.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_108.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_109.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_10.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_110.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_111.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_112.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_113.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_114.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_115.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_116.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_117.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_118.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_119.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_11.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_120.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_121.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_122.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_123.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_124.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_125.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_126.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_127.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_128.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_129.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_12.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_130.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_131.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_132.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_133.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_134.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_135.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_136.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_137.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_138.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_139.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_13.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_140.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_141.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_142.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_143.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_144.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_145.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_146.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_147.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_148.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_149.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_14.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_150.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_151.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_152.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_153.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_154.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_155.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_156.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_157.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_158.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_159.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_15.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_160.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_161.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_162.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_163.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_164.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_165.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_166.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_167.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_168.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_169.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_16.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_170.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_171.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_172.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_173.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_174.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_175.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_176.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_177.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_178.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_179.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_17.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_180.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_181.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_182.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_183.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_184.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_185.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_186.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_187.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_188.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_189.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_18.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_190.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_191.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_192.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_193.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_19.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_20.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_21.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_22.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_23.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_24.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_25.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_26.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_27.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_28.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_29.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_30.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_31.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_32.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_33.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_34.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_35.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_36.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_37.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_38.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_39.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_40.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_41.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_42.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_43.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_44.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_45.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_46.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_47.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_48.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_49.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_50.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_51.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_52.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_53.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_54.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_55.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_56.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_57.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_58.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_59.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_60.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_61.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_62.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_63.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_64.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_65.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_66.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_67.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_68.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_69.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_70.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_71.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_72.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_73.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_74.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_75.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_76.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_77.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_78.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_79.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_80.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_81.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_82.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_83.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_84.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_85.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_86.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_87.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_88.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_89.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_90.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_91.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_92.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_93.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_94.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_95.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_96.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_97.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_98.jpg
www.photographe.com.fr/jct2017/content/images/large/Orange_-_99.jpg
www.photographe.com.fr/jct2017/content/images/large/Perfectionnement_Adulte_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Perfectionnement_Adulte_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Perfectionnement_Adulte_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Perfectionnement_Adulte_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_01.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_02.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_03.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_04.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_05.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_06.jpg
www.photographe.com.fr/jct2017/content/images/large/Tai_so_-_07.jpg
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

