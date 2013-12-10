part of gestion_offre;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/gestion/offre/json/model.dart

var gestionOffreModelJson = r'''
{
    "width":990,
    "height":580,
    "boxes":[
        {
            "name":"Activite",
            "entry":true,
            "x":308,
            "y":52,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"numactivite",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"titre",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"description",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Contrainte",
            "entry":false,
            "x":568,
            "y":269,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"type",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"valeurs",
                    "category":"attribute",
                    "type":"Other",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"seuil",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Critere",
            "entry":true,
            "x":787,
            "y":36,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"numcritere",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"libelle",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Entreprise",
            "entry":true,
            "x":30,
            "y":272,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"numentreprise",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"designation",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"raisonsocial",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":40,
                    "name":"responsable",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Evaluation",
            "entry":false,
            "x":304,
            "y":272,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"valeur",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Compteur",
            "entry":true,
            "x":158,
            "y":97,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"nbreactivite",
                    "category":"attribute",
                    "type":"int",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"nbrecritere",
                    "category":"attribute",
                    "type":"int",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"nbreentreprise",
                    "category":"attribute",
                    "type":"int",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":40,
                    "name":"autre",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        }
    ],
    "lines":[
        {
            "box1Name":"Contrainte",
            "box2Name":"Activite",
            "category":"relationship",
            "internal":true,
            "box1box2Name":"activite",
            "box1box2Min":"1",
            "box1box2Max":"1",
            "box1box2Id":true,
            "box2box1Name":"contraintes",
            "box2box1Min":"0",
            "box2box1Max":"N",
            "box2box1Id":false
        },
        {
            "box1Name":"Critere",
            "box2Name":"Contrainte",
            "category":"relationship",
            "internal":false,
            "box1box2Name":"contraintes",
            "box1box2Min":"0",
            "box1box2Max":"N",
            "box1box2Id":false,
            "box2box1Name":"critere",
            "box2box1Min":"1",
            "box2box1Max":"1",
            "box2box1Id":true
        },
        {
            "box1Name":"Entreprise",
            "box2Name":"Evaluation",
            "category":"relationship",
            "internal":false,
            "box1box2Name":"evaluations",
            "box1box2Min":"0",
            "box1box2Max":"N",
            "box1box2Id":false,
            "box2box1Name":"entreprise",
            "box2box1Min":"1",
            "box2box1Max":"1",
            "box2box1Id":true
        },
        {
            "box1Name":"Evaluation",
            "box2Name":"Contrainte",
            "category":"relationship",
            "internal":true,
            "box1box2Name":"contrainte",
            "box1box2Min":"1",
            "box1box2Max":"1",
            "box1box2Id":true,
            "box2box1Name":"evaluations",
            "box2box1Min":"0",
            "box2box1Max":"N",
            "box2box1Id":false
        }
    ]
}
''';
  