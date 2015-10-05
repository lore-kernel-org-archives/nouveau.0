From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92274] nouveau black screen and errors with two
 monitors attached
Date: Mon, 05 Oct 2015 18:59:02 +0000
Message-ID: <bug-92274-8800-L1P5wxGbJL@http.bugs.freedesktop.org/>
References: <bug-92274-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1895725149=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92274-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1895725149==
Content-Type: multipart/alternative; boundary="1444071542.1d8DAc2.17339"; charset="UTF-8"


--1444071542.1d8DAc2.17339
Date: Mon, 5 Oct 2015 18:59:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92274

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to joseph-thommes from comment #7)
> Oh these two video options were for testing and did not show any effect.
> I accidently took this kernel log, but the other ones without these options
> looked the same.
> I'm not that into compiling everything on my own (except for some of the
> easy or
> self written parts; or when gentoo does it for me ;)), but I'm willing to
> learn
> and been always looking for a good reason to get myself doing something like
> this
> and not thinking that others will do it or that it does not have enough
> advantages.
> 
> So just that I got it right:
> I get the source code from the nouveau git repository,
> change the affected code parts, follow the instructions in the readme etc.
> and compile nouveau as a module to load it.
> 
> Is it enough that I just download a snapshot and do a out-of-tree
> compilation?
> Is it compatible with my kernel?
> (because it says it contains the 3.x versions and my version is 4)
> Which settings do I need to enable in my kernel that are not trivial?
> 
> Sorry for so many questions, but I'd really like to get this done.

Doesn't matter what code you grab, it should basically be the same for the past
many kernel versions. Nouveau got a bit of a rewrite in 4.3, so the code might
look a bit different if you use an older kernel, but it's the same idea.

If this is your first time compiling a kernel, then it might get a bit tricky.
First grab a kernel, compile it, make sure you can boot it, and *then* make the
relevant changes.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444071542.1d8DAc2.17339
Date: Mon, 5 Oct 2015 18:59:02 +0000
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
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274">bug 92274</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to joseph-thommes from <a href="show_bug.cgi?id=92274#c7">comment #7</a>)
<span class="quote">&gt; Oh these two video options were for testing and did not show any effect.
&gt; I accidently took this kernel log, but the other ones without these options
&gt; looked the same.
&gt; I'm not that into compiling everything on my own (except for some of the
&gt; easy or
&gt; self written parts; or when gentoo does it for me ;)), but I'm willing to
&gt; learn
&gt; and been always looking for a good reason to get myself doing something like
&gt; this
&gt; and not thinking that others will do it or that it does not have enough
&gt; advantages.
&gt; 
&gt; So just that I got it right:
&gt; I get the source code from the nouveau git repository,
&gt; change the affected code parts, follow the instructions in the readme etc.
&gt; and compile nouveau as a module to load it.
&gt; 
&gt; Is it enough that I just download a snapshot and do a out-of-tree
&gt; compilation?
&gt; Is it compatible with my kernel?
&gt; (because it says it contains the 3.x versions and my version is 4)
&gt; Which settings do I need to enable in my kernel that are not trivial?
&gt; 
&gt; Sorry for so many questions, but I'd really like to get this done.</span >

Doesn't matter what code you grab, it should basically be the same for the past
many kernel versions. Nouveau got a bit of a rewrite in 4.3, so the code might
look a bit different if you use an older kernel, but it's the same idea.

If this is your first time compiling a kernel, then it might get a bit tricky.
First grab a kernel, compile it, make sure you can boot it, and *then* make the
relevant changes.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444071542.1d8DAc2.17339--

--===============1895725149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1895725149==--
