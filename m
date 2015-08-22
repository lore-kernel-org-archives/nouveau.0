From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sat, 22 Aug 2015 20:15:06 +0000
Message-ID: <bug-90887-8800-2SG7yfZb7q@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0372568154=="
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


--===============0372568154==
Content-Type: multipart/alternative; boundary="1440274506.4f63d2E3.13329"; charset="UTF-8"


--1440274506.4f63d2E3.13329
Date: Sat, 22 Aug 2015 20:15:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #37 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to jr from comment #36)
> Created attachment 117865 [details] [review]
> Edge type fix for prototype patch
> 
> With this patch on top of the prototype patch edge splitting during
> PhiMovesPass should no longer change non forward edges to forward. I think
> with current master this isn't a problem, because the split edge will always
> be a forward edge, but this still isn't a valid assumption.
> 
> After adding the following patch the fs-critical-edge test shows that edge
> splitting now preserves the edge type. This patch should also solve the 'all
> incoming edges are forward edges' problem that may be the cause of the
> missing blocks.
> 
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index f153674..753bcbf 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -2838,7 +2838,7 @@ Converter::handleInstruction(const struct
> tgsi_full_instruction *insn)
>        }
> 
>        if (prevBB->getExit()->op == OP_BRA) {
> -         prevBB->cfg.attach(&convBB->cfg, Graph::Edge::FORWARD);
> +         prevBB->cfg.attach(&convBB->cfg, Graph::Edge::TREE);
>           prevBB->getExit()->asFlow()->target.bb = convBB;
>        }
>        setPosition(convBB, true);

Actually the edge types are much much more wrong, unfortunately. I don't know
how much it matters. For example in an if/else situation, i.e.

    *
   / \
  /   \
 *     *
  \   /
   \ /
    *

You should end up with 3 TREE edges and 1 CROSS edge. However nouveau happily
makes both of the "bottom" edges FORWARD. I guess you fix one of them to be
TREE, but the other is still going to be FORWARD instead of CROSS.

I think this is too big of a problem to fix in a fixup, esp since we don't
really know what these are used for.

I'm thinking the following:

(a) Push my fixup patch with the hash map, cc'd to stable. It's a little
inefficient, but it *works*, and is (in my mind) quite simple. I'll
double-check that it doesn't affect perf too much.
(b) Figure out this edge type insanity, including fixing things up, and maybe
adding a validator that makes sure that the edge types are correct.
(c) Revert my fixup, and implement actual edge splitting, (i.e. what you did)
and based on critical edges rather than the current logic.
(d) Lots and lots of testing.

Does that sound reasonable? One of the considerations here is that neither you
nor I have a *ton* of time to play around with this, and Mesa 11.0.0 will be
released in mid-September, and I'd like to have *some* fix for nv50 in there.

As for your patch, the edge is preserved in all cases except forward, which
becomes cross. (draw it out, should make sense, unless I messed up)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440274506.4f63d2E3.13329
Date: Sat, 22 Aug 2015 20:15:06 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to jr from <a href="show_bug.cgi?id=90887#c36">comment #36</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=117865" name="attach_117865" title="Edge type fix for prototype patch">attachment 117865</a> <a href="attachment.cgi?id=117865&amp;action=edit" title="Edge type fix for prototype patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90887&amp;attachment=117865'>[review]</a> [review]
&gt; Edge type fix for prototype patch
&gt; 
&gt; With this patch on top of the prototype patch edge splitting during
&gt; PhiMovesPass should no longer change non forward edges to forward. I think
&gt; with current master this isn't a problem, because the split edge will always
&gt; be a forward edge, but this still isn't a valid assumption.
&gt; 
&gt; After adding the following patch the fs-critical-edge test shows that edge
&gt; splitting now preserves the edge type. This patch should also solve the 'all
&gt; incoming edges are forward edges' problem that may be the cause of the
&gt; missing blocks.
&gt; 
&gt; diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
&gt; b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
&gt; index f153674..753bcbf 100644
&gt; --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
&gt; +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
&gt; &#64;&#64; -2838,7 +2838,7 &#64;&#64; Converter::handleInstruction(const struct
&gt; tgsi_full_instruction *insn)
&gt;        }
&gt; 
&gt;        if (prevBB-&gt;getExit()-&gt;op == OP_BRA) {
&gt; -         prevBB-&gt;cfg.attach(&amp;convBB-&gt;cfg, Graph::Edge::FORWARD);
&gt; +         prevBB-&gt;cfg.attach(&amp;convBB-&gt;cfg, Graph::Edge::TREE);
&gt;           prevBB-&gt;getExit()-&gt;asFlow()-&gt;target.bb = convBB;
&gt;        }
&gt;        setPosition(convBB, true);</span >

Actually the edge types are much much more wrong, unfortunately. I don't know
how much it matters. For example in an if/else situation, i.e.

    *
   / \
  /   \
 *     *
  \   /
   \ /
    *

You should end up with 3 TREE edges and 1 CROSS edge. However nouveau happily
makes both of the &quot;bottom&quot; edges FORWARD. I guess you fix one of them to be
TREE, but the other is still going to be FORWARD instead of CROSS.

I think this is too big of a problem to fix in a fixup, esp since we don't
really know what these are used for.

I'm thinking the following:

(a) Push my fixup patch with the hash map, cc'd to stable. It's a little
inefficient, but it *works*, and is (in my mind) quite simple. I'll
double-check that it doesn't affect perf too much.
(b) Figure out this edge type insanity, including fixing things up, and maybe
adding a validator that makes sure that the edge types are correct.
(c) Revert my fixup, and implement actual edge splitting, (i.e. what you did)
and based on critical edges rather than the current logic.
(d) Lots and lots of testing.

Does that sound reasonable? One of the considerations here is that neither you
nor I have a *ton* of time to play around with this, and Mesa 11.0.0 will be
released in mid-September, and I'd like to have *some* fix for nv50 in there.

As for your patch, the edge is preserved in all cases except forward, which
becomes cross. (draw it out, should make sense, unless I messed up)</pre>
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

--1440274506.4f63d2E3.13329--

--===============0372568154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0372568154==--
