From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Thu, 20 Aug 2015 18:35:02 +0000
Message-ID: <bug-90887-8800-paq3DQBUKu@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0873602037=="
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


--===============0873602037==
Content-Type: multipart/alternative; boundary="1440095702.0bb60e3.2973"; charset="UTF-8"


--1440095702.0bb60e3.2973
Date: Thu, 20 Aug 2015 18:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #22 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to jr from comment #21)
> Created attachment 117077 [details] [review]
> Prototype of a more highlevel graph modification api
> 
> After I realized that the prev/next arrays actually represent *two* linked
> lists (one for the source and one for the target side) and that these are
> circular it became easier:-)
> 
> I have attached a prototype of what I was hinting at in my first post. This
> is only lightly tested (but seems to work for Lifeless Planet at least) and
> I'm not sure that Pass is the correct place for the new method to live. It
> would probably also be nice if edge splitting kept both the outgoing and the
> incoming list of source and target resp. intact.
> 
> One improvement of this patch above my original proposal is that it produces
> the same edge types as the current code. My earlier patch would keep the
> edge type instead of setting it to FORWARD. While fixing that I was
> wondering whether TREE is always correct for the edge into the new BB.

Hrm, I was about to (try to) push this out, but it doesn't seem to work. I made
a few local adjustments, like

RegAlloc::PhiMovesPass::isCriticalEdge(BasicBlock *b, BasicBlock *p)
{
   return b->cfg.incidentCount() > 1 && p->cfg.outgoingCount() > 1;
}

instead of that needNewElseBlock thing, which seems like it's potentially wrong
or at least I don't understand wtf it's counting. And more generally the logic
is that you should avoid critical edges because it's unclear where to put the
computation. Anyways, this makes it easy to trigger the code for me without
TXL, and I get this before the RA passes:

MAIN:-1 ()
BB:0 (6 instructions) - df = { }
 -> BB:5 (tree)
 -> BB:2 (tree)
  0: ld u64 { %r32 %r34 } c0[0x10] (0)
  1: ld u64 { %r36 %r38 } c0[0x18] (0)
  2: mov u32 %r41 0x00000001 (0)
  3: joinat BB:6 (0)
  4: set u8 %p43 ne u32 %r41 c0[0x0] (0)
  5: not %p43 bra BB:5 (0)
BB:2 (4 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:4 (forward)
 -> BB:3 (tree)
  6: mov u32 %r45 0x00000002 (0)
  7: joinat BB:4 (0)
  8: set u8 %p47 eq u32 %r45 c0[0x0] (0)
  9: not %p47 bra BB:4 (0)
BB:3 (2 instructions) - idom = BB:2, df = { BB:4 }
 -> BB:4 (forward)
 10: ld u64 { %r48 %r50 } c0[0x20] (0)
 11: bra BB:4 (0)
BB:4 (4 instructions) - idom = BB:2, df = { BB:6 }
 -> BB:6 (forward)
 12: phi u32 %r52 %r32 %r48 (0)
 13: phi u32 %r53 %r34 %r50 (0)
 14: join (0)
 15: bra BB:6 (0)
BB:5 (3 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:6 (forward)
 16: ld u64 { %r66 %r68 } c0[0x20] (0)
 17: ld u64 { %r70 %r72 } c0[0x28] (0)
 18: bra BB:6 (0)
BB:6 (5 instructions) - idom = BB:0, df = { }
 -> BB:1 (tree)
 19: phi u32 %r54 %r52 %r66 (0)
 20: phi u32 %r55 %r53 %r68 (0)
 21: phi u32 %r56 %r36 %r70 (0)
 22: phi u32 %r57 %r38 %r72 (0)
 23: join (0)
BB:1 (5 instructions) - idom = BB:6, df = { }
 24: mov (SUBOP:1) f32 $r0 %r54 (0)
 25: mov (SUBOP:1) f32 $r1 %r55 (0)
 26: mov (SUBOP:1) f32 $r2 %r56 (0)
 27: mov (SUBOP:1) f32 $r3 %r57 (0)
 28: exit - # (0)


and then this after the RA passes:

MAIN:-1 ()
BB:0 (8 instructions) - df = { }
 -> BB:5 (tree)
 -> BB:2 (tree)
  0: ld u64 %r74d c0[0x10] (0)
  1: split u64 { %r32 %r34 } %r74d (0)
  2: ld u64 %r75d c0[0x18] (0)
  3: split u64 { %r36 %r38 } %r75d (0)
  4: mov u32 %r41 0x00000001 (0)
  5: joinat BB:6 (0)
  6: set u8 %p43 ne u32 %r41 c0[0x0] (0)
  7: not %p43 bra BB:5 (0)
BB:2 (4 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:7 (tree)
 -> BB:3 (tree)
  8: mov u32 %r45 0x00000002 (0)
  9: joinat BB:4 (0)
 10: set u8 %p47 eq u32 %r45 c0[0x0] (0)
 11: not %p47 bra BB:7 (0)
BB:3 (5 instructions) - idom = BB:2, df = { BB:4 }
 -> BB:4 (forward)
 12: ld u64 %r76d c0[0x20] (0)
 13: split u64 { %r48 %r50 } %r76d (0)
 14: mov u32 %r89 %r48 (0)
 15: mov u32 %r90 %r50 (0)
 16: bra BB:4 (0)
BB:7 (3 instructions) - df = { }
 -> BB:4 (cross)
 17: mov u32 %r87 %r32 (0)
 18: mov u32 %r88 %r34 (0)
 19: bra BB:4 (0)
BB:5 (9 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:6 (forward)
 20: ld u64 %r77d c0[0x20] (0)
 21: split u64 { %r66 %r68 } %r77d (0)
 22: ld u64 %r78d c0[0x28] (0)
 23: split u64 { %r70 %r72 } %r78d (0)
 24: mov u32 %r83 %r66 (0)
 25: mov u32 %r84 %r68 (0)
 26: mov u32 %r85 %r70 (0)
 27: mov u32 %r86 %r72 (0)
 28: bra BB:6 (0)

where did BB:4 go? poof. not great :( this is with piglit's
tests/shaders/ssa/fs-critical-edge.shader_test

I guess I'll go with either your or my first patches. Want to get this fixed
for Mesa 11, which is going to get branched off some time tomorrow.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440095702.0bb60e3.2973
Date: Thu, 20 Aug 2015 18:35:02 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to jr from <a href="show_bug.cgi?id=90887#c21">comment #21</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=117077" name="attach_117077" title="Prototype of a more highlevel graph modification api">attachment 117077</a> <a href="attachment.cgi?id=117077&amp;action=edit" title="Prototype of a more highlevel graph modification api">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90887&amp;attachment=117077'>[review]</a> [review]
&gt; Prototype of a more highlevel graph modification api
&gt; 
&gt; After I realized that the prev/next arrays actually represent *two* linked
&gt; lists (one for the source and one for the target side) and that these are
&gt; circular it became easier:-)
&gt; 
&gt; I have attached a prototype of what I was hinting at in my first post. This
&gt; is only lightly tested (but seems to work for Lifeless Planet at least) and
&gt; I'm not sure that Pass is the correct place for the new method to live. It
&gt; would probably also be nice if edge splitting kept both the outgoing and the
&gt; incoming list of source and target resp. intact.
&gt; 
&gt; One improvement of this patch above my original proposal is that it produces
&gt; the same edge types as the current code. My earlier patch would keep the
&gt; edge type instead of setting it to FORWARD. While fixing that I was
&gt; wondering whether TREE is always correct for the edge into the new BB.</span >

Hrm, I was about to (try to) push this out, but it doesn't seem to work. I made
a few local adjustments, like

RegAlloc::PhiMovesPass::isCriticalEdge(BasicBlock *b, BasicBlock *p)
{
   return b-&gt;cfg.incidentCount() &gt; 1 &amp;&amp; p-&gt;cfg.outgoingCount() &gt; 1;
}

instead of that needNewElseBlock thing, which seems like it's potentially wrong
or at least I don't understand wtf it's counting. And more generally the logic
is that you should avoid critical edges because it's unclear where to put the
computation. Anyways, this makes it easy to trigger the code for me without
TXL, and I get this before the RA passes:

MAIN:-1 ()
BB:0 (6 instructions) - df = { }
 -&gt; BB:5 (tree)
 -&gt; BB:2 (tree)
  0: ld u64 { %r32 %r34 } c0[0x10] (0)
  1: ld u64 { %r36 %r38 } c0[0x18] (0)
  2: mov u32 %r41 0x00000001 (0)
  3: joinat BB:6 (0)
  4: set u8 %p43 ne u32 %r41 c0[0x0] (0)
  5: not %p43 bra BB:5 (0)
BB:2 (4 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:4 (forward)
 -&gt; BB:3 (tree)
  6: mov u32 %r45 0x00000002 (0)
  7: joinat BB:4 (0)
  8: set u8 %p47 eq u32 %r45 c0[0x0] (0)
  9: not %p47 bra BB:4 (0)
BB:3 (2 instructions) - idom = BB:2, df = { BB:4 }
 -&gt; BB:4 (forward)
 10: ld u64 { %r48 %r50 } c0[0x20] (0)
 11: bra BB:4 (0)
BB:4 (4 instructions) - idom = BB:2, df = { BB:6 }
 -&gt; BB:6 (forward)
 12: phi u32 %r52 %r32 %r48 (0)
 13: phi u32 %r53 %r34 %r50 (0)
 14: join (0)
 15: bra BB:6 (0)
BB:5 (3 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:6 (forward)
 16: ld u64 { %r66 %r68 } c0[0x20] (0)
 17: ld u64 { %r70 %r72 } c0[0x28] (0)
 18: bra BB:6 (0)
BB:6 (5 instructions) - idom = BB:0, df = { }
 -&gt; BB:1 (tree)
 19: phi u32 %r54 %r52 %r66 (0)
 20: phi u32 %r55 %r53 %r68 (0)
 21: phi u32 %r56 %r36 %r70 (0)
 22: phi u32 %r57 %r38 %r72 (0)
 23: join (0)
BB:1 (5 instructions) - idom = BB:6, df = { }
 24: mov (SUBOP:1) f32 $r0 %r54 (0)
 25: mov (SUBOP:1) f32 $r1 %r55 (0)
 26: mov (SUBOP:1) f32 $r2 %r56 (0)
 27: mov (SUBOP:1) f32 $r3 %r57 (0)
 28: exit - # (0)


and then this after the RA passes:

MAIN:-1 ()
BB:0 (8 instructions) - df = { }
 -&gt; BB:5 (tree)
 -&gt; BB:2 (tree)
  0: ld u64 %r74d c0[0x10] (0)
  1: split u64 { %r32 %r34 } %r74d (0)
  2: ld u64 %r75d c0[0x18] (0)
  3: split u64 { %r36 %r38 } %r75d (0)
  4: mov u32 %r41 0x00000001 (0)
  5: joinat BB:6 (0)
  6: set u8 %p43 ne u32 %r41 c0[0x0] (0)
  7: not %p43 bra BB:5 (0)
BB:2 (4 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:7 (tree)
 -&gt; BB:3 (tree)
  8: mov u32 %r45 0x00000002 (0)
  9: joinat BB:4 (0)
 10: set u8 %p47 eq u32 %r45 c0[0x0] (0)
 11: not %p47 bra BB:7 (0)
BB:3 (5 instructions) - idom = BB:2, df = { BB:4 }
 -&gt; BB:4 (forward)
 12: ld u64 %r76d c0[0x20] (0)
 13: split u64 { %r48 %r50 } %r76d (0)
 14: mov u32 %r89 %r48 (0)
 15: mov u32 %r90 %r50 (0)
 16: bra BB:4 (0)
BB:7 (3 instructions) - df = { }
 -&gt; BB:4 (cross)
 17: mov u32 %r87 %r32 (0)
 18: mov u32 %r88 %r34 (0)
 19: bra BB:4 (0)
BB:5 (9 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:6 (forward)
 20: ld u64 %r77d c0[0x20] (0)
 21: split u64 { %r66 %r68 } %r77d (0)
 22: ld u64 %r78d c0[0x28] (0)
 23: split u64 { %r70 %r72 } %r78d (0)
 24: mov u32 %r83 %r66 (0)
 25: mov u32 %r84 %r68 (0)
 26: mov u32 %r85 %r70 (0)
 27: mov u32 %r86 %r72 (0)
 28: bra BB:6 (0)

where did BB:4 go? poof. not great :( this is with piglit's
tests/shaders/ssa/fs-critical-edge.shader_test

I guess I'll go with either your or my first patches. Want to get this fixed
for Mesa 11, which is going to get branched off some time tomorrow.</pre>
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

--1440095702.0bb60e3.2973--

--===============0873602037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0873602037==--
