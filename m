From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sat, 22 Aug 2015 15:08:00 +0000
Message-ID: <bug-90887-8800-M0psKxwHk2@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741494284=="
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


--===============1741494284==
Content-Type: multipart/alternative; boundary="1440256080.E1c8cEa2.15895"; charset="UTF-8"


--1440256080.E1c8cEa2.15895
Date: Sat, 22 Aug 2015 15:08:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #36 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
Created attachment 117865
  --> https://bugs.freedesktop.org/attachment.cgi?id=117865&action=edit
Edge type fix for prototype patch

With this patch on top of the prototype patch edge splitting during
PhiMovesPass should no longer change non forward edges to forward. I think with
current master this isn't a problem, because the split edge will always be a
forward edge, but this still isn't a valid assumption.

After adding the following patch the fs-critical-edge test shows that edge
splitting now preserves the edge type. This patch should also solve the 'all
incoming edges are forward edges' problem that may be the cause of the missing
blocks.

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index f153674..753bcbf 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -2838,7 +2838,7 @@ Converter::handleInstruction(const struct
tgsi_full_instruction *insn)
       }

       if (prevBB->getExit()->op == OP_BRA) {
-         prevBB->cfg.attach(&convBB->cfg, Graph::Edge::FORWARD);
+         prevBB->cfg.attach(&convBB->cfg, Graph::Edge::TREE);
          prevBB->getExit()->asFlow()->target.bb = convBB;
       }
       setPosition(convBB, true);

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440256080.E1c8cEa2.15895
Date: Sat, 22 Aug 2015 15:08:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117865" name="attach_117865" title="Edge type fix for prototype patch">attachment 117865</a> <a href="attachment.cgi?id=117865&amp;action=edit" title="Edge type fix for prototype patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90887&amp;attachment=117865'>[review]</a>
Edge type fix for prototype patch

With this patch on top of the prototype patch edge splitting during
PhiMovesPass should no longer change non forward edges to forward. I think with
current master this isn't a problem, because the split edge will always be a
forward edge, but this still isn't a valid assumption.

After adding the following patch the fs-critical-edge test shows that edge
splitting now preserves the edge type. This patch should also solve the 'all
incoming edges are forward edges' problem that may be the cause of the missing
blocks.

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index f153674..753bcbf 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
&#64;&#64; -2838,7 +2838,7 &#64;&#64; Converter::handleInstruction(const struct
tgsi_full_instruction *insn)
       }

       if (prevBB-&gt;getExit()-&gt;op == OP_BRA) {
-         prevBB-&gt;cfg.attach(&amp;convBB-&gt;cfg, Graph::Edge::FORWARD);
+         prevBB-&gt;cfg.attach(&amp;convBB-&gt;cfg, Graph::Edge::TREE);
          prevBB-&gt;getExit()-&gt;asFlow()-&gt;target.bb = convBB;
       }
       setPosition(convBB, true);</pre>
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

--1440256080.E1c8cEa2.15895--

--===============1741494284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1741494284==--
