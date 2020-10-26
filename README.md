# BashingPlugins
A repository of different plugins for my bashing script. Most of these plugins were written on request or as a proof of concept
without putting too much time into testing.

As a result the plugins may be buggy, break in future versions or become obsolete as their functionality goes into the core
system.

If you need help with any of them, you can contact me, but depending on my time I may or may not be able to help you.

**THERE IS NO WARANTY THAT THE THINGS HERE DON'T BREAK ANYTHING.**

Plugins ending with the `.lua` ending are plugins tha should be added via `add file` in the `kconfig bashing`. XML files are
Mudlet plugins.

BashingPartyAnnounce.xml
------------------------

- announces the ID of the target to the party when switching targets.
- uses the events the basher emits.
- toggle on/off with `pt announce`
- call a single target with `ptarg`
 
ManuallyAddPossibleTarget.lua
-----------------------------

- allows the the user to add a possible target to the priority list without killing it first
- useful when hunting in a party in an area that has no prios yet
- use the alias `kconfig bashing addTarget [name|id]` where id is the ID of type of denizen you want to add to the list, or name is the name of the type of denizen you want to add to the list. There must be at least one of what you want to add to the list in your room.
 
NoSystem.lua
------------

- add support for pure server side queueing to the basher
- import the plugin into the basher, set `kconfig bashing system none` and restart mudlet
 
prependAttackQueue.lua
----------------------

- allows the user to specify a queue of commands to be run before the next attack on svo systems
- add new commands to that queue with the function `keneanung.bashing.addFirst(what)`
