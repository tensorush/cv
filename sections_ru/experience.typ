#import "../template.typ": *

#cvSection("Опыт")

#cvEntry(
  title: [Cloud Software Engineer (Python/Rust/SQL)],
  society: [#link("https://github.com/Stabl-Energy")[#gh #hSpc() STABL Energy] #hDot() Стажировка],
  date: [Январь 2023 - Март 2023 #hDot() 3 месяца],
  location: [Мюнхен, Германия #hDot() Комбинированный режим],
  logo: "./assets/logos/stb.png",
  description: list(marker: [➤],
    [Написал Rust-клиент для отправки логов в Grafana Loki.],
    [Мигрировал +20 GiB данных IoT-датчиков из AWS Timestream в InfluxDB.],
    [Настраивал автоматическое создание конфигурируемых панелей в Grafana.],
    [Настраивал CI пайплайны для тестирования и линтинга проектов на Python и Rust.],
    [Прошил +10 ESP32-S2 устройств посредством специальной бутстрэп программы и драйвера CP210x.],
    [Писал эффективные FluxQL запросы для очистки, резервного копирования и восстановления данных InfluxDB.],
  )
)

#cvEntry(
  title: [Deep Learning Engineer (Python/C++/CUDA)],
  society: [#link("https://github.com/phygitalism")[#gh #hSpc() PHYGITALISM] #hDot() Полная занятость],
  date: [Октябрь 2021 - Апрель 2022 #hDot() 7 месяцев],
  location: [Москва, Россия #hDot() Комбинированный режим],
  logo: "./assets/logos/phy.png",
  description: list(marker: [➤],
    [Реализовал алгоритм обнаружения границ облака точек из научной публикации на Python.],
    [Адаптировал модели RIFE и AdaAttN в качестве веб-сервисов при помощи Docker и RabbitMQ.],
    [Сравнивал нейронные и дифференцируемые рендереры и составлял обзор последних статей.],
    [Помогал разработать пайплайна данных для обучения модели Point Transformer на дорожных знаках.],
    [Разработал пайплайн реконструкции меша по облакам точек помещений при помощи C++ библиотеки CGAL.],
    [Выполнял предварительную обработка, анализ и визуализацию данных облаков точек дорожных LIDAR-сканов.],
    [Протестировал модель NeRF из проекта InstantNGP и создал PR для настройки проекта при помощи DevContainer.],
  )
)
