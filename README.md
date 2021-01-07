
# Тестовое задание для Avito

### Задание:
- Реализовать экран в соответствии с примером [макета](https://github.com/avito-tech/internship/blob/main/screen.png). Отступы, шрифты - на глаз по картине
- Данные для экрана парсить из [json файла](https://github.com/avito-tech/internship/blob/main/result.json)

### Логика взаимодействия:
- Элементы на сером фоне и кнопка "Выбрать" кликабельные, крестик нет
- При нажатии на элемент он выделяется (отмечается синей галочкой) или отменяется
- Одновременно может быть отмечен только один элемент
- При нажатии кнопки выбора показывается алерт с названием выбраной услуги

### Реализация включает в себя:
+ VIPER в качестве архитектурного подхода
+ UICollectionView для отображения элементов 
+ Отсутствие SwiftUI и внешних зависимостей 
+ Отсутствие Storyboard

###  Замечания и предложения:
+ Для кеширования изображений используется словарь, который хранит соответствие id объявления и его иконки. Это позволяет не обращаться к сетевому сервису каждый раз, когда коллекция потребует перезагрузить ячейку (например при скролле), и быстро получить уже загруженное изображение из оперативной памяти. В случае необходимости оптимизировать потребление оперативной памяти (например при росте количества ячеек в будущем), можно преобразовать словарь в объект NSCache или использовать специальные библиотеки для кеширования изображений, например [Kingfisher](https://github.com/onevcat/Kingfisher).
+ В требованиях к заданию не были указаны версии iOS, которые необходимо поддерживать. В данной реализации, коллекция использует [Compositional Layout](https://developer.apple.com/documentation/uikit/uicollectionviewcompositionallayout). Если нужно поддерживать iOS 12 и более ранние версии, то ее необходимо заменить на Flow Layout. 
+ Чтобы вручную не вызывать Assembly из кода, можно использовать одну из библиотеку для Dependency Injection, например [Swinject](https://github.com/Swinject/Swinject) или [Typhoon](https://github.com/appsquickly/Typhoon).
+ Сложность создания модулей - один из недостатков VIPER. Для того чтобы внедрить новый модуль, необходимо создать множество классов и протоколов. Слишком много времени уходит на механическую работу. Для того чтобы минимизировать временные затраты на создание модулей, можно использовать утилиты для кодогенерации VIPER-компонентов, например [Generamba](https://github.com/rambler-digital-solutions/Generamba).

### Скриншоты:/var/folders/y2/ztgccrxn20b48tb1xsvdtr800000gn/T/simulator_screenshot_ED10ED18-A6F7-4129-9994-EC6024D6A3C5.png
<p align="center">
  <img src = "https://github.com/MalyshevMaksim/Avito-Intership/blob/main/Screenshots/1.png" width="350"/>
  <img src = "https://github.com/MalyshevMaksim/Avito-Intership/blob/main/Screenshots/2.png" width="350"/>
</p>

### Gif:
![me](https://github.com/MalyshevMaksim/Avito-Intership/blob/main/Screenshots/avito-tech.gif)
