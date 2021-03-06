part of gestion_offre_app;

class Analyse extends ui.VerticalPanel {
  
  GestionActivite gestionactivite;
  GestionCritere gestioncritere;
  GestionEntreprise gestionentreprise;
  GestionEvaluation gestionevaluation;
  Admin admin;
  Principale principale ;
  
  Analyse(OffreEntries offreentries) {
    setSize("100%", "auto");
    setStylePrimaryName('analyse');
    ui.ListBox combo = new ui.ListBox();
    ui.Button valide = new ui.Button('Lancer');
    ui.DoubleBox pointXmin = new ui.DoubleBox(); pointXmin.text='30';
    pointXmin.setWidth("30px");
    ui.TextBox pointYmin = new ui.TextBox(); pointYmin.text='0';
    pointYmin.setWidth("30px");
    ui.TextBox pointXmax = new ui.TextBox(); pointXmax.text='600';
    pointXmax.setWidth("30px");
    ui.TextBox pointYmax = new ui.TextBox(); pointYmax.text='400';
    pointYmax.setWidth("30px");
    
      // test
   // _initTest(offreentries);
      //fin
      
      num i=0;
      for(Activite activite in offreentries.activites)
      {
        var act = new Activite(offreentries.activites.concept);
        combo.addItem(activite.titre, activite.numactivite);
      }
      ui.HtmlPanel dePanel = new ui.HtmlPanel('<center><canvas id="canvas" width="900" height="700"></canvas></center>');
      dePanel.setStylePrimaryName('containtcanvas');
     // dePanel.setSize('98%', '750px');
      //dePanel.set('');
      Element el= dePanel.getElement();
      el.style.border="0";
      

    ui.CaptionPanel PanelParam = new ui.CaptionPanel('Grille d\'analyse');
    PanelParam.setSize('98%', '50px');
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
      var activit = offreentries.activites.firstWhereAttribute("numactivite", combo.getValue(combo.getSelectedIndex()));
      
      Board board = new Board(canvas,p1,p2,activit); //
     //save.valide(offreentries);
    })); 
    PanelParam.add(layout);
    PanelParam.setStylePrimaryName('param');
    //PanelParam.getElement().style.margin="2px 2px 8px 2px";
    PanelParam.getElement().style.borderRadius="4px 4px 4px 4px";
    //PanelParam.getElement().style.backgroundColor="white";
    PanelParam.getElement().style.font="verdana";
    PanelParam.getElement().style.fontSize="11px";
    PanelParam.getElement().style.fontWeight="bold";
    
    
    add(PanelParam);
    add(dePanel);
  
    
  }
}