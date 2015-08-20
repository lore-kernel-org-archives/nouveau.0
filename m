From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Thu, 20 Aug 2015 22:16:24 +0000
Message-ID: <bug-90887-8800-ZFgUiw5sQm@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1021343463=="
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


--===============1021343463==
Content-Type: multipart/alternative; boundary="1440108984.1daFF2.5951"; charset="UTF-8"


--1440108984.1daFF2.5951
Date: Thu, 20 Aug 2015 22:16:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #25 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #24)
> (In reply to jr from comment #23)
> > (In reply to Ilia Mirkin from comment #22)
> > > (In reply to jr from comment #21)
> > > > Created attachment 117077 [details] [review] [review] [review] [review]
> > > > Prototype of a more highlevel graph modification api
> > > > 
> > > > ...
> > > 
> > > Hrm, I was about to (try to) push this out, but it doesn't seem to work. I
> > > made a few local adjustments, like
> > > 
> > > RegAlloc::PhiMovesPass::isCriticalEdge(BasicBlock *b, BasicBlock *p)
> > > {
> > >    return b->cfg.incidentCount() > 1 && p->cfg.outgoingCount() > 1;
> > > }
> > > 
> > > ...
> > > 
> > > 
> > > where did BB:4 go? poof. not great :( this is with piglit's
> > > tests/shaders/ssa/fs-critical-edge.shader_test
> > > 
> > > I guess I'll go with either your or my first patches. Want to get this fixed
> > > for Mesa 11, which is going to get branched off some time tomorrow.
> > 
> > Sorry, most probably my prototype code is crap. I'll have an hour now to
> > look at it. I'll let you know if I find something. Otherwise I'm fine with
> > your first patch.
> 
> Awesome! While I don't know whether the isCriticalEdge thing is the right
> thing to do instead of the current needNewElseBlock logic, I do think that
> splitEdge should be able to work properly even if needNewElseBlock always
> returns true.

Yes, it should. My usual test cases plus the patch below look fine. My piglit
(from git://anongit.freedesktop.org/piglit) doesn't have a fs-critical-edge
test, though. Where do I find it?

That prototype patch was more of a RFC anyway to show how graph manipulation
could be made less intimidating. If you like the direction I will work some
more on it. But I think it is safe to go with your patch for now.


--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -335,15 +335,7 @@ RegAlloc::BuildIntervalsPass::addLiveRange(Value *val,
 bool
 RegAlloc::PhiMovesPass::needNewElseBlock(BasicBlock *b, BasicBlock *p)
 {
-   if (b->cfg.incidentCount() <= 1)
-      return false;
-
-   int n = 0;
-   for (Graph::EdgeIterator ei = p->cfg.outgoing(); !ei.end(); ei.next())
-      if (ei.getType() == Graph::Edge::TREE ||
-          ei.getType() == Graph::Edge::FORWARD)
-         ++n;
-   return (n == 2);
+   return (b->cfg.incidentCount() > 1) && (p->cfg.outgoingCount() > 1);
 }

 // For each operand of each PHI in b, generate a new value by inserting a MOV

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440108984.1daFF2.5951
Date: Thu, 20 Aug 2015 22:16:24 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c24">comment #24</a>)
<span class="quote">&gt; (In reply to jr from <a href="show_bug.cgi?id=90887#c23">comment #23</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c22">comment #22</a>)
&gt; &gt; &gt; (In reply to jr from <a href="show_bug.cgi?id=90887#c21">comment #21</a>)
&gt; &gt; &gt; &gt; Created <span class=""><a href="attachment.cgi?id=117077" name="attach_117077" title="Prototype of a more highlevel graph modification api">attachment 117077</a> <a href="attachment.cgi?id=117077&amp;action=edit" title="Prototype of a more highlevel graph modification api">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90887&amp;attachment=117077'>[review]</a> [review] [review] [review] [review]
&gt; &gt; &gt; &gt; Prototype of a more highlevel graph modification api
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; ...
&gt; &gt; &gt; 
&gt; &gt; &gt; Hrm, I was about to (try to) push this out, but it doesn't seem to work. I
&gt; &gt; &gt; made a few local adjustments, like
&gt; &gt; &gt; 
&gt; &gt; &gt; RegAlloc::PhiMovesPass::isCriticalEdge(BasicBlock *b, BasicBlock *p)
&gt; &gt; &gt; {
&gt; &gt; &gt;    return b-&gt;cfg.incidentCount() &gt; 1 &amp;&amp; p-&gt;cfg.outgoingCount() &gt; 1;
&gt; &gt; &gt; }
&gt; &gt; &gt; 
&gt; &gt; &gt; ...
&gt; &gt; &gt; 
&gt; &gt; &gt; 
&gt; &gt; &gt; where did BB:4 go? poof. not great :( this is with piglit's
&gt; &gt; &gt; tests/shaders/ssa/fs-critical-edge.shader_test
&gt; &gt; &gt; 
&gt; &gt; &gt; I guess I'll go with either your or my first patches. Want to get this fixed
&gt; &gt; &gt; for Mesa 11, which is going to get branched off some time tomorrow.
&gt; &gt; 
&gt; &gt; Sorry, most probably my prototype code is crap. I'll have an hour now to
&gt; &gt; look at it. I'll let you know if I find something. Otherwise I'm fine with
&gt; &gt; your first patch.
&gt; 
&gt; Awesome! While I don't know whether the isCriticalEdge thing is the right
&gt; thing to do instead of the current needNewElseBlock logic, I do think that
&gt; splitEdge should be able to work properly even if needNewElseBlock always
&gt; returns true.</span >

Yes, it should. My usual test cases plus the patch below look fine. My piglit
(from git://anongit.freedesktop.org/piglit) doesn't have a fs-critical-edge
test, though. Where do I find it?

That prototype patch was more of a RFC anyway to show how graph manipulation
could be made less intimidating. If you like the direction I will work some
more on it. But I think it is safe to go with your patch for now.


--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
&#64;&#64; -335,15 +335,7 &#64;&#64; RegAlloc::BuildIntervalsPass::addLiveRange(Value *val,
 bool
 RegAlloc::PhiMovesPass::needNewElseBlock(BasicBlock *b, BasicBlock *p)
 {
-   if (b-&gt;cfg.incidentCount() &lt;= 1)
-      return false;
-
-   int n = 0;
-   for (Graph::EdgeIterator ei = p-&gt;cfg.outgoing(); !ei.end(); ei.next())
-      if (ei.getType() == Graph::Edge::TREE ||
-          ei.getType() == Graph::Edge::FORWARD)
-         ++n;
-   return (n == 2);
+   return (b-&gt;cfg.incidentCount() &gt; 1) &amp;&amp; (p-&gt;cfg.outgoingCount() &gt; 1);
 }

 // For each operand of each PHI in b, generate a new value by inserting a MOV</pre>
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

--1440108984.1daFF2.5951--

--===============1021343463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1021343463==--
