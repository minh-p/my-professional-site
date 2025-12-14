+++
title = "Roblox Non-Layered Grid-Based Server Sharding"
date = 2025-12-14T10:19:00-08:00
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- [Motivation (Quick Bio-Story)](#motivation--quick-bio-story)
- [What is Server Sharding?](#what-is-server-sharding)
    - [Let's Clarify Our Terms, Borrowing Foxhole's](#let-s-clarify-our-terms-borrowing-foxhole-s)
- [What Kind of Game Can You Make on Roblox with Grid-Based Server Sharding?](#what-kind-of-game-can-you-make-on-roblox-with-grid-based-server-sharding)
- [Technical Implementation](#technical-implementation)
    - [Roblox API](#roblox-api)
    - [Basic World and Grids Model](#basic-world-and-grids-model)
    - [Region Spawning](#region-spawning)

</div>
<!--endtoc-->


## Motivation (Quick Bio-Story) {#motivation--quick-bio-story}

I finally got my first part-time job (first ever) which is at _The Coder School_'s Irvine location. My specialization as put on my resume would be coaching young students Roblox Scripting. It has been a while since I have done anything Roblox related (for more than 3 years). While I was away from Roblox, I developed much as a programmer because I learned general programming concepts, developing a web app, interacting with database, and now simultaneously trying to learn about microcontrollers because I want to touch embedded systems in the future. In the intermission between my first and second quarter at UC Irvine, I decided I wanted to implement a feature in Roblox, which would wash away the Roblox's rust so that I am able to fulfill my job well with ease. Beyond, that, I have a great idea for a Roblox game based on my favorite game on Roblox, Empire Clash.


## What is Server Sharding? {#what-is-server-sharding}

As a distributed server architecture, server sharding is splitting one logical game world across multiple server processes so more players can participate. The implementation of server sharding as part of my project is spatial sharding or map partitioning, which is prevalent in games such Foxhole, EVE Online sectors... Each server region is divided into grids. Each zone runs on its own server while players move between zones seemlessly. The inclusion of the term 'Non-Layered' means to say that individual grid is one server that force many players of that grid to share the same state: to be simple and concise there will be just one trunk (the server region) and concurrent branches (grids).
![](/ox-hugo/foxhole-region-example.png)
Note that even though Foxhole's has designated region zones, they are not instanced. State is shared across one grid. State is saved in a database solution.


### Let's Clarify Our Terms, Borrowing Foxhole's {#let-s-clarify-our-terms-borrowing-foxhole-s}

-   We'll designate a collection of server regions as "World"
-   Each grid is one instanced server.

&rarr; Every word has grids.


## What Kind of Game Can You Make on Roblox with Grid-Based Server Sharding? {#what-kind-of-game-can-you-make-on-roblox-with-grid-based-server-sharding}

Imagine a procedurally generated game based on rules and assets made by the developer. The players are allowed more freedom but at the same time they can feel their worlds linked together. Their collective actions have consequences on the collective victory. This is game where players can build facilities in order to achieve their collective objective, and with things to build that means resource management, and implementation of economy or system of labor and resources.

My original idea for a game that utilizes region server sharding is derived from Roblox Empire Clash, a game about 4 Monarchic-Napoleonic factions competing for domination, holding the majority of territories. Grid-Based server sharding is perfect for games like this. Domination points can be simply regions with some mechanics to determine domination. Most Roblox games like Empire clash in their mid-to-late stage relies on new-content updates to change the user's environment (aka. new maps) sacrificing on important game features that will actually drastically change their game like changes to logistics &rarr; as complex of a Roblox game as Empire Clash is, it has more "quantity" than "quality"; the developers can add so much more e.g. merchants can only take part in backline logistics and not midline or frontline because they only have one stall. Empire clash's major update on December 12th reveals the introduction of the calvary class, change to the core mechanics and the overall flow of the game, which is great, doubling the game's player count in the week of release.

{{< figure src="/ox-hugo/northwall-release.png" >}}

Notwithstanding, instead of adding a new map and only then implement the core mechanics change, make the core mechanics change good so that it contributes to the player's environment and hence dictating the player's behavior, not the other way around. The environment does not dictate the player's behavior as strongly as the core mechanics while implementing new environments take much more resources and time. CFrontInteractive (Empire clash's development studio) is doing a good job given budget and time constraint but the game's core mechanics is still not refined because of the attention on the new map. Anyways, the main point is to consider procedurally generated environment given resource constraint and to focus on core mechanics instead. Providing a dynamic environment for players can be achieved through server sharding + procedural generation like that of FoxHole's exemplary model.


## Technical Implementation {#technical-implementation}

That was all talk, let's get to doing.


### Roblox API {#roblox-api}

First, let us see what the Roblox Engine offers. Because we are going to be using multiple servers, [TeleportService](https://create.roblox.com/docs/reference/engine/classes/TeleportService) has to be used. Furthermore, the nature of Roblox servers do not allow us to keep a server running for more than a week. Therefore, state must be preserved. To do that, we have to use [DataStoreService](https://create.roblox.com/docs/reference/engine/classes/DataStoreService). Persistent state has to store the grid position of the server, as well as storing the server's state later down the line (e.g. objects/landmarks placed down by players later).


### Basic World and Grids Model {#basic-world-and-grids-model}

This model assumes that the grids share the same place / code, only differeing in procedural generation and data saved. Physically, of course the World does not exist in the game, it is merely a conceptual classifier for a collection of regions with necessary properties stored. As for the regions they will have several properties needed to be stored in the data store.

{{< figure src="/ox-hugo/architecturev1.png" >}}

Note that each region have to be soft-capped, which means that if the server cap is 100, the region should be capped to 85 so that routers are not hard stopped by Roblox constraints.


#### Terms {#terms}

<!--list-separator-->

-  Keys

    PK means Primary Key, FK means Foreign Key.

<!--list-separator-->

-  Server Status indications:

    1.  active &rarr; safe to route player here
    2.  full &rarr; don't route new players
    3.  draining &rarr; server is preparing to shut down / migrate. allow exits, avoid new joins.
    4.  idle &rarr; data exists but no server running &rarr; needs to start new one when a player walk to grid.


### Region Spawning {#region-spawning}

What if two players approach a new region grid? What if they create two different places? This is a classic race condition issue.

This entry is still in progress. Come back later!
