#import "../template.typ": *

#cvSection("Проекты")

#cvProject(
  title: [#link("https://github.com/tensorush/bookkeeper")[#gh #hSpc() bookkeeper]],
  description: [#emoji.hamster #emoji.books Серверная часть для бухгалтерской службы.]
)

#cvProject(
  title: [#link("https://github.com/tensorush/zig-msgpuck")[#gh #hSpc() msgpuck]],
  description: [#emoji.lizard #emoji.mail Zig-порт формата бинарной сериализации MessagePack, реализованный командой Tarantool.]
)

#cvProject(
  title: [#link("https://github.com/tensorush/zig-uuid")[#gh #hSpc() uuid]],
  description: [#emoji.lizard #emoji.id Zig-реализация всех версий всемирно уникального идентификатора (UUID).]
)

#cvProject(
  title: [#link("https://github.com/tensorush/vault")[#gh #hSpc() vault]],
  description: [#emoji.hamster #emoji.lock Telegram-бот для безопасного хранения паролей.]
)
