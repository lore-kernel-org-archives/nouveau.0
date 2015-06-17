From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Wed, 17 Jun 2015 15:40:27 +0000
Message-ID: <bug-90887-8800-UtOanlh9va@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1399008186=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1399008186==
Content-Type: multipart/alternative; boundary="1434555626.50Fd21.26884"; charset="UTF-8"


--1434555626.50Fd21.26884
Date: Wed, 17 Jun 2015 15:40:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so... as I suspected, the phi nodes are actually fine. I added this to the
nv50 printer:

   for (Graph::EdgeIterator ei = bb->cfg.incident(); !ei.end(); ei.next())
      INFO(" <- BB:%i (%s)\n",
           BasicBlock::get(ei.getNode())->getId(),
           ei.getEdge()->typeStr());

Which makes it much easier to look at things. So right before RA we have:

 15: texlod 2D $r0 $s0 f32 { %r52 %r53 %r54 } %r45 %r47 %r49 (0)
BB:5 (7 instructions) - idom = BB:4, df = { }
 <- BB:4 (tree)
 -> BB:3 (forward)
 -> BB:2 (tree)
 16: join (0)
 17: mov u32 %r61 0x3ffb4a23 (0)
 18: mad f32 %r62 %r53 %r61 %r52 (0)
 19: mov u32 %r64 0x3f600000 (0)
 20: joinat BB:3 (0)
 21: set u8 %c68 lt f32 %r62 %r64 (0)
 22: eq %c68 bra BB:3 (0)
...
BB:9 (1 instructions) - idom = BB:2, df = { BB:3 }
 <- BB:13 (forward)
 <- BB:12 (forward)
 <- BB:11 (forward)
 <- BB:2 (forward)
 -> BB:10 (tree)
 32: texlod 2D $r0 $s0 f32 { %r76 %r77 %r78 } %r73 %r73 %r73 (0)
BB:10 (2 instructions) - idom = BB:9, df = { BB:3 }
 <- BB:9 (tree)
 -> BB:3 (forward)
 33: join ind BB:0 (0)
 34: bra BB:3 (0)
BB:3 (5 instructions) - idom = BB:5, df = { }
 <- BB:10 (forward)
 <- BB:5 (forward)
 -> BB:1 (tree)
 35: phi u32 %r88 %r78 %r52 (0)
 36: phi u32 %r89 %r77 %r53 (0)
 37: phi u32 %r90 %r76 %r54 (0)
 38: join (0)

Which is perfectly correct. Although it *is* a bit odd that BB:3 doesn't have
any incoming TREE edges. Definitely a bit worrying. But let's hope that the
thing doesn't ACTUALLY care about that, and that TREE is merely an optimization
and it'd be just as happy with s/tree/forward everywhere.

And then after the various RA passes run:

 20: texlod 2D $r0 $s0 f32 %r107t %r108t (0)
 21: split b96 { %r52 %r53 %r54 } %r107t (0)
 22: bra BB:5 (0)
BB:5 (7 instructions) - idom = BB:4, df = { }
 <- BB:4 (tree)
 -> BB:17 (tree)
 -> BB:2 (tree)
 23: join ind BB:0 (0)
 24: mov u32 %r61 0x3ffb4a23 (0)
 25: mad f32 %r62 %r53 %r61 %r52 (0)
 26: mov u32 %r64 0x3f600000 (0)
 27: joinat BB:3 (0)
 28: set u8 %c68 lt f32 %r62 %r64 (0)
 29: eq %c68 bra BB:17 (0)
...
BB:9 (7 instructions) - idom = BB:2, df = { BB:3 }
 <- BB:20 (forward)
 <- BB:19 (forward)
 <- BB:18 (forward)
 <- BB:13 (forward)
 -> BB:10 (tree)
 42: mov u32 %r112 %r73 (0)
 43: mov u32 %r113 %r73 (0)
 44: mov u32 %r114 %r73 (0)
 45: merge b96 %r110t %r112 %r113 %r114 (0)
 46: texlod 2D $r0 $s0 f32 %r109t %r110t (0)
 47: split b96 { %r76 %r77 %r78 } %r109t (0)
 48: bra BB:10 (0)
BB:10 (5 instructions) - idom = BB:9, df = { BB:3 }
 <- BB:9 (tree)
 -> BB:3 (forward)
 49: join ind BB:0 (0)
 50: mov u32 %r118 %r52 (0)
 51: mov u32 %r119 %r53 (0)
 52: mov u32 %r120 %r54 (0)
 53: bra BB:3 (0)
BB:17 (4 instructions) - df = { }
 <- BB:5 (tree)
 -> BB:3 (forward)
 54: mov u32 %r115 %r78 (0)
 55: mov u32 %r116 %r77 (0)
 56: mov u32 %r117 %r76 (0)
 57: bra BB:3 (0)
BB:3 (6 instructions) - idom = BB:5, df = { }
 <- BB:17 (forward)
 <- BB:10 (forward)
 -> BB:1 (tree)
 58: phi u32 %r88 %r115 %r118 (0)
 59: phi u32 %r89 %r116 %r119 (0)
 60: phi u32 %r90 %r117 %r120 (0)
 61: join (0)

So..... the phi nodes are fine :) %r115 does indeed come from BB:17. HOWEVER!
Note that the BB10/BB17 stuff is reversed! %r78 comes from BB:9, but the
incident edge into BB:17 is BB:5. Same for BB:10. So the issue is somewhere in
there.

Perhaps that's what you were saying all along and I was too dense to understand
it? It picks the wrong mov source because the incident edge order is different
now?

[As an aside, this whole quadop thing is *soooo* unnecessary. It's only needed
for non-uniform lod/bias values, and in this case, they're clearly uniform.
However this uniformity check is done pre-ssa, since doing the bb splitting
post-ssa would be a huge pain. Ugh!]

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434555626.50Fd21.26884
Date: Wed, 17 Jun 2015 15:40:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so... as I suspected, the phi nodes are actually fine. I added this to the
nv50 printer:

   for (Graph::EdgeIterator ei = bb-&gt;cfg.incident(); !ei.end(); ei.next())
      INFO(&quot; &lt;- BB:%i (%s)\n&quot;,
           BasicBlock::get(ei.getNode())-&gt;getId(),
           ei.getEdge()-&gt;typeStr());

Which makes it much easier to look at things. So right before RA we have:

 15: texlod 2D $r0 $s0 f32 { %r52 %r53 %r54 } %r45 %r47 %r49 (0)
BB:5 (7 instructions) - idom = BB:4, df = { }
 &lt;- BB:4 (tree)
 -&gt; BB:3 (forward)
 -&gt; BB:2 (tree)
 16: join (0)
 17: mov u32 %r61 0x3ffb4a23 (0)
 18: mad f32 %r62 %r53 %r61 %r52 (0)
 19: mov u32 %r64 0x3f600000 (0)
 20: joinat BB:3 (0)
 21: set u8 %c68 lt f32 %r62 %r64 (0)
 22: eq %c68 bra BB:3 (0)
...
BB:9 (1 instructions) - idom = BB:2, df = { BB:3 }
 &lt;- BB:13 (forward)
 &lt;- BB:12 (forward)
 &lt;- BB:11 (forward)
 &lt;- BB:2 (forward)
 -&gt; BB:10 (tree)
 32: texlod 2D $r0 $s0 f32 { %r76 %r77 %r78 } %r73 %r73 %r73 (0)
BB:10 (2 instructions) - idom = BB:9, df = { BB:3 }
 &lt;- BB:9 (tree)
 -&gt; BB:3 (forward)
 33: join ind BB:0 (0)
 34: bra BB:3 (0)
BB:3 (5 instructions) - idom = BB:5, df = { }
 &lt;- BB:10 (forward)
 &lt;- BB:5 (forward)
 -&gt; BB:1 (tree)
 35: phi u32 %r88 %r78 %r52 (0)
 36: phi u32 %r89 %r77 %r53 (0)
 37: phi u32 %r90 %r76 %r54 (0)
 38: join (0)

Which is perfectly correct. Although it *is* a bit odd that BB:3 doesn't have
any incoming TREE edges. Definitely a bit worrying. But let's hope that the
thing doesn't ACTUALLY care about that, and that TREE is merely an optimization
and it'd be just as happy with s/tree/forward everywhere.

And then after the various RA passes run:

 20: texlod 2D $r0 $s0 f32 %r107t %r108t (0)
 21: split b96 { %r52 %r53 %r54 } %r107t (0)
 22: bra BB:5 (0)
BB:5 (7 instructions) - idom = BB:4, df = { }
 &lt;- BB:4 (tree)
 -&gt; BB:17 (tree)
 -&gt; BB:2 (tree)
 23: join ind BB:0 (0)
 24: mov u32 %r61 0x3ffb4a23 (0)
 25: mad f32 %r62 %r53 %r61 %r52 (0)
 26: mov u32 %r64 0x3f600000 (0)
 27: joinat BB:3 (0)
 28: set u8 %c68 lt f32 %r62 %r64 (0)
 29: eq %c68 bra BB:17 (0)
...
BB:9 (7 instructions) - idom = BB:2, df = { BB:3 }
 &lt;- BB:20 (forward)
 &lt;- BB:19 (forward)
 &lt;- BB:18 (forward)
 &lt;- BB:13 (forward)
 -&gt; BB:10 (tree)
 42: mov u32 %r112 %r73 (0)
 43: mov u32 %r113 %r73 (0)
 44: mov u32 %r114 %r73 (0)
 45: merge b96 %r110t %r112 %r113 %r114 (0)
 46: texlod 2D $r0 $s0 f32 %r109t %r110t (0)
 47: split b96 { %r76 %r77 %r78 } %r109t (0)
 48: bra BB:10 (0)
BB:10 (5 instructions) - idom = BB:9, df = { BB:3 }
 &lt;- BB:9 (tree)
 -&gt; BB:3 (forward)
 49: join ind BB:0 (0)
 50: mov u32 %r118 %r52 (0)
 51: mov u32 %r119 %r53 (0)
 52: mov u32 %r120 %r54 (0)
 53: bra BB:3 (0)
BB:17 (4 instructions) - df = { }
 &lt;- BB:5 (tree)
 -&gt; BB:3 (forward)
 54: mov u32 %r115 %r78 (0)
 55: mov u32 %r116 %r77 (0)
 56: mov u32 %r117 %r76 (0)
 57: bra BB:3 (0)
BB:3 (6 instructions) - idom = BB:5, df = { }
 &lt;- BB:17 (forward)
 &lt;- BB:10 (forward)
 -&gt; BB:1 (tree)
 58: phi u32 %r88 %r115 %r118 (0)
 59: phi u32 %r89 %r116 %r119 (0)
 60: phi u32 %r90 %r117 %r120 (0)
 61: join (0)

So..... the phi nodes are fine :) %r115 does indeed come from BB:17. HOWEVER!
Note that the BB10/BB17 stuff is reversed! %r78 comes from BB:9, but the
incident edge into BB:17 is BB:5. Same for BB:10. So the issue is somewhere in
there.

Perhaps that's what you were saying all along and I was too dense to understand
it? It picks the wrong mov source because the incident edge order is different
now?

[As an aside, this whole quadop thing is *soooo* unnecessary. It's only needed
for non-uniform lod/bias values, and in this case, they're clearly uniform.
However this uniformity check is done pre-ssa, since doing the bb splitting
post-ssa would be a huge pain. Ugh!]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434555626.50Fd21.26884--

--===============1399008186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1399008186==--
