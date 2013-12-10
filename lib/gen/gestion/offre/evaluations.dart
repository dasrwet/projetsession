part of gestion_offre; 
 
// lib/gen/gestion/offre/evaluations.dart 
 
abstract class EvaluationGen extends ConceptEntity<Evaluation> { 
 
  EvaluationGen(Concept concept) : super.of(concept); 
 
  EvaluationGen.withId(Concept concept, Entreprise entreprise, Contrainte contrainte) : super.of(concept) { 
    setParent("entreprise", entreprise); 
    setParent("contrainte", contrainte); 
  } 
 
  Entreprise get entreprise => getParent("entreprise"); 
  set entreprise(Entreprise p) => setParent("entreprise", p); 
  
  Contrainte get contrainte => getParent("contrainte"); 
  set contrainte(Contrainte p) => setParent("contrainte", p); 
  
  String get valeur => getAttribute("valeur"); 
  set valeur(String a) => setAttribute("valeur", a); 
  
  Evaluation newEntity() => new Evaluation(concept); 
  Evaluations newEntities() => new Evaluations(concept); 
  
} 
 
abstract class EvaluationsGen extends Entities<Evaluation> { 
 
  EvaluationsGen(Concept concept) : super.of(concept); 
 
  Evaluations newEntities() => new Evaluations(concept); 
  Evaluation newEntity() => new Evaluation(concept); 
  
} 
 
