From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91037] desktop freezes shortly after boot with NV11
 [GeForce2 MX/MX 400]
Date: Sat, 20 Jun 2015 21:36:34 +0000
Message-ID: <bug-91037-8800-5Y2664mohY@http.bugs.freedesktop.org/>
References: <bug-91037-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0126170305=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91037-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0126170305==
Content-Type: multipart/alternative; boundary="1434836194.6d15BB2.24439"; charset="UTF-8"


--1434836194.6d15BB2.24439
Date: Sat, 20 Jun 2015 21:36:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91037

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to anonymissimus from comment #6)
> Well, this is LXDE http://lxde.org/ a modern, but lightweight desktop that
> should be designed for such hardware...
> Are you suggesting I should try another lightweight desktop ? Xfce would be
> an option.

Nope, that should largely be fine. I was mainly warning you away from things
like gnome and kde which have very heavy things turned on by default.

So..... it looks like we're doing *something* which hangs the GPU, but we do it
without triggering any errors from the card, it just stops processing commands.
That's nice.

I've never tried nouveau with a NV11, but I have used it with a NV17, and it
was fine, when using WindowMaker. NV17 introduces some 3D functionality on top
of what NV11 has, but we tend to be pretty good about detecting that (and if we
were calling it, we'd have seen errors about unknown methods).

Unfortunately I'm not sure how to debug this hang. Ben, thoughts on providing a
way to see what was in the last-submitted exec request [pushbuf, relocs, etc]
before the hang (i.e. the one whose fence never gets reached)? Seems like that
should be moderately easy, no?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434836194.6d15BB2.24439
Date: Sat, 20 Jun 2015 21:36:34 +0000
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
   title="NEW - desktop freezes shortly after boot with NV11 [GeForce2 MX/MX 400]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91037#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - desktop freezes shortly after boot with NV11 [GeForce2 MX/MX 400]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91037">bug 91037</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to anonymissimus from <a href="show_bug.cgi?id=91037#c6">comment #6</a>)
<span class="quote">&gt; Well, this is LXDE <a href="http://lxde.org/">http://lxde.org/</a> a modern, but lightweight desktop that
&gt; should be designed for such hardware...
&gt; Are you suggesting I should try another lightweight desktop ? Xfce would be
&gt; an option.</span >

Nope, that should largely be fine. I was mainly warning you away from things
like gnome and kde which have very heavy things turned on by default.

So..... it looks like we're doing *something* which hangs the GPU, but we do it
without triggering any errors from the card, it just stops processing commands.
That's nice.

I've never tried nouveau with a NV11, but I have used it with a NV17, and it
was fine, when using WindowMaker. NV17 introduces some 3D functionality on top
of what NV11 has, but we tend to be pretty good about detecting that (and if we
were calling it, we'd have seen errors about unknown methods).

Unfortunately I'm not sure how to debug this hang. Ben, thoughts on providing a
way to see what was in the last-submitted exec request [pushbuf, relocs, etc]
before the hang (i.e. the one whose fence never gets reached)? Seems like that
should be moderately easy, no?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434836194.6d15BB2.24439--

--===============0126170305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0126170305==--
