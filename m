From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Wed, 12 Oct 2016 20:56:51 +0000
Message-ID: <bug-70972-8800-NB4GVoYsOG@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1922624585=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1922624585==
Content-Type: multipart/alternative; boundary="14763058114.B3c9F6BA.10490";
 charset="UTF-8"


--14763058114.B3c9F6BA.10490
Date: Wed, 12 Oct 2016 20:56:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70972

--- Comment #27 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Nerijus Bali=C5=ABnas from comment #25)
> Created attachment 127258 [details]
> mmiotrace when changing resolutions with nouveau

A successful mmiotrace should be 10-100MB or so. (Use xz -9 to compress it.)

Have a look at https://wiki.ubuntu.com/X/MMIOTracing for a guide on how to
trace properly. The trace needs to be started before nouveau loads.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14763058114.B3c9F6BA.10490
Date: Wed, 12 Oct 2016 20:56:51 +0000
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
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972">bug 70972<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Nerijus Bali=C5=ABnas from <a href=3D"show_bug.cg=
i?id=3D70972#c25">comment #25</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D127258" name=3D"attach_127258" title=3D"mmiotrace when changing res=
olutions with nouveau">attachment 127258</a> <a href=3D"attachment.cgi?id=
=3D127258&amp;action=3Dedit" title=3D"mmiotrace when changing resolutions w=
ith nouveau">[details]</a></span>
&gt; mmiotrace when changing resolutions with nouveau</span >

A successful mmiotrace should be 10-100MB or so. (Use xz -9 to compress it.)

Have a look at <a href=3D"https://wiki.ubuntu.com/X/MMIOTracing">https://wi=
ki.ubuntu.com/X/MMIOTracing</a> for a guide on how to
trace properly. The trace needs to be started before nouveau loads.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14763058114.B3c9F6BA.10490--

--===============1922624585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1922624585==--
