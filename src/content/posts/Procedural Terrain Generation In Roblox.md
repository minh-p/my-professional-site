+++
title = "Procedural Terrain Generation In Roblox"
date = 2025-12-17T18:13:00-08:00
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- [Resources On Terrain Procedural Generation](#resources-on-terrain-procedural-generation)

</div>
<!--endtoc-->

This is a blog post to document my learning and implementation of Procedurally generated terrain into my Roblox game. As well, specifically how I combine it with grid sharding. Right now the post is a commitment to learning stuff.

Procedural terrain generation is a way to implement a dynamic player environment alongside [Grid-based server sharding]({{< relref "Roblox Grid-Based Server Sharding with Instancing" >}}). In this blog, I am going to showcase some of the math behind procedural generation as I also work on my [Roblox Empire](https://www.roblox.com/games/9588998913/Empire-Clash) Clash clone game.


## Resources On Terrain Procedural Generation {#resources-on-terrain-procedural-generation}

Here are some of the resources I've gotten regarding terrain procedural generation, as a break from using AI for anything math related.

-   [Lejynn - How I Learned Procedural Generation](https://www.youtube.com/watch?v=XpG3YqUkCTY)
    This is the first Google search result that appeared. I guess implementation in Roblox is a bit similar to Unity. If anything goes, I have to learn first about Perlin noise and search for some ways to render the patches of terrain.
-   [Perlin Noise](https://en.wikipedia.org/wiki/Perlin_noise) - Wikipedia page. From this page, I know that some vector math is going to be involved. Thankfully, I've been exposed to a preliminary understanding with undergraduate multivariable calculus course I've taken this quarter. There's also something about the smoothtest function.
-   [Smoothstep Function](https://en.wikipedia.org/wiki/Smoothstep) - Wikipedia page. Some understanding of this is needed in order to implement perlin noise.
-   [Roblox Implementation Guide](https://devforum.roblox.com/t/ultimate-perlin-noise-and-how-to-make-procedural-terrain-guide-24231-characters-detailed/3109400) - Roblox developer forum post by LxckyDev.
-   [Sebastian Lague's Procedural Landmass Generation Tutorial](https://www.youtube.com/watch?v=wbpMiKiSKm8&list=PLFt_AvWsXl0eBW2EiBtl_sxmDtSgZBxB3) - Conceptual + Implementation Example in Unity
-   [Procedural Content Generation Wiki](http://pcg.wikidot.com/) - Wiki everything PCG related.

I've decided to take things slower than the last Roblox project because this is much tougher conceptually rather than implementation-wise to grasp than Roblox grid sharding.
