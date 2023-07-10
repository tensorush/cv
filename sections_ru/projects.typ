#import "../template.typ": *

#cvSection("Проекты")

#cvProject(
  title: [MessagePack],
  description: [#emoji.lizard #emoji.mail Zig-порт формата бинарной сериализации MessagePack, реализованный командой Tarantool.],
  link: [#link("https://github.com/tensorush/zig-msgpuck")[#gh #hSpc() tensorush/zig-msgpuck]],
  status: [Разрабатывается],
  logo: "./assets/logos/mgp.png"
)

#cvProject(
  title: [Bookkeeper],
  description: [#emoji.hamster #emoji.books Серверная часть бухгалтерской службы.],
  link: [#link("https://github.com/tensorush/bookkeeper")[#gh #hSpc() tensorush/bookkeeper]],
  status: [Завершен],
  logo: "./assets/logos/bkr.png"
)

#cvProject(
  title: [UUID],
  description: [#emoji.lizard #emoji.id Zig-реализация всех версий всемирно уникального идентификатора.],
  link: [#link("https://github.com/tensorush/zig-uuid")[#gh #hSpc() tensorush/zig-uuid]],
  status: [Поддерживается],
  logo: "./assets/logos/uid.png"
)

#cvProject(
  title: [Vault],
  description: [#emoji.hamster #emoji.lock Telegram-бот для безопасного хранения паролей.],
  link: [#link("https://github.com/tensorush/vault")[#gh #hSpc() tensorush/vault]],
  status: [Завершен],
  logo: "./assets/logos/vlt.png"
)
