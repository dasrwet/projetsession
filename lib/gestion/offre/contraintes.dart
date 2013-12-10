part of gestion_offre; 
 
// lib/gestion/offre/contraintes.dart 
 
class Contrainte extends ContrainteGen { 
 
  Contrainte(Concept concept) : super(concept); 
 
  Contrainte.withId(Concept concept, Activite activite, Critere critere) : 
    super.withId(concept, activite, critere); 
 
} 
 
class Contraintes extends ContraintesGen { 
 
  Contraintes(Concept concept) : super(concept); 
 
} 
 
