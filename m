From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Thu, 20 Aug 2015 20:20:19 +0000
Message-ID: <bug-90887-8800-MqCV3kUvIs@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0044782173=="
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


--===============0044782173==
Content-Type: multipart/alternative; boundary="1440102018.eaaA2.1835"; charset="UTF-8"


--1440102018.eaaA2.1835
Date: Thu, 20 Aug 2015 20:20:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #23 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #22)
> (In reply to jr from comment #21)
> > Created attachment 117077 [details] [review] [review]
> > Prototype of a more highlevel graph modification api
> > 
> > ...
> 
> Hrm, I was about to (try to) push this out, but it doesn't seem to work. I
> made a few local adjustments, like
> 
> RegAlloc::PhiMovesPass::isCriticalEdge(BasicBlock *b, BasicBlock *p)
> {
>    return b->cfg.incidentCount() > 1 && p->cfg.outgoingCount() > 1;
> }
> 
> ...
> 
> 
> where did BB:4 go? poof. not great :( this is with piglit's
> tests/shaders/ssa/fs-critical-edge.shader_test
> 
> I guess I'll go with either your or my first patches. Want to get this fixed
> for Mesa 11, which is going to get branched off some time tomorrow.

Sorry, most probably my prototype code is crap. I'll have an hour now to look
at it. I'll let you know if I find something. Otherwise I'm fine with your
first patch.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440102018.eaaA2.1835
Date: Thu, 20 Aug 2015 20:20:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c22">comment #22</a>)
<span class="quote">&gt; (In reply to jr from <a href="show_bug.cgi?id=90887#c21">comment #21</a>)
&gt; &gt; Created <span class=""><a href="attachment.cgi?id=117077" name="attach_117077" title="Prototype of a more highlevel graph modification api">attachment 117077</a> <a href="attachment.cgi?id=117077&amp;action=edit" title="Prototype of a more highlevel graph modification api">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90887&amp;attachment=117077'>[review]</a> [review] [review]
&gt; &gt; Prototype of a more highlevel graph modification api
&gt; &gt; 
&gt; &gt; ...
&gt; 
&gt; Hrm, I was about to (try to) push this out, but it doesn't seem to work. I
&gt; made a few local adjustments, like
&gt; 
&gt; RegAlloc::PhiMovesPass::isCriticalEdge(BasicBlock *b, BasicBlock *p)
&gt; {
&gt;    return b-&gt;cfg.incidentCount() &gt; 1 &amp;&amp; p-&gt;cfg.outgoingCount() &gt; 1;
&gt; }
&gt; 
&gt; ...
&gt; 
&gt; 
&gt; where did BB:4 go? poof. not great :( this is with piglit's
&gt; tests/shaders/ssa/fs-critical-edge.shader_test
&gt; 
&gt; I guess I'll go with either your or my first patches. Want to get this fixed
&gt; for Mesa 11, which is going to get branched off some time tomorrow.</span >

Sorry, most probably my prototype code is crap. I'll have an hour now to look
at it. I'll let you know if I find something. Otherwise I'm fine with your
first patch.</pre>
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

--1440102018.eaaA2.1835--

--===============0044782173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0044782173==--
