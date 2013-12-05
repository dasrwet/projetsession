part of gestion_offre_app;

class Analyse extends ui.VerticalPanel {
  
  GestionActivite gestionactivite;
  GestionCritere gestioncritere;
  GestionEntreprise gestionentreprise;
  GestionEvaluation gestionevaluation;
  Admin admin;
  
  Analyse(OffreEntries offreentries) {
    ui.ListBox combo = new ui.ListBox();
    ui.Button valide = new ui.Button('Lancer');
    ui.TextBox pointXmin = new ui.TextBox(); pointXmin.text='30';
    ui.TextBox pointYmin = new ui.TextBox(); pointYmin.text='0';
    ui.TextBox pointXmax = new ui.TextBox(); pointXmax.text='600';
    ui.TextBox pointYmax = new ui.TextBox(); pointYmax.text='400';
    
      // test
    _initTest(offreentries);
      //fin
      
      num i=0;
      for(Activite activite in offreentries.activites)
      {
        combo.addItem(activite.titre, activite.numactivite);
      }
      ui.CaptionPanel dePanel = new ui.CaptionPanel();
      dePanel.setSize('750px', '750px');
      dePanel.setCaptionHtml('<center><canvas id="canvas" width="900" height="700"></canvas></center>');
      Element el= dePanel.getElement();
      el.style.border="0";
      
      ui.ScrollPanel scrpnel = new ui.ScrollPanel();
      scrpnel.setSize('100%', '500px');
      scrpnel.getElement().style.alignContent="center";
      scrpnel.add(dePanel);
    ui.CaptionPanel PanelParam = new ui.CaptionPanel('Grille d\'analyse');
    PanelParam.setSize('100%', '50px');
    ui.FlexTable layout = new ui.FlexTable();
    layout.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    layout.setHtml(0, 0, "Activite:");
    layout.setWidget(0, 1, combo);
    layout.setHtml(0, 2, "( PointX-min:");
    layout.setWidget(0, 3, pointXmin);
    layout.setHtml(0, 4, "PointY-min:");
    layout.setWidget(0, 5, pointYmin);
    layout.setHtml(0, 6, ")  ( PointX-max:");
    layout.setWidget(0, 7, pointXmax);
    layout.setHtml(0, 8, "PointY-max:");
    layout.setWidget(0, 9, pointYmax);
    layout.setWidget(0, 10, valide);
    valide.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      Point p1 = new Point(int.parse(pointXmin.text.trim()),int.parse(pointYmin.text.trim()));
      Point p2 = new Point(int.parse(pointXmax.text.trim()),int.parse(pointYmax.text.trim()));
      
      CanvasElement canvas = el.querySelector('#canvas'); //document.querySelector('#canvas');
      
      el.querySelector('#canvas').style.alignContent="center";
      el.querySelector('#canvas').style.margin="10px 20px 20px 40px";
      el.querySelector('#canvas').style.backgroundColor="white";
      
      Board board = new Board(canvas,p1,p2,offreentries.activites.firstWhereAttribute("numactivite", combo.getValue(combo.getSelectedIndex()))); //
    })); 
    PanelParam.add(layout);
    PanelParam.getElement().style.margin="2px 2px 8px 2px";
    PanelParam.getElement().style.borderRadius="4px 4px 4px 4px";
    PanelParam.getElement().style.backgroundColor="white";
    PanelParam.getElement().style.font="verdana";
    PanelParam.getElement().style.fontSize="11px";
    PanelParam.getElement().style.fontWeight="bold";
    
    
    add(PanelParam);
    add(scrpnel);
    
  }
void _initTest(OffreEntries offreentries)
      {
        // activite
        Activite actti = new Activite(offreentries.activites.concept);
        actti.numactivite='a001b007';
        actti.titre='Contsruction';
        actti.description='Contsruction de la zone d\'embassade';
        offreentries.activites.add(actti);
        
        Activite actti1 = new Activite(offreentries.activites.concept);
        actti1.numactivite='a001b008';
        actti1.titre='Archivage';
        actti1.description='gestion des archivages du ministere';
        offreentries.activites.add(actti1);
        
        
        
        // critere
        Critere crtt1 = new Critere(offreentries.criteres.concept);
        crtt1.numcritere="Cr001";
        crtt1.libelle="Employes";
        offreentries.criteres.add(crtt1);
        
        Critere crtt2 = new Critere(offreentries.criteres.concept);
        crtt2.numcritere="Cr002";
        crtt2.libelle="Experiences";
        offreentries.criteres.add(crtt2);
        
        Critere crtt3 = new Critere(offreentries.criteres.concept);
        crtt3.numcritere="Cr003";
        crtt3.libelle="relations";
        offreentries.criteres.add(crtt3);
        
        Critere crtt4 = new Critere(offreentries.criteres.concept);
        crtt4.numcritere="Cr004";
        crtt4.libelle="equipement";
        offreentries.criteres.add(crtt4);
        
        
        // entreprise
        Entreprise entr1 = new Entreprise(offreentries.entreprises.concept);
        
        entr1.numentreprise='ent001';
        entr1.designation='SSEI';
        entr1.responsable='STONIKOT JIR';
        entr1.raisonsocial='Aide a la decision';
        offreentries.entreprises.add(entr1);
        
        Entreprise entr2 = new Entreprise(offreentries.entreprises.concept);
        entr2.numentreprise='ent002';
        entr2.designation='Modulor';
        entr2.responsable='Irenee SESSOU';
        entr2.raisonsocial='Cabinet d\'architecture';
        offreentries.entreprises.add(entr2);
        
        Entreprise entr3 = new Entreprise(offreentries.entreprises.concept);
        entr3.numentreprise='ent003';
        entr3.designation='Multi-Interv';
        entr3.responsable='SAVIRA Cronedar';
        entr3.raisonsocial='consultant baliment - informatique';
        offreentries.entreprises.add(entr3);
        
        
        // comtrainte 
        // activite 1
        Contrainte ctr11 = new Contrainte.withId(actti.contraintes.concept, actti, crtt1);
        ctr11.valeurs='10';
        ctr11.seuil='4';
        actti.contraintes.add(ctr11);
        
        Contrainte ctr12 = new Contrainte.withId(actti.contraintes.concept, actti, crtt2);
        ctr12.valeurs='5';
        ctr12.seuil='1';
        actti.contraintes.add(ctr12);
        
        Contrainte ctr13 = new Contrainte.withId(actti.contraintes.concept, actti, crtt4);
        ctr13.valeurs='8';
        ctr13.seuil='2';
        actti.contraintes.add(ctr13);
        
        // activite 2
        Contrainte ctr21 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt1);
        ctr21.valeurs='4';
        ctr21.seuil='2';
        actti1.contraintes.add(ctr21);
        
        Contrainte ctr22 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt2);
        ctr22.valeurs='6';
        ctr22.seuil='2';
        actti1.contraintes.add(ctr22);
        
        Contrainte ctr23 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt3);
        ctr23.valeurs='8';
        ctr23.seuil='2';
        actti1.contraintes.add(ctr23);
        
        Contrainte ctr24 = new Contrainte.withId(actti1.contraintes.concept, actti1, crtt4);
        ctr24.valeurs='8';
        ctr24.seuil='2';
        actti1.contraintes.add(ctr24);
        
        
        // evaluation
        // activite1
        //contrainte 1
        Evalutation eval111 = new Evalutation.withId(ctr11.evaluations.concept, entr2, ctr11);
        eval111.valeur='7';
        ctr11.evaluations.add(eval111);
        Evalutation eval112 = new Evalutation.withId(ctr11.evaluations.concept, entr3, ctr11);
        eval112.valeur='11';
        ctr11.evaluations.add(eval112);
        
        //contrainte 2
        Evalutation eval121 = new Evalutation.withId(ctr12.evaluations.concept, entr2, ctr12);
        eval121.valeur='5';
        ctr12.evaluations.add(eval121);
        Evalutation eval122 = new Evalutation.withId(ctr12.evaluations.concept, entr3, ctr12);
        eval122.valeur='5';
        ctr12.evaluations.add(eval122);
        
        //contrainte 3
        Evalutation eval131 = new Evalutation.withId(ctr13.evaluations.concept, entr2, ctr13);
        eval131.valeur='7';
        ctr13.evaluations.add(eval131);
        Evalutation eval132 = new Evalutation.withId(ctr13.evaluations.concept, entr3, ctr13);
        eval132.valeur='2';
        ctr13.evaluations.add(eval132);
        
        
    
        // activite2
        //contrainte 1
        Evalutation eval211 = new Evalutation.withId(ctr21.evaluations.concept, entr1, ctr21);
        eval211.valeur='6';
        ctr21.evaluations.add(eval211);
        Evalutation eval212 = new Evalutation.withId(ctr21.evaluations.concept, entr2, ctr21);
        eval212.valeur='1';
        ctr21.evaluations.add(eval212);
        Evalutation eval213 = new Evalutation.withId(ctr21.evaluations.concept, entr3, ctr21);
        eval213.valeur='3';
        ctr21.evaluations.add(eval213);
        
        //contrainte 2
        Evalutation eval221 = new Evalutation.withId(ctr22.evaluations.concept, entr1, ctr22);
        eval221.valeur='4';
        ctr22.evaluations.add(eval221);
        Evalutation eval222 = new Evalutation.withId(ctr22.evaluations.concept, entr2, ctr22);
        eval222.valeur='1';
        ctr22.evaluations.add(eval222);
        Evalutation eval223 = new Evalutation.withId(ctr22.evaluations.concept, entr3, ctr22);
        eval223.valeur='3';
        ctr22.evaluations.add(eval223);
        
        //contrainte 3
        Evalutation eval231 = new Evalutation.withId(ctr23.evaluations.concept, entr1, ctr23);
        eval231.valeur='12';
        ctr23.evaluations.add(eval231);
        Evalutation eval232 = new Evalutation.withId(ctr23.evaluations.concept, entr2, ctr23);
        eval232.valeur='10';
        ctr23.evaluations.add(eval232);
        Evalutation eval233 = new Evalutation.withId(ctr23.evaluations.concept, entr3, ctr23);
        eval233.valeur='7';
        ctr23.evaluations.add(eval233);
        
        //contrainte 4
        Evalutation eval241 = new Evalutation.withId(ctr24.evaluations.concept, entr1, ctr24);
        eval241.valeur='12';
        ctr24.evaluations.add(eval241);
        Evalutation eval242 = new Evalutation.withId(ctr24.evaluations.concept, entr2, ctr24);
        eval242.valeur='10';
        ctr24.evaluations.add(eval242);
        Evalutation eval243 = new Evalutation.withId(ctr24.evaluations.concept, entr3, ctr24);
        eval243.valeur='7';
        ctr24.evaluations.add(eval243);
        
        
      }
}