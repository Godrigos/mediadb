import '/models/medium.dart';

List<Medium> media = [
  Medium(
    initials: 'AA',
    longName: 'Ágar Água',
    ingredients: {
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Misturar o ágar com a água.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'BDA',
    longName: 'Batata Dextrose Ágar',
    ingredients: {
      'Batata': Quantity(amount: 200, unit: 'g'),
      'Dextrose': Quantity(amount: 20, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Descascar as batatas, lavar e cortar em pedaços pequenos.',
      'Pesar as batatas, colocar em um becker com 500mL de água destilada ' +
          'e cozinhar em autoclave por 20 minutos a 121 ℃.',
      'Coar o caldo e descartar as batatas.',
      'Acrescentar a dextrose ao caldo, dissolver usando o agitador ' +
          'magnético.',
      'Completar o volume para 1 litro.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Ajustar o pH conforme a necessidade.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    ps: 'Para o Caldo Batata Dextrose (CBD), basta não adicionar o ágar.',
  ),
  Medium(
    initials: 'CFN',
    longName: 'Citrus Fabris-Nishimura',
    ingredients: {
      'Folhas de Citrus': Quantity(amount: 28, unit: 'g'),
      'Dextrose': Quantity(amount: 20, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'As folhas não podem ser de limoeiro.',
      'Lavar as folhas de Citrus e pesar a quantidade certa.',
      'Autoclavar as folhas por 20 minutos a 121 ℃.',
      'Coar o líquido e completar o volume para 1 L.',
      'Adicionar 20g de Dextrose e dissolver.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'J.G. Figueiredo, E.H. Goulin, F. Tanaka, D. Stringari, ' +
        'V. Kava-Cordeiro, L.V. Galli-Terasawa, C.C. Staats, A. Schrank, ' +
        'C. Glienke. Agrobacterium tumefaciens-mediated transformation ' +
        'of Guignardia citricarpa. Journal of Microbiological Methods. ' +
        '80 (2): 143:147. 2010. ISSN 0167-7012. ' +
        'https://doi.org/10.1016/j.mimet.2009.11.014.',
  ),
  Medium(
    initials: 'CzYA',
    longName: 'Czapek Yeast Agar',
    ingredients: {
      'NaNO₃': Quantity(amount: 2, unit: 'g'),
      'KCl': Quantity(amount: 0.5, unit: 'g'),
      'K₂HPO₄': Quantity(amount: 1, unit: 'g'),
      'MgSO₄': Quantity(amount: 0.5, unit: 'g'),
      'FeSO₄': Quantity(amount: 0.01, unit: 'g'),
      'Sacarose': Quantity(amount: 20, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 0.5, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'DYGS',
    longName: 'Dextrose Yeast Glutamine Sucrose',
    ingredients: {
      'Dextrose': Quantity(amount: 2, unit: 'g'),
      'Peptona': Quantity(amount: 1.5, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 2, unit: 'g'),
      'K₂HPO₄': Quantity(amount: 0.5, unit: 'g'),
      'MgSO₄': Quantity(amount: 0.5, unit: 'g'),
      'Glutamina': Quantity(amount: 1.5, unit: 'g'),
      'Ácido Málico': Quantity(amount: 2, unit: 'g'),
      'Ágar': Quantity(amount: 12, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 6.0, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Rodrigues Neto J, Malavolta VA Jr, Victor O (1986). ' +
        'Meio simples para o isolamento e cultivo de Xanthomonas campestris ' +
        'pv. citri tipo B. Summa Phytopathol 12:32',
  ),
  Medium(
    initials: 'ISP1',
    longName: 'International Streptomyces Project Medium 1',
    ingredients: {
      'Caseína': Quantity(amount: 5, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 3, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.0, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
    reference: 'Shirling and Gottlieb. 1966. Int. J. Syst. Bacteriol. 16:313.',
  ),
  Medium(
    initials: 'ISP2',
    longName: 'International Streptomyces Project Medium 2',
    ingredients: {
      'Dextrose': Quantity(amount: 4, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 4, unit: 'g'),
      'Extrato de Malte': Quantity(amount: 10, unit: 'g'),
      'Ágar': Quantity(amount: 20, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.2, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Shirling and Gottlieb. 1966. Int. J. Syst. Bacteriol. 16:313.',
  ),
  Medium(
    initials: 'ISP3',
    longName: 'International Streptomyces Project Medium 3',
    ingredients: {
      'Aveia': Quantity(amount: 20, unit: 'g'),
      'Solução Traços': Quantity(amount: 1, unit: 'mL'),
      'Ágar': Quantity(amount: 18, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.2, unit: ''),
    },
    steps: [
      'Ferve-se a aveia em 800 mL água destilada no microondas ' +
          '(em baixa potência) por 20 minutos',
      'Depois passa-se o mingau resultante por um coador, ' +
          'descartando-se os flocos retidos.',
      'Adicionar os ingredientes ao caldo da aveia.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Shirling and Gottlieb. 1966. Int. J. Syst. Bacteriol. 16:313.',
  ),
  Medium(
    initials: 'ISP4',
    longName: 'International Streptomyces Project Medium 4',
    ingredients: {
      'Amido Solúvel': Quantity(amount: 10, unit: 'g'),
      'K₂HPO₄': Quantity(amount: 1, unit: 'g'),
      'MgSO₄': Quantity(amount: 1, unit: 'g'),
      'NaCl': Quantity(amount: 1, unit: 'g'),
      '(NH₄)₂SO₄': Quantity(amount: 2, unit: 'g'),
      'CaCo₃': Quantity(amount: 2, unit: 'g'),
      'Solução Traços': Quantity(amount: 1, unit: 'mL'),
      'Ágar': Quantity(amount: 20, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.2, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Shirling and Gottlieb. 1966. Int. J. Syst. Bacteriol. 16:313.',
  ),
  Medium(
    initials: 'ISP5',
    longName: 'International Streptomyces Project Medium 5',
    ingredients: {
      'L-aspargina': Quantity(amount: 1, unit: 'g'),
      'Glicerol': Quantity(amount: 10, unit: 'mL'),
      'K₂HPO₄': Quantity(amount: 1, unit: 'g'),
      'Solução Traços': Quantity(amount: 1, unit: 'mL'),
      'Ágar': Quantity(amount: 20, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.2, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Shirling and Gottlieb. 1966. Int. J. Syst. Bacteriol. 16:313.',
  ),
  Medium(
    initials: 'LB',
    longName: 'Caldo Luria-Bertani',
    ingredients: {
      'Triptona': Quantity(amount: 10, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 5, unit: 'g'),
      'NaCl': Quantity(amount: 10, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
    reference: 'Bertani G. Studies on lysogenesis. I. The mode of phage ' +
        'liberation by lysogenic Escherichia coli. J Bacteriol. 1951 Sep;' +
        '62(3):293-300. doi: 10.1128/jb.62.3.293-300.1951. PMID: 14888646; ' +
        'PMCID: PMC386127.',
    ps: 'Com o acréscimo de 15g/L de ágar, temos o meio em estado sólido.',
  ),
  Medium(
    initials: 'MC',
    longName: 'Meio Completo',
    ingredients: {
      'NaNO₃': Quantity(amount: 6, unit: 'g'),
      'KCl': Quantity(amount: 0.5, unit: 'g'),
      'KH₂PO₄': Quantity(amount: 1.5, unit: 'g'),
      'MgSO₄': Quantity(amount: 0.5, unit: 'g'),
      'FeSO₄': Quantity(amount: 0.01, unit: 'g'),
      'ZnSO₄': Quantity(amount: 0.01, unit: 'g'),
      'Dextrose': Quantity(amount: 10, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 2, unit: 'g'),
      'Peptona': Quantity(amount: 2, unit: 'g'),
      'Caseína': Quantity(amount: 1.5, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'Solução de Vitaminas 1': Quantity(amount: 1, unit: 'mL'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'MHA',
    longName: 'Mueller-Hinton Agar',
    ingredients: {
      'Extrato de Carne': Quantity(amount: 2, unit: 'g'),
      'Amido Solúvel': Quantity(amount: 1.5, unit: 'g'),
      'Caseína': Quantity(amount: 17.5, unit: 'g'),
      'Ágar': Quantity(amount: 17, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.0, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Mueller, J. H.; Hinton, J. (1 October 1941). A Protein-Free ' +
        'Medium for Primary Isolation of the Gonococcus and Meningococcus. ' +
        'Experimental Biology and Medicine. 48 (1): 330–333. ' +
        'doi:10.3181/00379727-48-13311.',
  ),
  Medium(
    initials: 'MM',
    longName: 'Meio Mínimo',
    ingredients: {
      'NaNO₃': Quantity(amount: 6, unit: 'g'),
      'KCl': Quantity(amount: 0.5, unit: 'g'),
      'KH₂PO₄': Quantity(amount: 1.5, unit: 'g'),
      'MgSO₄': Quantity(amount: 0.5, unit: 'g'),
      'FeSO₄': Quantity(amount: 0.01, unit: 'g'),
      'ZnSO₄': Quantity(amount: 0.01, unit: 'g'),
      'Dextrose': Quantity(amount: 10, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'MEA',
    longName: 'Malt Extract Agar',
    ingredients: {
      'Extrato de Malte': Quantity(amount: 20, unit: 'g'),
      'Dextrose': Quantity(amount: 20, unit: 'g'),
      'Peptona': Quantity(amount: 1, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'NA',
    longName: 'Nutrient Agar',
    ingredients: {
      'Extrato de Carne': Quantity(amount: 3, unit: 'g'),
      'Peptona': Quantity(amount: 5, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'NBY',
    longName: 'Nutrient Broth Yeast Extract',
    ingredients: {
      'Peptona': Quantity(amount: 5, unit: 'g'),
      'Extrato de Carne': Quantity(amount: 3, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 3, unit: 'g'),
      'K₂HPO₄': Quantity(amount: 2, unit: 'g'),
      'KH₂PO₄': Quantity(amount: 0.5, unit: 'g'),
      'Ágar': Quantity(amount: 12, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.2, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'NfB',
    longName: 'Nitrogen-fixing Bacteria ',
    ingredients: {
      'Ácido Málico': Quantity(amount: 5, unit: 'g'),
      'K₂HPO₄': Quantity(amount: 0.5, unit: 'g'),
      'MgSO₄': Quantity(amount: 0.2, unit: 'g'),
      'NaCl': Quantity(amount: 0.1, unit: 'g'),
      'CaCl₂': Quantity(amount: 0.02, unit: 'g'),
      'Solução de Micronutrientes': Quantity(amount: 2, unit: 'mL'),
      'Azul de Bromotimol (0,5%)': Quantity(amount: 2, unit: 'mL'),
      'FeEDTA (4M)': Quantity(amount: 4, unit: 'mL'),
      'Solução de Vitaminas 2': Quantity(amount: 1, unit: 'mL'),
      'KOH': Quantity(amount: 4.5, unit: 'g'),
      'Ágar': Quantity(amount: 1.8, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.semisolid,
    reference: 'Hartmann A., Baldani J.I. The genus Azospirillum. ' +
        'The Prokaryotes, V. 5: Proteobacteria Alpha and Beta Subclasses' +
        'Eds. M. Dworkin, S. Falkow, E. Rosenberg, K.H. Schleifer, E. ' +
        'Stackebrandt. – Springer Verlag, New York, USA, 2006. P. 115–140.',
    ps: 'O meio pode ser líquido, semi-sólido ou sólido de acordo ' +
        'com a quantidade de ágar adicionado.',
  ),
  Medium(
    initials: 'OMA',
    longName: 'Oatmeal Ágar',
    ingredients: {
      'Aveia em Flocos': Quantity(amount: 20, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Ferve-se a aveia com água destilada no microondas ' +
          '(em baixa potência) por 20 minutos',
      'Depois passa-se o mingau resultante por um coador, ' +
          'descartando-se os flocos retidos.',
      'Deve-se cuidar para que a maioria do produto não seja ' +
          'desperdiçada ao aquecer o mingau.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Ajustar o pH de acordo com a necessidade.',
    ],
    mediumState: PhysicalState.solid,
  ),
  Medium(
    initials: 'SDA',
    longName: 'Sabourand Dextrose Agar',
    ingredients: {
      'Peptona': Quantity(amount: 15, unit: 'g'),
      'Dextrose': Quantity(amount: 45, unit: 'g'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
    reference: 'Emmons, C. W., et al., Medical Mycology, 2nd ed., ' +
        'Lea and Febiger, Philadelphia, 1970. ',
  ),
  Medium(
    initials: 'SG',
    longName: 'Spermatogonial Culture Medium',
    ingredients: {
      'Dextrose': Quantity(amount: 20, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 5, unit: 'g'),
      'Extrato de Soja': Quantity(amount: 10, unit: 'g'),
      'CoCl₂': Quantity(amount: 1, unit: 'mg'),
      'CaCo₃': Quantity(amount: 2, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Com o acréscimo de 15g/L de ágar, temos o meio em estado sólido.',
  ),
  Medium(
    initials: 'SMn',
    longName: 'Solução de Micronutrientes',
    ingredients: {
      'CuSO₄ 5H₂O': Quantity(amount: 0.4, unit: 'g'),
      'ZnSO₄ 7H₂O': Quantity(amount: 0.12, unit: 'g'),
      'H₃BO₃': Quantity(amount: 1.4, unit: 'g'),
      'Na₂MoO₄ 2H₂O': Quantity(amount: 1, unit: 'g'),
      'MnSO₄ H₂O': Quantity(amount: 1.5, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar a solução em frasco escuro a 4℃.',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Utilizada no meio NfB.',
    isComplement: true,
  ),
  Medium(
    initials: 'SOB',
    longName: 'Super Optmal Broth',
    ingredients: {
      'Triptona': Quantity(amount: 20, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 5, unit: 'g'),
      'NaCl': Quantity(amount: 0.584, unit: 'g'),
      'KCl': Quantity(amount: 0.186, unit: 'g'),
      'MgCl₂': Quantity(amount: 0.952, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
      'pH': Quantity(amount: 7.0, unit: ''),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Os 0,952g de MgCl₂ podem ser substituídos por 1,204g de MgSO₄.',
    reference: 'Hanahan, D. (1983). Studies on transformation of ' +
        'Escherichia coli with plasmids. Journal of Molecular Biology. ' +
        '166 (4): 557–580. doi:10.1016/S0022-2836(83)80284-8. PMID 6345791',
  ),
  Medium(
    initials: 'SOC',
    longName: 'Super Optmal Broth with Catabolite Repression',
    ingredients: {
      'Triptona': Quantity(amount: 20, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 5, unit: 'g'),
      'NaCl': Quantity(amount: 0.584, unit: 'g'),
      'KCl': Quantity(amount: 0.186, unit: 'g'),
      'MgCl₂': Quantity(amount: 0.952, unit: 'g'),
      'Dextrose': Quantity(amount: 3.603, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Os 0,952g de MgCl₂ podem ser substituídos por 1,204g de MgSO₄.',
    reference: 'Hanahan, D. (1983). Studies on transformation of ' +
        'Escherichia coli with plasmids. Journal of Molecular Biology. ' +
        '166 (4): 557–580. doi:10.1016/S0022-2836(83)80284-8. PMID 6345791',
  ),
  Medium(
    initials: 'ST',
    longName: 'Solução Traços',
    ingredients: {
      'FeSO₄': Quantity(amount: 1, unit: 'mg'),
      'MnCl₂': Quantity(amount: 1, unit: 'mg'),
      'ZnSO₄': Quantity(amount: 1, unit: 'mg'),
      'dH₂O': Quantity(amount: 100, unit: 'mL'),
    },
    steps: [
      'Adicionar os ingredientes em 80mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 100mL.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Utilizada nos meios ISP 3, 4 e 5.',
    isComplement: true,
  ),
  Medium(
    initials: 'SV1',
    longName: 'Solução de Vitaminas 1',
    ingredients: {
      'Ácido Nicotínico': Quantity(amount: 100, unit: 'mg'),
      'Ácido p-aminobenzóico': Quantity(amount: 10, unit: 'mg'),
      'Biotina': Quantity(amount: 0.2, unit: 'mg'),
      'Piridoxina': Quantity(amount: 50, unit: 'mg'),
      'Riboflavina': Quantity(amount: 100, unit: 'mg'),
      'Tiamina': Quantity(amount: 50, unit: 'mg'),
      'dH₂O': Quantity(amount: 100, unit: 'mL'),
    },
    steps: [
      'Adicionar os ingredientes em 80mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 100mL.',
      'A solução deve ser aquecida a 100℃ em banho maria por 15 minutos ' +
          'uma vez ao dia, durante três dias consecutivos. Armazena-se ' +
          'então a solução em frasco escuro a 4℃ sob clorofórmio (5µL).',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Utilizada no Meio Completo.',
    isComplement: true,
  ),
  Medium(
    initials: 'SV2',
    longName: 'Solução de Vitaminas 2',
    ingredients: {
      'Biotina': Quantity(amount: 10, unit: 'mg'),
      'Piridoxina': Quantity(amount: 20, unit: 'mg'),
      'dH₂O': Quantity(amount: 100, unit: 'mL'),
    },
    steps: [
      'Adicionar os ingredientes em 80mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 100mL.',
      'A solução deve ser aquecida a 100℃ em banho maria por 15 minutos ' +
          'uma vez ao dia, durante três dias consecutivos. Armazena-se ' +
          'então a solução em frasco escuro a 4℃ sob clorofórmio (5µL).',
    ],
    mediumState: PhysicalState.liquid,
    ps: 'Utilizada no meio NfB.',
    isComplement: true,
  ),
  Medium(
    initials: 'TY',
    longName: 'Triptone Yeast Extract',
    ingredients: {
      'Triptona': Quantity(amount: 5, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 3, unit: 'g'),
      'MgSO₄': Quantity(amount: 2, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
  ),
  Medium(
    initials: 'YES',
    longName: 'Yeast Extract Sucrose',
    ingredients: {
      'Extrato de Levedura': Quantity(amount: 1, unit: 'g'),
      'Sacarose': Quantity(amount: 171.15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.liquid,
  ),
  Medium(
    initials: 'YMA',
    longName: 'Yeast Mannitol Agar',
    ingredients: {
      'Manitol': Quantity(amount: 10, unit: 'g'),
      'K₂HPO₄': Quantity(amount: 0.5, unit: 'g'),
      'NaCl': Quantity(amount: 0.1, unit: 'g'),
      'MgSO₄': Quantity(amount: 0.2, unit: 'g'),
      'Extrato de Levedura': Quantity(amount: 1, unit: 'g'),
      'Azul de Bromotimol (0,5%)': Quantity(amount: 5, unit: 'mL'),
      'Ágar': Quantity(amount: 15, unit: 'g'),
      'dH₂O': Quantity(amount: 1, unit: 'L'),
    },
    steps: [
      'Adicionar os ingredientes em 800mL de água destilada.',
      'Misturar bem até diluir todos os ingredientes.',
      'Completar o volume para 1 litro.',
      'Ajustar o pH conforme necessário.',
      'O ágar deve ser pesado e colocado nos frascos sem meio, o qual ' +
          'é adicionado sobre o ágar.',
      'Esterilizar em autoclave por 20 minutos a 121 ℃.',
      'Armazenar à temperatura ambiente.',
    ],
    mediumState: PhysicalState.solid,
  ),
];
