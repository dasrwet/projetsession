part of gestion_offre; 
 
// lib/gestion/offre/criteres.dart 
 
class Critere extends CritereGen { 
 
  Critere(Concept concept) : super(concept); 
 
  Critere.withId(Concept concept, String numcritere) : 
    super.withId(concept, numcritere); 
 
} 
 
class Criteres extends CriteresGen { 
 
  Criteres(Concept concept) : super(concept); 
 
} 
 
