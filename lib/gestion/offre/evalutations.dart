part of gestion_offre; 
 
// lib/gestion/offre/evalutations.dart 
 
class Evalutation extends EvalutationGen { 
 
  Evalutation(Concept concept) : super(concept); 
 
  Evalutation.withId(Concept concept, Entreprise entreprise, Contrainte contrainte) : 
    super.withId(concept, entreprise, contrainte); 
  
} 
 
class Evalutations extends EvalutationsGen { 
 
  Evalutations(Concept concept) : super(concept); 
 
} 
 
