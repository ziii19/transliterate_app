const Map<String, String> LATIN = {
  // panungtung
  '+ng': '\u1B80',
  '+r': '\u1B81',
  '+h': '\u1B82',
  '+O': '\u1BAA',
  // vokal mandiri
  'A': '\u1B83',
  'I': '\u1B84',
  'U': '\u1B85',
  '\u00C9': '\u1B86', // É
  'O': '\u1B87',
  'E': '\u1B88',
  'EU': '\u1B89',
  // konsonan ngalagena
  'k': '\u1B8A',
  'q': '\u1B8B',
  'g': '\u1B8C',
  'ng': '\u1B8D',
  'c': '\u1B8E',
  'j': '\u1B8F',
  'z': '\u1B90',
  'ny': '\u1B91',
  't': '\u1B92',
  'd': '\u1B93',
  'n': '\u1B94',
  'p': '\u1B95',
  'f': '\u1B96',
  'v': '\u1B97',
  'b': '\u1B98',
  'm': '\u1B99',
  'y': '\u1B9A',
  'r': '\u1B9B',
  'l': '\u1B9C',
  'w': '\u1B9D',
  's': '\u1B9E',
  'x': '\u1B9F',
  'h': '\u1BA0',
  'kh': '\u1BAE',
  'sy': '\u1BAF',
  // konsonan sisip
  '+ya': '\u1BA1',
  '+ra': '\u1BA2',
  '+la': '\u1BA3',
  // suara vokal
  'a': '',
  'i': '\u1BA4',
  'u': '\u1BA5',
  '\u00E9': '\u1BA6', // é
  'o': '\u1BA7',
  'e': '\u1BA8',
  'eu': '\u1BA9',
  // angka
  '0': '\u1BB0',
  '1': '\u1BB1',
  '2': '\u1BB2',
  '3': '\u1BB3',
  '4': '\u1BB4',
  '5': '\u1BB5',
  '6': '\u1BB6',
  '7': '\u1BB7',
  '8': '\u1BB8',
  '9': '\u1BB9',
};

const Map<String, String> SUNDA = {
  '\u1B8A': 'k',
  '\u1B8B': 'q',
  '\u1B8C': 'g',
  '\u1B8D': 'ng',
  '\u1B8E': 'c',
  '\u1B8F': 'j',
  '\u1B90': 'z',
  '\u1B91': 'ny',
  '\u1B92': 't',
  '\u1B93': 'd',
  '\u1B94': 'n',
  '\u1B95': 'p',
  '\u1B96': 'f',
  '\u1B97': 'v',
  '\u1B98': 'b',
  '\u1B99': 'm',
  '\u1B9A': 'y',
  '\u1B9B': 'r',
  '\u1B9C': 'l',
  '\u1B9D': 'w',
  '\u1B9E': 's',
  '\u1B9F': 'x',
  '\u1BA0': 'h',
  '\u1BAE': 'kh',
  '\u1BAF': 'sy',
  '\u1BA4': 'i',
  '\u1BA5': 'u',
  '\u1BA6': '\u00E9', // é
  '\u1BA7': 'o',
  '\u1BA8': 'e',
  '\u1BA9': 'eu',
  '\u1BAA': '',
  '\u1B83': 'a',
  '\u1B84': 'i',
  '\u1B85': 'u',
  '\u1B86': '\u00E9', // é
  '\u1B87': 'o',
  '\u1B88': 'e',
  '\u1B89': 'eu',
  '\u1BA1': 'y',
  '\u1BA2': 'r',
  '\u1BA3': 'l',
  '\u1B80': 'ng',
  '\u1B81': 'r',
  '\u1B82': 'h',
  '\u1BB0': '0',
  '\u1BB1': '1',
  '\u1BB2': '2',
  '\u1BB3': '3',
  '\u1BB4': '4',
  '\u1BB5': '5',
  '\u1BB6': '6',
  '\u1BB7': '7',
  '\u1BB8': '8',
  '\u1BB9': '9',
};

const int PAT_V = 1;
const int PAT_VK = 2;
const int PAT_KV = 3;
const int PAT_KVK = 4;
const int PAT_KRV = 5;
const int PAT_KRVK = 6;
const int PAT_SILABA = 7;
const int PAT_LAIN = 0;

class TransliterasiService {
  static String _sundaAkhir(String char) {
    if (char == 'h' || char == 'r' || char == 'ng') {
      return LATIN['+$char'] ?? '';
    } else {
      return (LATIN[char] ?? '') + (LATIN['+O'] ?? '');
    }
  }

  static String latinToSunda(String text) {
    text = text.toLowerCase();

    int iLengt = text.length;
    int idx = 0;

    String tStr = '';
    String oStr = '';
    RegExp exp = RegExp(r'^');
    Match? r;
    String suku;
    int polasuku = PAT_LAIN;

    // Pola V, VK, K, KV, KVK, KRV, KRVK:
    String KONS = 'kh|sy|[b-df-hj-mp-tv-z]|ng|ny|n';
    String VOK = '[aiuo\u00E9]|eu|e';
    String REP = '[yrl]';
    String SILABA =
        '^($KONS)?($REP)?($VOK)($KONS)?($VOK|$REP)?'; // regex silaba
    String KONSONAN = '^($KONS)';
    String DIGIT = r'^([0-9]+)';

    print(SILABA);

    while (idx < iLengt) {
      suku = '';
      r = RegExp(SILABA).firstMatch(text);

      if (r != null) {
        String? grp1 = r.group(1);
        String? grp2 = r.group(2);
        String? grp3 = r.group(3);
        String? grp4 = r.group(4);
        String? grp5 = r.group(5);

        if (grp1 != null) {
          if (grp4 != null) {
            if (grp2 != null) {
              polasuku = grp5 != null ? PAT_KRV : PAT_KRVK;
            } else {
              polasuku = grp5 != null ? PAT_KV : PAT_KVK;
            }
          } else {
            polasuku = grp2 != null ? PAT_KRV : PAT_KV;
          }
        } else {
          polasuku = grp4 != null ? PAT_VK : PAT_V;
        }

        String silaba;
        if (polasuku == PAT_KRVK) {
          suku = grp1! + grp2! + grp3! + grp4!;
          silaba = LATIN[grp1]! +
              LATIN['+$grp2' + 'a']! +
              LATIN[grp3]! +
              _sundaAkhir(grp4!);
        } else if (polasuku == PAT_KRV) {
          suku = grp1! + grp2! + grp3!;
          silaba = LATIN[grp1]! + LATIN['+$grp2' + 'a']! + LATIN[grp3]!;
        } else if (polasuku == PAT_KVK) {
          suku = grp1! + grp3! + grp4!;
          silaba = LATIN[grp1]! + LATIN[grp3]! + _sundaAkhir(grp4!);
        } else if (polasuku == PAT_KV) {
          suku = grp1! + grp3!;
          silaba = LATIN[grp1]! + LATIN[grp3]!;
        } else if (polasuku == PAT_VK) {
          suku = grp3! + grp4!;
          silaba = LATIN[grp3.toUpperCase()]! + _sundaAkhir(grp4!);
        } else {
          suku = grp3!;
          silaba = LATIN[suku.toUpperCase()]!;
        }
        oStr += silaba;
        tStr += '$suku($polasuku):';
      } else {
        r = RegExp(KONSONAN).firstMatch(text);
        if (r != null) {
          suku = r.group(1)!;
          String silaba = LATIN[suku]! + LATIN['+O']!;
          oStr += silaba;
        } else {
          r = RegExp(DIGIT).firstMatch(text);
          if (r != null) {
            suku = r.group(1)!;
            for (var i = 0; i < suku.length; i++) {
              oStr += LATIN[suku[i]]!;
            }
          } else {
            suku = text.substring(0, 1);
            oStr += suku;
          }
        }
      }
      text = text.substring(suku.length);
      idx += suku.length;
    }
    return oStr;
  }

  static String sundaToLatin(String text) {
    int idx = 0;
    int iLength = text.length;
    String oStr = '';

    final RegExp KRV0K = RegExp(
        r'^([\u1B8A-\u1BA0\u1BAE\u1BAF])([\u1BA1-\u1BA3])?([\u1BA4-\u1BAA])?([\u1B80-\u1B82])?');
    final RegExp VK = RegExp(r'^([\u1B83-\u1B89])([\u1B80-\u1B82])?');
    final RegExp angka = RegExp(r'^(\\|)?([\u1BB0-\u1BB9])(\\|)?');

    while (idx < iLength) {
      String suku = '';
      Match? r;

      r = KRV0K.firstMatch(text);
      if (r != null) {
        suku += r[1] ?? '';
        oStr += SUNDA[r[1]] ?? '';

        if (r[2] != null) {
          suku += r[2]!;
          oStr += SUNDA[r[2]] ?? '';
        }
        if (r[3] != null) {
          suku += r[3]!;
          oStr += SUNDA[r[3]] ?? '';
        } else {
          oStr += 'a';
        }
        if (r[4] != null) {
          suku += r[4]!;
          oStr += SUNDA[r[4]] ?? '';
        }
      } else {
        r = VK.firstMatch(text);
        if (r != null) {
          suku += r[1] ?? '';
          oStr += SUNDA[r[1]] ?? '';
          if (r[2] != null) {
            suku += r[2]!;
            oStr += SUNDA[r[2]] ?? '';
          }
        } else {
          r = angka.firstMatch(text);
          if (r != null) {
            oStr += SUNDA[r[2]] ?? '';
          } else {
            suku = text[0];
            oStr += suku;
          }
        }
      }
      text = text.substring(suku.length);
      idx += suku.length;
    }

    return oStr;
  }
}
