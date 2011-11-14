## Buyers (каталог покупок)

  Данное приложение предназначено для обмена пользователями информацией
о своих покупках (название, цена, город покупки, изображение).
  Любой зашедший на страницу может просмотреть информацию о покупках
других пользователей, доступен поиск по названию, городу и макс. стоимости.
  Для того чтобы добавить информацию о своей покупке пользователь должен
зарегестрироваться либо войти в систему (если он уже зарегистрирован).
  После входа пользователю становится доступно создание покупки (New purchase),
добавляется возможность поиска только своих покупок (галка напротив My purchases
в поиске), он может редактировать (Edit) или удалить свои покупки (Destroy).
Вошедший в приложение пользователь может оставлять комментарии ко всем покупкам
и голосовать за (+) или против (-) них, так же он может проголосовать за любой
комментарий. В разделе My info пользователь может изменить информацию о себе,
в том числе сменить пароль и email.
  Удалить свой профиль можно выбрав пункт Cancel my account, при этом удалится
вся информация не только о пользователе, но и о всех его покупках.

Приложение разработано в rails 3.1.1 с использованием следующих гемов:

sqlite3                            - база данных
devise                             - аутентификация пользователя
rails3-jquery-autocomplete         - гем для полей с автозаполнением
paperclip                          - загрузка рисунков
acts_as_commentable_with_threading - комментарии
acts_as_votable                    - голоса

С приложением идет комплект всех необходимых миграций, при необходимости
можно создать новую базу командой - rake db:migrate, сразу после этого
нужно сделать rake db:seed (добавление наименований городов в таблицу Cities)