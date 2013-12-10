part of gestion_offre; 
 
// lib/gen/gestion/offre/entreprises.dart 
 
abstract class EntrepriseGen extends ConceptEntity<Entreprise> { 
 
  EntrepriseGen(Concept concept) : super.of(concept) { 
    Concept evaluationConcept = concept.model.concepts.singleWhereCode("Evaluation"); 
    setChild("evaluations", new Evaluations(evaluationConcept)); 
  } 
 
  EntrepriseGen.withId(Concept concept, String numentreprise) : super.of(concept) { 
    setAttribute("numentreprise", numentreprise); 
    Concept evaluationConcept = concept.model.concepts.singleWhereCode("Evaluation"); 
    setChild("evaluations", new Evaluations(evaluationConcept)); 
  } 
 
  String get numentreprise => getAttribute("numentreprise"); 
  set numentreprise(String a) => setAttribute("numentreprise", a); 
  
  String get designation => getAttribute("designation"); 
  set designation(String a) => setAttribute("designation", a); 
  
  String get raisonsocial => getAttribute("raisonsocial"); 
  set raisonsocial(String a) => setAttribute("raisonsocial", a); 
  
  String get responsable => getAttribute("responsable"); 
  set responsable(String a) => setAttribute("responsable", a); 
  
  Evaluations get evaluations => getChild("evaluations"); 
  
  Entreprise newEntity() => new Entreprise(concept); 
  Entreprises newEntities() => new Entreprises(concept); 
  
  int numentrepriseCompareTo(Entreprise other) { 
    return numentreprise.compareTo(other.numentreprise); 
  } 
 
} 
 
abstract class EntreprisesGen extends Entities<Entreprise> { 
 
  EntreprisesGen(Concept concept) : super.of(concept); 
 
  Entreprises newEntities() => new Entreprises(concept); 
  Entreprise newEntity() => new Entreprise(concept); 
  
} 
 
