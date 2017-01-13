From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Fri, 13 Jan 2017 15:42:36 +0000
Message-ID: <bug-99400-8800-QxmKsGRkQN@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1026022885=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1026022885==
Content-Type: multipart/alternative; boundary="14843221550.ec9D457.6628";
 charset="UTF-8"


--14843221550.ec9D457.6628
Date: Fri, 13 Jan 2017 15:42:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #3 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> Not that it's of much consolation, but the nv30 GL driver sucks. There ar=
e a
> number of unhandled situations, and I wouldn't be overly surprised if gla=
mor
> were to hit one or several of them.

Could be a regression, I don't remember seeing those /before/ and the
downstream bugs about black icons are recent as well.

And there've been some glamor changes in the xserver as well, so it oculd be
/something/ in glamor has changed and doesn't play well with the driver.

> A "big hammer" approach to fixing some of the issues is running with
> NV30_SWTNL=3D1, although there's plenty more issues that this won't have =
an
> effect on. That usually fixes "bad geometry" issues, however the screensh=
ot
> seems to suggest that perhaps incompatible color and depth buffers are be=
ing
> mixed

Yes, that makes me think of that as well, could explain the black icons bei=
ng
reported downstream.

> - we print a warning about those in debug builds.

Good, so I'll rebuild with "--enable-debug" and see what I get.

> I'll have a look at the apitrace later to see if can try reproducing on my
> NV34, although it's possible that won't work this time.

Thanks a bunch!

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14843221550.ec9D457.6628
Date: Fri, 13 Jan 2017 15:42:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D994=
00#c2">comment #2</a>)
<span class=3D"quote">&gt; Not that it's of much consolation, but the nv30 =
GL driver sucks. There are a
&gt; number of unhandled situations, and I wouldn't be overly surprised if =
glamor
&gt; were to hit one or several of them.</span >

Could be a regression, I don't remember seeing those /before/ and the
downstream bugs about black icons are recent as well.

And there've been some glamor changes in the xserver as well, so it oculd be
/something/ in glamor has changed and doesn't play well with the driver.

<span class=3D"quote">&gt; A &quot;big hammer&quot; approach to fixing some=
 of the issues is running with
&gt; NV30_SWTNL=3D1, although there's plenty more issues that this won't ha=
ve an
&gt; effect on. That usually fixes &quot;bad geometry&quot; issues, however=
 the screenshot
&gt; seems to suggest that perhaps incompatible color and depth buffers are=
 being
&gt; mixed</span >

Yes, that makes me think of that as well, could explain the black icons bei=
ng
reported downstream.

<span class=3D"quote">&gt; - we print a warning about those in debug builds=
.</span >

Good, so I'll rebuild with &quot;--enable-debug&quot; and see what I get.

<span class=3D"quote">&gt; I'll have a look at the apitrace later to see if=
 can try reproducing on my
&gt; NV34, although it's possible that won't work this time.</span >

Thanks a bunch!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14843221550.ec9D457.6628--

--===============1026022885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1026022885==--
