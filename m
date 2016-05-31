From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Tue, 31 May 2016 16:05:43 +0000
Message-ID: <bug-90626-8800-xzyf1eOwqz@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1808609274=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1808609274==
Content-Type: multipart/alternative; boundary="14647107420.f1aDa83.22589";
 charset="UTF-8"


--14647107420.f1aDa83.22589
Date: Tue, 31 May 2016 16:05:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #49 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
(In reply to Ren=C3=A9 Krell from comment #48)
> (In reply to Roy from comment #47)
> > (In reply to Ren=C3=A9 Krell from comment #46)
> > > Will this patches go into the main kernel driver?
> >=20
> > It got merged in kernel 4.4-rc3 [1]. Please test and report when succes=
sful.
> >=20
> > [1] http://lkml.iu.edu/hypermail/linux/kernel/1511.3/03588.html
>=20
> There were tow patches mentioned by Ilja:
> -
> http://cgit.freedesktop.org/~darktama/nouveau/commit/
> ?id=3Dfcd74e81e65aee8a2a33bdca3142a5358dac7582 (This got merged as
> "drm/nouveau/bios: return actual size of the buffer retrieved via _ROM").
> - https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c24 - removing the=
 fast
> loading option (As far as I understand this one has been also necessary to
> make the HP ZBook 15 work. I can't see this officially. Is it obsolete or
> should just owners of that special hardware apply this patch?)

Comment #45 seems to indicate that the patch carried upstream should be
sufficient to fix this bug, but please test and report when successful.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14647107420.f1aDa83.22589
Date: Tue, 31 May 2016 16:05:42 +0000
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
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c49">Commen=
t # 49</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rspliet&#64;eclipso.eu" title=3D"Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span=
 class=3D"fn">Roy</span></a>
</span></b>
        <pre>(In reply to Ren=C3=A9 Krell from <a href=3D"show_bug.cgi?id=
=3D90626#c48">comment #48</a>)
<span class=3D"quote">&gt; (In reply to Roy from <a href=3D"show_bug.cgi?id=
=3D90626#c47">comment #47</a>)
&gt; &gt; (In reply to Ren=C3=A9 Krell from <a href=3D"show_bug.cgi?id=3D90=
626#c46">comment #46</a>)
&gt; &gt; &gt; Will this patches go into the main kernel driver?
&gt; &gt;=20
&gt; &gt; It got merged in kernel 4.4-rc3 [1]. Please test and report when =
successful.
&gt; &gt;=20
&gt; &gt; [1] <a href=3D"http://lkml.iu.edu/hypermail/linux/kernel/1511.3/0=
3588.html">http://lkml.iu.edu/hypermail/linux/kernel/1511.3/03588.html</a>
&gt;=20
&gt; There were tow patches mentioned by Ilja:
&gt; -
&gt; <a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/">http=
://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; ?id=3Dfcd74e81e65aee8a2a33bdca3142a5358dac7582 (This got merged as
&gt; &quot;drm/nouveau/bios: return actual size of the buffer retrieved via=
 _ROM&quot;).
&gt; - <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"show_bug.cgi?id=3D90626#c24">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D90626#c24</a> - removing the fast
&gt; loading option (As far as I understand this one has been also necessar=
y to
&gt; make the HP ZBook 15 work. I can't see this officially. Is it obsolete=
 or
&gt; should just owners of that special hardware apply this patch?)</span >

<a href=3D"show_bug.cgi?id=3D90626#c45">Comment #45</a> seems to indicate t=
hat the patch carried upstream should be
sufficient to fix this bug, but please test and report when successful.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14647107420.f1aDa83.22589--

--===============1808609274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1808609274==--
