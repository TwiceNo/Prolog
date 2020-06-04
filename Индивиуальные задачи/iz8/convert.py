monster_name = {'alghoul'   : "Альгуль",
                'alp'       : "Альп",
                'arachas'   : "Главоглаз",
                'barghest'  : "Баргест",
                'basilisk'  : "Василиск",
                'botchling' : "Игоша",
                'bruxa'     : "Брукса",
                'djinn'     : "Джинн",
                'doppler'   : "Допплер",
                'drowner'   : "Утопец",
                'ekimmara'  : "Экимма",
                'endrega'   : "Эндриага",
                'fiend'     : "Бес",
                'fleder'    : "Фледер",
                'foglet'    : "Туманник",
                'forktail'  : "Вилохвост",
                'gargoyle'  : "Гаргулья",
                'ghoul'     : "Гуль",
                'godling'   : "Прибожек",
                'harpy'     : "Гарпия",
                'katakan'   : "Катакан",
                'leshen'    : "Леший",
                'nekker'    : "Накер",
                'nigthwraith': "Полуночница",
                'noonwraith': "Полуденница",
                'siren'     : "Сирена",
                'water_hag' : "Водная баба",
                'werewolf'  : "Волколак",
                'wraith'    : "Призак"
                }
monster_class = {'1' : "Проклятые",
                 '2' : "Дракониды",
                 '3' : "Элементали",
                 '4' : "Гибриды",
                 '5' : "Инсектоиды",
                 '6' : "Трупоеды",
                 '7' : "Огроиды",
                 '8' : "Реликты",
                 '9' : "Духи",
                 '10': "Вампиры"
                 }
monster_type ={'0': "Одиночка",
               '1': "Стайное",
               '2': "И то, и другое"
               }
monster_sen = {'0': "Неразумное",
               '1': "Разумное"
              }
monster_poly = {'0': "Нет",
                '1': "Да"
               }
monster_act = {'0': "Ночь",
               '1': "День",
               '2': "Не имеет значения"
              }
monster_hab = {'0': "Практически везде",
               '1': "Горы и пещеры",
               '2': "Водоемы",
               '3': "Сельская местность",
               '4': "Леса",
               '5': "Под землей",
               '6': "Кладбища, поля битв",
               '7': "Замки, руины",
               '8': "Где-то еще"
               }
monster_ab = {'0': "Нет особой",
              '1': "Исчезает и появляется",
              '2': "Становится невидимым",
              '3': "Призывает других чудовищ или зверей",
              '4': "Оглушает противника",
              '5': "Отравляет противника",
              '6': "Ослепляет противника",
              '7': "Атакует с высоты",
              '8': "Атакует силами стихий"
             }



def translate_name(name):
    return get_key(name, monster_name)


def get_key(value, dict):
    for key in dict:
        if dict[key] == value:
            return key
    return translit(value)


def translit(name):
    name = name.lower()
    translated = ""
    for char in name:
        if char == " ":
            translated.join('_')
        elif char == "а": translated += ("a")
        elif char == "б": translated += ("b")
        elif char == "в": translated += ("v")
        elif char == "г": translated += ("g")
        elif char == "д": translated += ("d")
        elif char == "е": translated += ("e")
        elif char == "ё": translated += ("yo")
        elif char == "ж": translated += ("zh")
        elif char == "з": translated += ("z")
        elif char == "и": translated += ("i")
        elif char == "й": translated += ("y")
        elif char == "к": translated += ("k")
        elif char == "л": translated += ("l")
        elif char == "м": translated += ("m")
        elif char == "н": translated += ("n")
        elif char == "о": translated += ("o")
        elif char == "п": translated += ("p")
        elif char == "р": translated += ("r")
        elif char == "с": translated += ("s")
        elif char == "т": translated += ("t")
        elif char == "у": translated += ("u")
        elif char == "ф": translated += ("f")
        elif char == "х": translated += ("h")
        elif char == "ц": translated += ("c")
        elif char == "ч": translated += ("ch")
        elif char == "ш": translated += ("sh")
        elif char == "щ": translated += ("sch")
        elif char == "ъ": translated += ("")
        elif char == "ь": translated += ("")
        elif char == "э": translated += ("e")
        elif char == "ю": translated += ("yu")
        elif char == "я": translated += ("ya")
        else: translated.join(char)
    return translated


