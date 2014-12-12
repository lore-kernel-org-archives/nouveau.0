From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] [NV84] gpu hang on resume from suspend to ram
Date: Fri, 12 Dec 2014 19:11:46 +0000
Message-ID: <bug-86115-8800-teHRNhbScw@http.bugs.freedesktop.org/>
References: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0774341931=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0774341931==
Content-Type: multipart/alternative; boundary="1418411506.adce243.13339"; charset="UTF-8"


--1418411506.adce243.13339
Date: Fri, 12 Dec 2014 19:11:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D86115

--- Comment #15 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to Lars M=C3=BCller from comment #14)
> Is more testing or additional feedback required from my side to move this
> bug forward?

You could try to boot and test with

modprobe.blacklist=3Dnouveau to make sure the module isn't loaded.

If you really have time on your hands, try to bisect the problem: 3.11 as a
good starting point and 3.13 or 3.14 as bad, but that will really eat time =
:)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1418411506.adce243.13339
Date: Fri, 12 Dec 2014 19:11:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115">bug 86115<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tobias.klausmann&#64;mni.thm.de" title=3D"Tobias Klausmann &lt;tobias.klaus=
mann&#64;mni.thm.de&gt;"> <span class=3D"fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to Lars M=C3=BCller from <a href=3D"show_bug.cgi?id=
=3D86115#c14">comment #14</a>)
<span class=3D"quote">&gt; Is more testing or additional feedback required =
from my side to move this
&gt; bug forward?</span >

You could try to boot and test with

modprobe.blacklist=3Dnouveau to make sure the module isn't loaded.

If you really have time on your hands, try to bisect the problem: 3.11 as a
good starting point and 3.13 or 3.14 as bad, but that will really eat time =
:)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418411506.adce243.13339--

--===============0774341931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0774341931==--
