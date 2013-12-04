part of gestion_offre; 
 
// lib/gen/gestion/offre/criteres.dart 
 
abstract class CritereGen extends ConceptEntity<Critere> { 
 
  CritereGen(Concept concept) : super.of(concept) { 
    Concept contrainteConcept = concept.model.concepts.singleWhereCode("Contrainte"); 
    setChild("contraintes", new Contraintes(contrainteConcept)); 
  } 
 
  CritereGen.withId(Concept concept, String numcritere) : super.of(concept) { 
    setAttribute("numcritere", numcritere); 
    Concept contrainteConcept = concept.model.concepts.singleWhereCode("Contrainte"); 
    setChild("contraintes", new Contraintes(contrainteConcept)); 
  } 
 
  String get numcritere => getAttribute("numcritere"); 
  set numcritere(String a) => setAttribute("numcritere", a); 
  
  String get libelle => getAttribute("libelle"); 
  set libelle(String a) => setAttribute("libelle", a); 
  
  Contraintes get contraintes => getChild("contraintes"); 
  
  Critere newEntity() => new Critere(concept); 
  Criteres newEntities() => new Criteres(concept); 
  
  int numcritereCompareTo(Critere other) { 
    return numcritere.compareTo(other.numcritere); 
  } 
 
} 
 
abstract class CriteresGen extends Entities<Critere> { 
 
  CriteresGen(Concept concept) : super.of(concept); 
 
  Criteres newEntities() => new Criteres(concept); 
  Critere newEntity() => new Critere(concept); 
  
} 
 
