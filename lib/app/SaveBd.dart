part of gestion_offre_app;

class Savebd {
 
  
  Savebd() {
    
  }
  
  save(OffreEntries model)
  {
    model.compteurs.clear();
      model.compteurs.add(compteur);
    window.localStorage['data'] = JSON.encode(model.toJson());
  }
  
  void _initTest(OffreEntries offreentries)
  {
    // activite
    Activite actti = new Activite(offreentries.activites.concept);
    actti.numactivite='a001b007';
    actti.titre='Construction';
    actti.description='Contsruction de la zone d\'embassade';
    
    
    Activite actti1 = new Activite(offreentries.activites.concept);
    actti1.numactivite='a001b008';
    actti1.titre='Archivage';
    actti1.description='gestion des archivages du ministere';
    
    
    
    
    // critere
    Critere crtt1 = new Critere(offreentries.criteres.concept);
    crtt1.numcritere="Cr001";
    crtt1.libelle="Employes";
    
    
    Critere crtt2 = new Critere(offreentries.criteres.concept);
    crtt2.numcritere="Cr002";
    crtt2.libelle="Experiences";
    
    
    Critere crtt3 = new Critere(offreentries.criteres.concept);
    crtt3.numcritere="Cr003";
    crtt3.libelle="relations";
    
    
    Critere crtt4 = new Critere(offreentries.criteres.concept);
    crtt4.numcritere="Cr004";
    crtt4.libelle="equipement";
    
    
    
    // entreprise
    Entreprise entr1 = new Entreprise(offreentries.entreprises.concept);
    
    entr1.numentreprise='ent001';
    entr1.designation='SSEI';
    entr1.responsable='STONIKOT JIR';
    entr1.raisonsocial='Aide a la decision';
    
    
    Entreprise entr2 = new Entreprise(offreentries.entreprises.concept);
    entr2.numentreprise='ent002';
    entr2.designation='Modulor';
    entr2.responsable='Irenee SESSOU';
    entr2.raisonsocial='Cabinet d\'architecture';
    
    
    Entreprise entr3 = new Entreprise(offreentries.entreprises.concept);
    entr3.numentreprise='ent003';
    entr3.designation='Multi-Interv';
    entr3.responsable='SAVIRA Cronedar';
    entr3.raisonsocial='consultant baliment - informatique';
    
    
    
    // comtrainte 
    // activite 1
    Contrainte ctr11 = new Contrainte.withId(actti.contraintes.concept, actti, crtt1);
    ctr11.valeurs='10';
    ctr11.seuil='4';
    
    
    Contrainte ctr12 = new Contrainte.withId(actti.contraintes.concept, actti, crtt2);
    ctr12.valeurs='5';
    ctr12.seuil='1';
    
    
    Contrainte ctr13 = new Contrainte.withId(actti.contraintes.concept, actti, crtt4);
    ctr13.valeurs='8';
    ctr13.seuil='2';
    
    
    
    // activite 2
    Contrainte ctr21 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt1);
    ctr21.valeurs='4';
    ctr21.seuil='2';
    
    
    Contrainte ctr22 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt2);
    ctr22.valeurs='6';
    ctr22.seuil='2';
    
    
    Contrainte ctr23 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt3);
    ctr23.valeurs='8';
    ctr23.seuil='2';
    
    
    Contrainte ctr24 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt4);
    ctr24.valeurs='8';
    ctr24.seuil='2';
    
    
    
    // evaluation
    // activite1
    //contrainte 1
    Evaluation eval111 = new Evaluation.withId(ctr11.evaluations.concept, entr2, ctr11);
    eval111.valeur='7';
    ctr11.evaluations.add(eval111);
    Evaluation eval112 = new Evaluation.withId(ctr11.evaluations.concept, entr3, ctr11);
    eval112.valeur='11';
    ctr11.evaluations.add(eval112);
    
    //contrainte 2
    Evaluation eval121 = new Evaluation.withId(ctr12.evaluations.concept, entr2, ctr12);
    eval121.valeur='5';
    ctr12.evaluations.add(eval121);
    Evaluation eval122 = new Evaluation.withId(ctr12.evaluations.concept, entr3, ctr12);
    eval122.valeur='5';
    ctr12.evaluations.add(eval122);
    
    //contrainte 3
    Evaluation eval131 = new Evaluation.withId(ctr13.evaluations.concept, entr2, ctr13);
    eval131.valeur='7';
    ctr13.evaluations.add(eval131);
    Evaluation eval132 = new Evaluation.withId(ctr13.evaluations.concept, entr3, ctr13);
    eval132.valeur='2';
    ctr13.evaluations.add(eval132);
    
    
    
    // activite2
    //contrainte 1
    Evaluation eval211 = new Evaluation.withId(ctr21.evaluations.concept, entr1, ctr21);
    eval211.valeur='6';
    ctr21.evaluations.add(eval211);
    Evaluation eval212 = new Evaluation.withId(ctr21.evaluations.concept, entr2, ctr21);
    eval212.valeur='1';
    ctr21.evaluations.add(eval212);
    Evaluation eval213 = new Evaluation.withId(ctr21.evaluations.concept, entr3, ctr21);
    eval213.valeur='3';
    ctr21.evaluations.add(eval213);
    
    //contrainte 2
    Evaluation eval221 = new Evaluation.withId(ctr22.evaluations.concept, entr1, ctr22);
    eval221.valeur='4';
    ctr22.evaluations.add(eval221);
    Evaluation eval222 = new Evaluation.withId(ctr22.evaluations.concept, entr2, ctr22);
    eval222.valeur='1';
    ctr22.evaluations.add(eval222);
    Evaluation eval223 = new Evaluation.withId(ctr22.evaluations.concept, entr3, ctr22);
    eval223.valeur='3';
    ctr22.evaluations.add(eval223);
    
    //contrainte 3
    Evaluation eval231 = new Evaluation.withId(ctr23.evaluations.concept, entr1, ctr23);
    eval231.valeur='12';
    ctr23.evaluations.add(eval231);
    Evaluation eval232 = new Evaluation.withId(ctr23.evaluations.concept, entr2, ctr23);
    eval232.valeur='10';
    ctr23.evaluations.add(eval232);
    Evaluation eval233 = new Evaluation.withId(ctr23.evaluations.concept, entr3, ctr23);
    eval233.valeur='7';
    ctr23.evaluations.add(eval233);
    
    //contrainte 4
    Evaluation eval241 = new Evaluation.withId(ctr24.evaluations.concept, entr1, ctr24);
    eval241.valeur='12';
    ctr24.evaluations.add(eval241);
    Evaluation eval242 = new Evaluation.withId(ctr24.evaluations.concept, entr2, ctr24);
    eval242.valeur='10';
    ctr24.evaluations.add(eval242);
    Evaluation eval243 = new Evaluation.withId(ctr24.evaluations.concept, entr3, ctr24);
    eval243.valeur='7';
    ctr24.evaluations.add(eval243);
    
    
    actti1.contraintes.add(ctr24);
    actti1.contraintes.add(ctr23);
    actti1.contraintes.add(ctr22);
    actti1.contraintes.add(ctr21);
    actti.contraintes.add(ctr13);
    actti.contraintes.add(ctr12);
    actti.contraintes.add(ctr11);
    offreentries.entreprises.add(entr3);
    offreentries.entreprises.add(entr2);
    offreentries.entreprises.add(entr1);
    offreentries.criteres.add(crtt4);
    offreentries.criteres.add(crtt3);
    offreentries.criteres.add(crtt2);
    offreentries.criteres.add(crtt1);
    offreentries.activites.add(actti);
    offreentries.activites.add(actti1);
    
    compteur = new Compteur(offreentries.compteurs.concept);
    if(offreentries.compteurs.count>0)
      {
        compteur = offreentries.compteurs.first;
      }else{
        compteur.nbreactivite=0;
        compteur.nbrecritere=0;
        compteur.nbreentreprise=0; 
        //offreentries.compteurs.add(compteur);
      }
    
    save(offreentries);
    
  }
  
  
  
  Start(OffreEntries model)
  {
    String jsondata = window.localStorage['data'];
   
    if (jsondata!=null && jsondata.length>233){
      try {
        model.fromJson(JSON.decode(jsondata));
        compteur = new Compteur(model.compteurs.concept);
        compteur = model.compteurs.first;
      } on Exception catch(e) {
        print(e);
      }
     }else
     {
       //initialiser
       _initTest(model);
       //save(model);
     }
  }
  
  
  drop(OffreEntries model) {
    model.clear();
    save(model);
    window.localStorage['data'];
  }
  
}