//
//  EmojiModel.swift
//  EmojiReader
//
//  Created by Андрей Дуров on 09.12.2021.
//

import Foundation

struct Emoji {      //Модели данных создаются именно с помощью структур, к тому же структура сама создает стандартный инициализатор со всеми свойствами, хранящимися внутри структруы
    var emoji: String
    var name: String
    var description: String
    var isFavourite: Bool
}
