From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Fri, 21 Aug 2015 00:03:07 +0000
Message-ID: <bug-90887-8800-NRztBddSn5@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1281753703=="
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


--===============1281753703==
Content-Type: multipart/alternative; boundary="1440115387.321C303.32049"; charset="UTF-8"


--1440115387.321C303.32049
Date: Fri, 21 Aug 2015 00:03:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #29 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to jr from comment #28)
> (In reply to Ilia Mirkin from comment #27)
> > If you're still having trouble, try building for a fermi or kepler target
> > using nouveau_compiler, i.e.
> > 
> > src/gallium/drivers/nouveau/nouveau_compiler -a c0 -
> > <paste the tgsi shader, ^D>
> > 
> > and enjoy. [It also can take it from a file.]
> 
> Nice, thanks for the hint. But it produces different code to your log
> (without any ld u64) and BB4 doesn't vanish. It seems to trigger edge
> splitting once on the 2 to 4 edge:

Hmmmm... maybe it was one of my local patches? I'll try to figure out what went
wrong later tonight.

I added logic to be clever about edge types... when splitting an edge, the type
should remain except a forward edge becomes a cross edge. (You can do it out on
paper...) Perhaps that upset things? It doesn't seem like codegen is using
those terms in the usual MST meanings :(

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440115387.321C303.32049
Date: Fri, 21 Aug 2015 00:03:07 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to jr from <a href="show_bug.cgi?id=90887#c28">comment #28</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c27">comment #27</a>)
&gt; &gt; If you're still having trouble, try building for a fermi or kepler target
&gt; &gt; using nouveau_compiler, i.e.
&gt; &gt; 
&gt; &gt; src/gallium/drivers/nouveau/nouveau_compiler -a c0 -
&gt; &gt; &lt;paste the tgsi shader, ^D&gt;
&gt; &gt; 
&gt; &gt; and enjoy. [It also can take it from a file.]
&gt; 
&gt; Nice, thanks for the hint. But it produces different code to your log
&gt; (without any ld u64) and BB4 doesn't vanish. It seems to trigger edge
&gt; splitting once on the 2 to 4 edge:</span >

Hmmmm... maybe it was one of my local patches? I'll try to figure out what went
wrong later tonight.

I added logic to be clever about edge types... when splitting an edge, the type
should remain except a forward edge becomes a cross edge. (You can do it out on
paper...) Perhaps that upset things? It doesn't seem like codegen is using
those terms in the usual MST meanings :(</pre>
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

--1440115387.321C303.32049--

--===============1281753703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1281753703==--
