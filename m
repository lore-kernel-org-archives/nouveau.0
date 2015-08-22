From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sat, 22 Aug 2015 22:41:56 +0000
Message-ID: <bug-90887-8800-0IXFumZUt5@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1751857651=="
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


--===============1751857651==
Content-Type: multipart/alternative; boundary="1440283316.6dcD2.11222"; charset="UTF-8"


--1440283316.6dcD2.11222
Date: Sat, 22 Aug 2015 22:41:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #38 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #37)
> I think this is too big of a problem to fix in a fixup, esp since we don't
> really know what these are used for.
> 
> I'm thinking the following:
> 
> (a) Push my fixup patch with the hash map, cc'd to stable. It's a little
> inefficient, but it *works*, and is (in my mind) quite simple. I'll
> double-check that it doesn't affect perf too much.
> (b) Figure out this edge type insanity, including fixing things up, and
> maybe adding a validator that makes sure that the edge types are correct.
> (c) Revert my fixup, and implement actual edge splitting, (i.e. what you
> did) and based on critical edges rather than the current logic.
> (d) Lots and lots of testing.
> 
> Does that sound reasonable? One of the considerations here is that neither
> you nor I have a *ton* of time to play around with this, and Mesa 11.0.0
> will be released in mid-September, and I'd like to have *some* fix for nv50
> in there.

Looks like a good plan. Your patch shouldn't make anything worse and has been
tested to fix the reported problems, so this and the other bug can be closed.

> As for your patch, the edge is preserved in all cases except forward, which
> becomes cross. (draw it out, should make sense, unless I messed up)

I'm afk for a week, but will take a longer look. Actually it shouldn't be too
difficult, since there are not that many places creating edges.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440283316.6dcD2.11222
Date: Sat, 22 Aug 2015 22:41:56 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c37">comment #37</a>)
<span class="quote">&gt; I think this is too big of a problem to fix in a fixup, esp since we don't
&gt; really know what these are used for.
&gt; 
&gt; I'm thinking the following:
&gt; 
&gt; (a) Push my fixup patch with the hash map, cc'd to stable. It's a little
&gt; inefficient, but it *works*, and is (in my mind) quite simple. I'll
&gt; double-check that it doesn't affect perf too much.
&gt; (b) Figure out this edge type insanity, including fixing things up, and
&gt; maybe adding a validator that makes sure that the edge types are correct.
&gt; (c) Revert my fixup, and implement actual edge splitting, (i.e. what you
&gt; did) and based on critical edges rather than the current logic.
&gt; (d) Lots and lots of testing.
&gt; 
&gt; Does that sound reasonable? One of the considerations here is that neither
&gt; you nor I have a *ton* of time to play around with this, and Mesa 11.0.0
&gt; will be released in mid-September, and I'd like to have *some* fix for nv50
&gt; in there.</span >

Looks like a good plan. Your patch shouldn't make anything worse and has been
tested to fix the reported problems, so this and the other bug can be closed.

<span class="quote">&gt; As for your patch, the edge is preserved in all cases except forward, which
&gt; becomes cross. (draw it out, should make sense, unless I messed up)</span >

I'm afk for a week, but will take a longer look. Actually it shouldn't be too
difficult, since there are not that many places creating edges.</pre>
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

--1440283316.6dcD2.11222--

--===============1751857651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1751857651==--
