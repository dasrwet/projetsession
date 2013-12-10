part of gestion_offre; 
 
// lib/gestion/offre/evaluations.dart 
 
class Evaluation extends EvaluationGen { 
 
  Evaluation(Concept concept) : super(concept); 
 
  Evaluation.withId(Concept concept, Entreprise entreprise, Contrainte contrainte) : 
    super.withId(concept, entreprise, contrainte); 
 
} 
 
class Evaluations extends EvaluationsGen { 
 
  Evaluations(Concept concept) : super(concept); 
 
} 
 
