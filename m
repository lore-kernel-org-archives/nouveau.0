From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91124] Civilization V (in Wine) has rendering
 issues: text missing, menu bar corrupted
Date: Wed, 01 Jul 2015 06:10:00 +0000
Message-ID: <bug-91124-8800-3XxqnHc0fM@http.bugs.freedesktop.org/>
References: <bug-91124-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2133936466=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91124-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2133936466==
Content-Type: multipart/alternative; boundary="1435731000.Bb1c1.31380"; charset="UTF-8"


--1435731000.Bb1c1.31380
Date: Wed, 1 Jul 2015 06:10:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91124

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I believe the following patch resolves the issue:

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
index 51b9225..fa8ee07 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
@@ -332,6 +332,9 @@ BasicBlock::splitBefore(Instruction *insn, bool attach)
    BasicBlock *bb = new BasicBlock(func);
    assert(!insn || insn->op != OP_PHI);

+   bb->joinAt = joinAt;
+   joinAt = NULL;
+
    splitCommon(insn, bb, attach);
    return bb;
 }

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435731000.Bb1c1.31380
Date: Wed, 1 Jul 2015 06:10:00 +0000
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
   title="NEW - Civilization V (in Wine) has rendering issues: text missing, menu bar corrupted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91124#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Civilization V (in Wine) has rendering issues: text missing, menu bar corrupted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91124">bug 91124</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I believe the following patch resolves the issue:

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
index 51b9225..fa8ee07 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
&#64;&#64; -332,6 +332,9 &#64;&#64; BasicBlock::splitBefore(Instruction *insn, bool attach)
    BasicBlock *bb = new BasicBlock(func);
    assert(!insn || insn-&gt;op != OP_PHI);

+   bb-&gt;joinAt = joinAt;
+   joinAt = NULL;
+
    splitCommon(insn, bb, attach);
    return bb;
 }</pre>
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

--1435731000.Bb1c1.31380--

--===============2133936466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2133936466==--
