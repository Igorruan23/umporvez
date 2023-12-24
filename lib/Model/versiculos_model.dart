import 'dart:math';

class VersiculosClass {
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
  ];
  String getVersiculoAleatorio() {
    final random = Random();
    final index = random.nextInt(Versiculos.length);
    return Versiculos[index];
  }
}
