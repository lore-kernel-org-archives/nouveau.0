From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Tue, 08 Nov 2016 10:37:31 +0000
Message-ID: <bug-94990-8800-S97pMR1wGY@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1460984363=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1460984363==
Content-Type: multipart/alternative; boundary="147860145112.dceA8d.29815";
 charset="UTF-8"


--147860145112.dceA8d.29815
Date: Tue, 8 Nov 2016 10:37:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #86 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Yann Golanski from comment #85)
> (In reply to Wojciech Arabczyk from comment #82)
> > Created attachment 127564 [details]
> > dmesg after applying patch to limit bar to 3GB
> >=20
> > After applying the patch to limit ram to 3 bars, boots without problems.
> > Blank screen is gone.
>=20
> Could we at least have this as a patch for now until a better one comes
> along. Otherwise us poor folks owning GT970 cannot update to Fedora 25=E2=
=80=A6 =E2=98=B9

we can't. there would be a less generic patch needed, because it would affe=
ct a
lot of different GPUs as well and mess with the amount of VRAM reported.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--147860145112.dceA8d.29815
Date: Tue, 8 Nov 2016 10:37:31 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c86">Commen=
t # 86</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Yann Golanski from <a href=3D"show_bug.cgi?id=3D9=
4990#c85">comment #85</a>)
<span class=3D"quote">&gt; (In reply to Wojciech Arabczyk from <a href=3D"s=
how_bug.cgi?id=3D94990#c82">comment #82</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D127564" n=
ame=3D"attach_127564" title=3D"dmesg after applying patch to limit bar to 3=
GB">attachment 127564</a> <a href=3D"attachment.cgi?id=3D127564&amp;action=
=3Dedit" title=3D"dmesg after applying patch to limit bar to 3GB">[details]=
</a></span>
&gt; &gt; dmesg after applying patch to limit bar to 3GB
&gt; &gt;=20
&gt; &gt; After applying the patch to limit ram to 3 bars, boots without pr=
oblems.
&gt; &gt; Blank screen is gone.
&gt;=20
&gt; Could we at least have this as a patch for now until a better one comes
&gt; along. Otherwise us poor folks owning GT970 cannot update to Fedora 25=
=E2=80=A6 =E2=98=B9</span >

we can't. there would be a less generic patch needed, because it would affe=
ct a
lot of different GPUs as well and mess with the amount of VRAM reported.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--147860145112.dceA8d.29815--

--===============1460984363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1460984363==--
