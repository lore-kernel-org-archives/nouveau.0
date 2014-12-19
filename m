From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87469] [NV34] Invisible cursor on Xorg
Date: Fri, 19 Dec 2014 05:03:39 +0000
Message-ID: <bug-87469-8800-VBD2QzfL82@http.bugs.freedesktop.org/>
References: <bug-87469-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0700701600=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87469-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0700701600==
Content-Type: multipart/alternative; boundary="1418965419.Fdfc5bc62.18012"; charset="UTF-8"


--1418965419.Fdfc5bc62.18012
Date: Fri, 19 Dec 2014 05:03:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87469

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Fernando Rodriguez from comment #8)
> I see. So that commit fixed that bug and triggered another one? Does that

An earlier commit broke AGP. That commit went into 3.17, I believe. The commit
you bisected to restored AGP.

Please test out kernel 4acfd707^ -- I think that was the commit that broke
things... maybe. If that still doesn't get you acceleration, just try 3.16.
Basically I'd like to figure out if there was a time when acceleration *and*
the cursor worked all at the same time, and if so, to figure out when that
broke.

> I also just tried booting v3.17.3 and logged in to kde and switched the
> compositor to OpenGL (which obviously never worked before on this machine).

The nv30 GL driver is pretty crappy, sorry. Especially for actual nv3x cards
(vs nv4x ones). Lots of ways to mess things up. Also note that this card was
released in 2003-2004 -- its hw capabilities (even with a hypothetical
well-written GL driver) won't be a good match for software written for 2014.

In any case, my recommendation is to tackle one issue at a time. Mouse cursor
trumps GL compositors in my mind. When that's resolved, you can file more bugs
for your other issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418965419.Fdfc5bc62.18012
Date: Fri, 19 Dec 2014 05:03:39 +0000
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
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469">bug 87469</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Fernando Rodriguez from <a href="show_bug.cgi?id=87469#c8">comment #8</a>)
<span class="quote">&gt; I see. So that commit fixed that bug and triggered another one? Does that</span >

An earlier commit broke AGP. That commit went into 3.17, I believe. The commit
you bisected to restored AGP.

Please test out kernel 4acfd707^ -- I think that was the commit that broke
things... maybe. If that still doesn't get you acceleration, just try 3.16.
Basically I'd like to figure out if there was a time when acceleration *and*
the cursor worked all at the same time, and if so, to figure out when that
broke.

<span class="quote">&gt; I also just tried booting v3.17.3 and logged in to kde and switched the
&gt; compositor to OpenGL (which obviously never worked before on this machine).</span >

The nv30 GL driver is pretty crappy, sorry. Especially for actual nv3x cards
(vs nv4x ones). Lots of ways to mess things up. Also note that this card was
released in 2003-2004 -- its hw capabilities (even with a hypothetical
well-written GL driver) won't be a good match for software written for 2014.

In any case, my recommendation is to tackle one issue at a time. Mouse cursor
trumps GL compositors in my mind. When that's resolved, you can file more bugs
for your other issues.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418965419.Fdfc5bc62.18012--

--===============0700701600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0700701600==--
