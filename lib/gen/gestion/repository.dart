part of gestion_offre; 
 
// lib/gen/gestion/repository.dart 
 
class GestionRepo extends Repo { 
 
  static final gestionDomainCode = "gestion"; 
  static final gestionOffreModelCode = "offre"; 
 
  GestionRepo([String code="GestionRepo"]) : super(code) { 
    _initGestionDomain(); 
  } 
 
  _initGestionDomain() { 
    var gestionDomain = new Domain(gestionDomainCode); 
    domains.add(gestionDomain); 
    add(new GestionModels(gestionDomain)); 
  } 
 
} 
 
