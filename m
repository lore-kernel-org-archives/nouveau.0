From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] KMail crash on starting (nouveau-related)
Date: Sat, 10 Dec 2016 20:40:24 +0000
Message-ID: <bug-98039-8800-J0bCbdL017@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1029976033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1029976033==
Content-Type: multipart/alternative; boundary="14814024240.29cAAeCEF.18239";
 charset="UTF-8"


--14814024240.29cAAeCEF.18239
Date: Sat, 10 Dec 2016 20:40:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Tomasz Pawe=C5=82 Gajc from comment #7)
> (In reply to Ilia Mirkin from comment #6)
> > Nope - none. Those patches are broken-by-design for the general case. E=
ither
> > don't use nouveau_dri.so or don't use [recent versions of] KDE.
>=20
> You are saying, don't use anything that make use of multi-threaded OpenGL=
 or
> buy AMD/Intel gfx card :(

You can interpret it as you will. The present situation is that nouveau does
not support threads concurrently calling into it.

This was never a problem until software that had no business doing anything
with GL or nouveau started depending on it without any kind of analysis of
end-user impact (or perhaps they did analyze it and didn't care since they =
felt
that no one uses nouveau). Somehow the nouveau developers are stuck with the
fallout.

(In reply to Tomasz Pawe=C5=82 Gajc from comment #8)
> BTW i've applied your patches
> https://github.com/OpenMandrivaAssociation/mesa/commit/
> 5657638feb4d45e0c6be04a3326ea3a93e403bc7

Thanks for letting me know. I'll be sure to tell people to try an upstream
version of mesa should they mention that they're using OpenMandriva. (Note =
that
OpenSuSE attempted something along those lines too, but ended up just not
shipping nouveau_dri.so, I believe.)

I'm going to go ahead and remove that branch to avoid any further confusion
about its suitability. I figured it might let a handful of advanced users m=
ake
use of their applications, but it's turning out to cause more harm than goo=
d.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14814024240.29cAAeCEF.18239
Date: Sat, 10 Dec 2016 20:40:24 +0000
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
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Tomasz Pawe=C5=82 Gajc from <a href=3D"show_bug.c=
gi?id=3D98039#c7">comment #7</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D98039#c6">comment #6</a>)
&gt; &gt; Nope - none. Those patches are broken-by-design for the general c=
ase. Either
&gt; &gt; don't use nouveau_dri.so or don't use [recent versions of] KDE.
&gt;=20
&gt; You are saying, don't use anything that make use of multi-threaded Ope=
nGL or
&gt; buy AMD/Intel gfx card :(</span >

You can interpret it as you will. The present situation is that nouveau does
not support threads concurrently calling into it.

This was never a problem until software that had no business doing anything
with GL or nouveau started depending on it without any kind of analysis of
end-user impact (or perhaps they did analyze it and didn't care since they =
felt
that no one uses nouveau). Somehow the nouveau developers are stuck with the
fallout.

(In reply to Tomasz Pawe=C5=82 Gajc from <a href=3D"show_bug.cgi?id=3D98039=
#c8">comment #8</a>)
<span class=3D"quote">&gt; BTW i've applied your patches
&gt; <a href=3D"https://github.com/OpenMandrivaAssociation/mesa/commit/">ht=
tps://github.com/OpenMandrivaAssociation/mesa/commit/</a>
&gt; 5657638feb4d45e0c6be04a3326ea3a93e403bc7</span >

Thanks for letting me know. I'll be sure to tell people to try an upstream
version of mesa should they mention that they're using OpenMandriva. (Note =
that
OpenSuSE attempted something along those lines too, but ended up just not
shipping nouveau_dri.so, I believe.)

I'm going to go ahead and remove that branch to avoid any further confusion
about its suitability. I figured it might let a handful of advanced users m=
ake
use of their applications, but it's turning out to cause more harm than goo=
d.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14814024240.29cAAeCEF.18239--

--===============1029976033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1029976033==--
