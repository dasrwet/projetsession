part of gestion_offre; 
 
// lib/gen/gestion/offre/activites.dart 
 
abstract class ActiviteGen extends ConceptEntity<Activite> { 
 
  ActiviteGen(Concept concept) : super.of(concept) { 
    Concept contrainteConcept = concept.model.concepts.singleWhereCode("Contrainte"); 
    setChild("contraintes", new Contraintes(contrainteConcept)); 
  } 
 
  ActiviteGen.withId(Concept concept, String numactivite) : super.of(concept) { 
    setAttribute("numactivite", numactivite); 
    Concept contrainteConcept = concept.model.concepts.singleWhereCode("Contrainte"); 
    setChild("contraintes", new Contraintes(contrainteConcept)); 
  } 
 
  String get numactivite => getAttribute("numactivite"); 
  set numactivite(String a) => setAttribute("numactivite", a); 
  
  String get titre => getAttribute("titre"); 
  set titre(String a) => setAttribute("titre", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  Contraintes get contraintes => getChild("contraintes"); 
  
  Activite newEntity() => new Activite(concept); 
  Activites newEntities() => new Activites(concept); 
  
  int numactiviteCompareTo(Activite other) { 
    return numactivite.compareTo(other.numactivite); 
  } 
 
} 
 
abstract class ActivitesGen extends Entities<Activite> { 
 
  ActivitesGen(Concept concept) : super.of(concept); 
 
  Activites newEntities() => new Activites(concept); 
  Activite newEntity() => new Activite(concept); 
  
} 
 
