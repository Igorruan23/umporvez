import 'dart:math';

class MotivacaoClass {
  List<String> Versiculos = [
    "Não se deixem vencer pelo mal, mas vençam o mal com o bem. - Romanos 12:21",
    "Tudo posso naquele que me fortalece. - Filipenses 4:13",
    "O Senhor é a minha luz e a minha salvação; de quem terei temor? - Salmo 27:1",
    "Mas aqueles que esperam no Senhor renovarão as suas forças. Voarão alto como águias; correrão e não ficarão exaustos, andarão e não se cansarão. - Isaías 40:31",
    "Ora, a fé é a certeza daquilo que esperamos e a prova das coisas que não vemos. - Hebreus 11:1",
    "Confie no Senhor de todo o seu coração e não se apoie em seu próprio entendimento. - Provérbios 3:5",
    "Mas os que confiam no Senhor renovam as suas forças. Voam alto como águias; correm e não ficam exaustos, andam e não se cansam. - Isaías 40:31",
    "Deem graças em todas as circunstâncias, pois esta é a vontade de Deus para vocês em Cristo Jesus. - 1 Tessalonicenses 5:18",
    "O amor é paciente, o amor é bondoso. Não inveja, não se vangloria, não se orgulha. - 1 Coríntios 13:4",
    "Não se preocupem com nada, mas em todas as orações peçam a Deus o que vocês precisam e orem sempre com o coração agradecido. - Filipenses 4:6",
    "Porque eu bem sei os planos que tenho para vocês, diz o Senhor, planos de prosperidade e não de calamidade, para dar a vocês um futuro e uma esperança. - Jeremias 29:11",
    "Se Deus é por nós, quem será contra nós? - Romanos 8:31",
    "O Senhor é o meu pastor; de nada terei falta. - Salmo 23:1",
    "Não se amoldem ao padrão deste mundo, mas transformem-se pela renovação da sua mente. - Romanos 12:2",
    "Esforçai-vos, e Ele fortalecerá o vosso coração, vós todos que esperais no Senhor. - Salmo 31:24",
    "Esforça-te, e tem bom ânimo; não temas, nem te espantes, porque o Senhor, teu Deus, é contigo, por onde quer que andares. - Josué 1:9"
        "Porque para Deus nada será impossível.- Lucas 1:37",
    "Deus é o nosso refúgio e fortaleza, socorro bem presente na angústia. - Salmo 46:1",
    "Sujeitem-se, pois, a Deus, resistam ao Diabo, e ele fugirá de vocês. - Tiago 4:7",
    "A fé em Deus é a âncora que nos mantém firmes durante as tempestades da vida.",
    "Quando a vida coloca obstáculos no seu caminho, confie em Deus para ser sua força para superá-los.",
    "A cada novo amanhecer, recebemos uma nova chance pela graça de Deus para alcançar nossos objetivos.",
    "Deus nunca disse que a jornada seria fácil, mas Ele prometeu estar conosco a cada passo do caminho.",
    "Em Deus, encontramos a coragem para enfrentar nossos medos e a determinação para seguir adiante.",
    "A esperança em Deus é a luz que brilha mesmo nas mais escuras situações.",
    "Confie no tempo de Deus; Ele sempre está trabalhando por trás das cenas para realizar o melhor para você.",
    "A oração é a chave que abre as portas para novas oportunidades e possibilidades.",
    "A fé é acreditar naquilo que ainda não vemos, mas sabemos que Deus está no controle.",
    "A vida é uma jornada de fé, onde cada passo é guiado pela vontade de Deus.",
  ];
  String getMotivacaoAleatoria() {
    final random = Random();
    final index = random.nextInt(Versiculos.length);
    return Versiculos[index];
  }
}
