part of gestion_offre; 
 
// lib/gen/gestion/offre/evalutations.dart 
 
abstract class EvalutationGen extends ConceptEntity<Evalutation> { 
 
  EvalutationGen(Concept concept) : super.of(concept); 
 
  EvalutationGen.withId(Concept concept, Entreprise entreprise, Contrainte contrainte) : super.of(concept) { 
    setParent("entreprise", entreprise); 
    setParent("contrainte", contrainte); 
  } 
 
  Entreprise get entreprise => getParent("entreprise"); 
  set entreprise(Entreprise p) => setParent("entreprise", p); 
  
  Contrainte get contrainte => getParent("contrainte"); 
  set contrainte(Contrainte p) => setParent("contrainte", p); 
  
  String get valeur => getAttribute("valeur"); 
  set valeur(String a) => setAttribute("valeur", a); 
  
  Evalutation newEntity() => new Evalutation(concept); 
  Evalutations newEntities() => new Evalutations(concept); 
  
} 
 
abstract class EvalutationsGen extends Entities<Evalutation> { 
 
  EvalutationsGen(Concept concept) : super.of(concept); 
 
  Evalutations newEntities() => new Evalutations(concept); 
  Evalutation newEntity() => new Evalutation(concept); 
  
} 
 
