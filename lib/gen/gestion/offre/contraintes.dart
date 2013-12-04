part of gestion_offre; 
 
// lib/gen/gestion/offre/contraintes.dart 
 
abstract class ContrainteGen extends ConceptEntity<Contrainte> { 
 
  ContrainteGen(Concept concept) : super.of(concept) { 
    Concept evalutationConcept = concept.model.concepts.singleWhereCode("Evalutation"); 
    setChild("evaluations", new Evalutations(evalutationConcept)); 
  } 
 
  ContrainteGen.withId(Concept concept, Activite activite, Critere critere) : super.of(concept) { 
    setParent("activite", activite); 
    setParent("critere", critere); 
    Concept evalutationConcept = concept.model.concepts.singleWhereCode("Evalutation"); 
    setChild("evaluations", new Evalutations(evalutationConcept)); 
  } 
 
  Activite get activite => getParent("activite"); 
  set activite(Activite p) => setParent("activite", p); 
  
  Critere get critere => getParent("critere"); 
  set critere(Critere p) => setParent("critere", p); 
  
  String get type => getAttribute("type"); 
  set type(String a) => setAttribute("type", a); 
  
  String get valeurs => getAttribute("valeurs"); 
  set valeurs(String a) => setAttribute("valeurs", a); 
  
  String get seuil => getAttribute("seuil"); 
  set seuil(String a) => setAttribute("seuil", a); 
  
  Evalutations get evaluations => getChild("evaluations"); 
  
  Contrainte newEntity() => new Contrainte(concept); 
  Contraintes newEntities() => new Contraintes(concept); 
  
} 
 
abstract class ContraintesGen extends Entities<Contrainte> { 
 
  ContraintesGen(Concept concept) : super.of(concept); 
 
  Contraintes newEntities() => new Contraintes(concept); 
  Contrainte newEntity() => new Contrainte(concept); 
  
} 
 
