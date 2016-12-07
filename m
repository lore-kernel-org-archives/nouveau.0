From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98852] Nvidia graphics card fan not running or to
 slow, danger of overheating
Date: Wed, 07 Dec 2016 04:43:59 +0000
Message-ID: <bug-98852-8800-T6McHwMMky@http.bugs.freedesktop.org/>
References: <bug-98852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1340175836=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98852-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1340175836==
Content-Type: multipart/alternative; boundary="14810858382.DB1Ffda.14833";
 charset="UTF-8"


--14810858382.DB1Ffda.14833
Date: Wed, 7 Dec 2016 04:43:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98852

--- Comment #13 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to Egon Niessner from comment #12)
> I did some further tests with setting of the boot time parameter
> in the yast kernel parameter line.
>=20
> Also with=20
>=20=20
> nouveau.runpm=3D0  or
> nouveau.runpm=3D1=20=20
> the fan on the graphic card does not start.
>=20
> Beside this I use for PC tests also the systemrescue-Distribution
> where DVD images can be found on=20
> http://www.system-rescue-cd.org/Download
>=20
> I observed that until version 4.6.1 the fan on the graphic card was runni=
ng.
> Starting with version 4.7.1 the fan stops after loading of the rescue sys=
tem.

This is really weird as there are no changes related to the fan between 4.6=
 and
4.7 :s

I guess, at this point, we need to check out what nouveau is doing versus w=
hat
the blob is doing.

Please download and compile envytools[0] and run the following command when
running Nouveau, then when using the proprietary driver:
 - nvapeek e114 10

Please report back.

[0] https://github.com/envytools/envytools/commits/master

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14810858382.DB1Ffda.14833
Date: Wed, 7 Dec 2016 04:43:58 +0000
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
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852">bug 98852<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to Egon Niessner from <a href=3D"show_bug.cgi?id=3D9=
8852#c12">comment #12</a>)
<span class=3D"quote">&gt; I did some further tests with setting of the boo=
t time parameter
&gt; in the yast kernel parameter line.
&gt;=20
&gt; Also with=20
&gt;=20=20
&gt; nouveau.runpm=3D0  or
&gt; nouveau.runpm=3D1=20=20
&gt; the fan on the graphic card does not start.
&gt;=20
&gt; Beside this I use for PC tests also the systemrescue-Distribution
&gt; where DVD images can be found on=20
&gt; <a href=3D"http://www.system-rescue-cd.org/Download">http://www.system=
-rescue-cd.org/Download</a>
&gt;=20
&gt; I observed that until version 4.6.1 the fan on the graphic card was ru=
nning.
&gt; Starting with version 4.7.1 the fan stops after loading of the rescue =
system.</span >

This is really weird as there are no changes related to the fan between 4.6=
 and
4.7 :s

I guess, at this point, we need to check out what nouveau is doing versus w=
hat
the blob is doing.

Please download and compile envytools[0] and run the following command when
running Nouveau, then when using the proprietary driver:
 - nvapeek e114 10

Please report back.

[0] <a href=3D"https://github.com/envytools/envytools/commits/master">https=
://github.com/envytools/envytools/commits/master</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14810858382.DB1Ffda.14833--

--===============1340175836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1340175836==--
