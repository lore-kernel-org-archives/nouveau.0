From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91895] [nve7] Shadow Warrior: black gun & messed up
	colors
Date: Sun, 06 Sep 2015 21:14:58 +0000
Message-ID: <bug-91895-8800-nKUxAtLQds@http.bugs.freedesktop.org/>
References: <bug-91895-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1076232422=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91895-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1076232422==
Content-Type: multipart/alternative; boundary="1441574097.aBF1Da41.16170"; charset="UTF-8"


--1441574097.aBF1Da41.16170
Date: Sun, 6 Sep 2015 21:14:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91895

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This patch should get it going, but I don't think I want to commit it as-is.
This gets me the same overly-lit rendering as r600, so any remaining issues are
in the st. Should probably investigate what the "real" rendering looks like,
neither lighting matches any screenshots of the game I've found online.


diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 0cd21cf..268ea0b 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -2121,8 +2121,10 @@ RegAlloc::InsertConstraintsPass::insertConstraintMoves()

             Instruction *defi = cst->getSrc(s)->defs.front()->getInsn();
             // catch some cases where don't really need MOVs
+/*
             if (cst->getSrc(s)->refCount() == 1 && !defi->constrainedDefs())
                continue;
+*/

             LValue *lval = new_LValue(func, cst->src(s).getFile());
             lval->reg.size = size;

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441574097.aBF1Da41.16170
Date: Sun, 6 Sep 2015 21:14:57 +0000
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
   title="NEW - [nve7] Shadow Warrior: black gun &amp; messed up colors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91895#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nve7] Shadow Warrior: black gun &amp; messed up colors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91895">bug 91895</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This patch should get it going, but I don't think I want to commit it as-is.
This gets me the same overly-lit rendering as r600, so any remaining issues are
in the st. Should probably investigate what the &quot;real&quot; rendering looks like,
neither lighting matches any screenshots of the game I've found online.


diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 0cd21cf..268ea0b 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
&#64;&#64; -2121,8 +2121,10 &#64;&#64; RegAlloc::InsertConstraintsPass::insertConstraintMoves()

             Instruction *defi = cst-&gt;getSrc(s)-&gt;defs.front()-&gt;getInsn();
             // catch some cases where don't really need MOVs
+/*
             if (cst-&gt;getSrc(s)-&gt;refCount() == 1 &amp;&amp; !defi-&gt;constrainedDefs())
                continue;
+*/

             LValue *lval = new_LValue(func, cst-&gt;src(s).getFile());
             lval-&gt;reg.size = size;</pre>
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

--1441574097.aBF1Da41.16170--

--===============1076232422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1076232422==--
