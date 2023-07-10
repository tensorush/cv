#import "../template.typ": *

#cvSection("Projects")

#cvProject(
  title: [MessagePack],
  description: [#emoji.lizard #emoji.mail Zig port of the MessagePack binary serialization format implemented by the Tarantool team.],
  link: [#link("https://github.com/tensorush/zig-msgpuck")[#gh #hSpc() tensorush/zig-msgpuck]],
  status: [In development],
  logo: "./assets/logos/mgp.png"
)

#cvProject(
  title: [Bookkeeper],
  description: [#emoji.hamster #emoji.books Server backend for a bookkeeping service.],
  link: [#link("https://github.com/tensorush/bookkeeper")[#gh #hSpc() tensorush/bookkeeper]],
  status: [Completed],
  logo: "./assets/logos/bkr.png"
)

#cvProject(
  title: [UUID],
  description: [#emoji.lizard #emoji.id Zig implementation of all the Universally Unique IDentifier versions.],
  link: [#link("https://github.com/tensorush/zig-uuid")[#gh #hSpc() tensorush/zig-uuid]],
  status: [On maintenance],
  logo: "./assets/logos/uid.png"
)

#cvProject(
  title: [Vault],
  description: [#emoji.hamster #emoji.lock Telegram bot for secure password storage.],
  link: [#link("https://github.com/tensorush/vault")[#gh #hSpc() tensorush/vault]],
  status: [Completed],
  logo: "./assets/logos/vlt.png"
)
