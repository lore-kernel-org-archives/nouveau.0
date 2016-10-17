From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Mon, 17 Oct 2016 11:53:08 +0000
Message-ID: <bug-94990-8800-kif3Fzfpqb@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0173388405=="
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


--===============0173388405==
Content-Type: multipart/alternative; boundary="14767051880.eD9f.4399";
 charset="UTF-8"


--14767051880.eD9f.4399
Date: Mon, 17 Oct 2016 11:53:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #75 from Yann Golanski <freedesktop-0sa3Xf22Pasdnm+yROfE0A@public.gmane.org> ---
(In reply to Karol Herbst from comment #74)
> (In reply to Yann Golanski from comment #73)
> > (In reply to Karol Herbst from comment #72)
> > > By the way, this affects the kernel module only.
> >=20
> > This still stops my machine from booting or X11 from running if I disab=
le
> > the Nouveau driver. Or am I being dense and missing something?=E2=80=A6=
 =E2=98=BA
>=20
> most likely, yes. You should check dmesg in this case and check what is
> happening.

Err=E2=80=A6 If I disable Nouveau, I get no X11 at all. If I leave it enabl=
ed, the
machine does not boot.

Is there a way to boot with a kernel 4.6X and have X11 work via Nouveau?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14767051880.eD9f.4399
Date: Mon, 17 Oct 2016 11:53:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c75">Commen=
t # 75</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;kierun.org" title=3D"Yann Golanski &lt;freedesktop&#64;kier=
un.org&gt;"> <span class=3D"fn">Yann Golanski</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href=3D"show_bug.cgi?id=3D94=
990#c74">comment #74</a>)
<span class=3D"quote">&gt; (In reply to Yann Golanski from <a href=3D"show_=
bug.cgi?id=3D94990#c73">comment #73</a>)
&gt; &gt; (In reply to Karol Herbst from <a href=3D"show_bug.cgi?id=3D94990=
#c72">comment #72</a>)
&gt; &gt; &gt; By the way, this affects the kernel module only.
&gt; &gt;=20
&gt; &gt; This still stops my machine from booting or X11 from running if I=
 disable
&gt; &gt; the Nouveau driver. Or am I being dense and missing something?=E2=
=80=A6 =E2=98=BA
&gt;=20
&gt; most likely, yes. You should check dmesg in this case and check what is
&gt; happening.</span >

Err=E2=80=A6 If I disable Nouveau, I get no X11 at all. If I leave it enabl=
ed, the
machine does not boot.

Is there a way to boot with a kernel 4.6X and have X11 work via Nouveau?</p=
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

--14767051880.eD9f.4399--

--===============0173388405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0173388405==--
