From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sun, 28 Jun 2015 06:17:58 +0000
Message-ID: <bug-90887-8800-oaNAxwKWzx@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0375236360=="
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


--===============0375236360==
Content-Type: multipart/alternative; boundary="1435472277.225BfD0F1.21193"; charset="UTF-8"


--1435472277.225BfD0F1.21193
Date: Sun, 28 Jun 2015 06:17:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so among other changes, commit e43a3a66 had the following diff:

@@ -312,23 +337,26 @@ RegAlloc::PhiMovesPass::visit(BasicBlock *bb)
    Instruction *phi, *mov;
    BasicBlock *pb, *pn;

+   std::stack<BasicBlock *> stack;
+
    for (Graph::EdgeIterator ei = bb->cfg.incident(); !ei.end(); ei.next()) {
-      pb = pn = BasicBlock::get(ei.getNode());
+      pb = BasicBlock::get(ei.getNode());
       assert(pb);
-
-      if (needNewElseBlock(bb, pb)) {
-         pn = new BasicBlock(func);
-
-         // deletes an edge, iterator is invalid after this:
-         pb->cfg.detach(&bb->cfg);
-         pb->cfg.attach(&pn->cfg, Graph::Edge::TREE);
-         pn->cfg.attach(&bb->cfg, Graph::Edge::FORWARD); // XXX: check order !
-
-         assert(pb->getExit()->op != OP_CALL);
-         if (pb->getExit()->asFlow()->target.bb == bb)
-            pb->getExit()->asFlow()->target.bb = pn;
-         break;
-      }
+      if (needNewElseBlock(bb, pb))
+         stack.push(pb);
+   }
+   while (!stack.empty()) {
+      pb = stack.top();
+      pn = new BasicBlock(func);
+      stack.pop();
+
+      pb->cfg.detach(&bb->cfg);
+      pb->cfg.attach(&pn->cfg, Graph::Edge::TREE);
+      pn->cfg.attach(&bb->cfg, Graph::Edge::FORWARD);
+
+      assert(pb->getExit()->op != OP_CALL);
+      if (pb->getExit()->asFlow()->target.bb == bb)
+         pb->getExit()->asFlow()->target.bb = pn;
    }

    // insert MOVs (phi->src(j) should stem from j-th in-BB)

which the patch in attachment 116339 effectively undoes. [Why was that in
there? No idea. But presumably futzing with bb's affects needNewElseBlock's
decisions.] So I'm still tending towards my solution. But I'm not particularly
happy that it has to build up and use that hash table every time even if
nothing's changed.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435472277.225BfD0F1.21193
Date: Sun, 28 Jun 2015 06:17:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so among other changes, commit e43a3a66 had the following diff:

&#64;&#64; -312,23 +337,26 &#64;&#64; RegAlloc::PhiMovesPass::visit(BasicBlock *bb)
    Instruction *phi, *mov;
    BasicBlock *pb, *pn;

+   std::stack&lt;BasicBlock *&gt; stack;
+
    for (Graph::EdgeIterator ei = bb-&gt;cfg.incident(); !ei.end(); ei.next()) {
-      pb = pn = BasicBlock::get(ei.getNode());
+      pb = BasicBlock::get(ei.getNode());
       assert(pb);
-
-      if (needNewElseBlock(bb, pb)) {
-         pn = new BasicBlock(func);
-
-         // deletes an edge, iterator is invalid after this:
-         pb-&gt;cfg.detach(&amp;bb-&gt;cfg);
-         pb-&gt;cfg.attach(&amp;pn-&gt;cfg, Graph::Edge::TREE);
-         pn-&gt;cfg.attach(&amp;bb-&gt;cfg, Graph::Edge::FORWARD); // XXX: check order !
-
-         assert(pb-&gt;getExit()-&gt;op != OP_CALL);
-         if (pb-&gt;getExit()-&gt;asFlow()-&gt;target.bb == bb)
-            pb-&gt;getExit()-&gt;asFlow()-&gt;target.bb = pn;
-         break;
-      }
+      if (needNewElseBlock(bb, pb))
+         stack.push(pb);
+   }
+   while (!stack.empty()) {
+      pb = stack.top();
+      pn = new BasicBlock(func);
+      stack.pop();
+
+      pb-&gt;cfg.detach(&amp;bb-&gt;cfg);
+      pb-&gt;cfg.attach(&amp;pn-&gt;cfg, Graph::Edge::TREE);
+      pn-&gt;cfg.attach(&amp;bb-&gt;cfg, Graph::Edge::FORWARD);
+
+      assert(pb-&gt;getExit()-&gt;op != OP_CALL);
+      if (pb-&gt;getExit()-&gt;asFlow()-&gt;target.bb == bb)
+         pb-&gt;getExit()-&gt;asFlow()-&gt;target.bb = pn;
    }

    // insert MOVs (phi-&gt;src(j) should stem from j-th in-BB)

which the patch in <span class=""><a href="attachment.cgi?id=116339" name="attach_116339" title="Candidate Fix for nv50 PhiMovesPass">attachment 116339</a> <a href="attachment.cgi?id=116339&amp;action=edit" title="Candidate Fix for nv50 PhiMovesPass">[details]</a></span> effectively undoes. [Why was that in
there? No idea. But presumably futzing with bb's affects needNewElseBlock's
decisions.] So I'm still tending towards my solution. But I'm not particularly
happy that it has to build up and use that hash table every time even if
nothing's changed.</pre>
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

--1435472277.225BfD0F1.21193--

--===============0375236360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0375236360==--
