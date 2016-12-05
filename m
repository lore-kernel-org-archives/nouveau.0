From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98852] Nvidia graphics card fan not running or to
 slow, danger of overheating
Date: Mon, 05 Dec 2016 10:23:59 +0000
Message-ID: <bug-98852-8800-IUMbze34rk@http.bugs.freedesktop.org/>
References: <bug-98852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412113381=="
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


--===============1412113381==
Content-Type: multipart/alternative; boundary="14809334390.EDAB5.3859";
 charset="UTF-8"


--14809334390.EDAB5.3859
Date: Mon, 5 Dec 2016 10:23:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98852

--- Comment #12 from Egon Niessner <susebugzilla-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
I did some further tests with setting of the boot time parameter
in the yast kernel parameter line.

Also with=20

nouveau.runpm=3D0  or
nouveau.runpm=3D1=20=20
the fan on the graphic card does not start.

Beside this I use for PC tests also the systemrescue-Distribution
where DVD images can be found on=20
http://www.system-rescue-cd.org/Download

I observed that until version 4.6.1 the fan on the graphic card was running.
Starting with version 4.7.1 the fan stops after loading of the rescue syste=
m.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14809334390.EDAB5.3859
Date: Mon, 5 Dec 2016 10:23:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852">bug 98852<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
susebugzilla&#64;online.de" title=3D"Egon Niessner &lt;susebugzilla&#64;onl=
ine.de&gt;"> <span class=3D"fn">Egon Niessner</span></a>
</span></b>
        <pre>I did some further tests with setting of the boot time paramet=
er
in the yast kernel parameter line.

Also with=20

nouveau.runpm=3D0  or
nouveau.runpm=3D1=20=20
the fan on the graphic card does not start.

Beside this I use for PC tests also the systemrescue-Distribution
where DVD images can be found on=20
<a href=3D"http://www.system-rescue-cd.org/Download">http://www.system-resc=
ue-cd.org/Download</a>

I observed that until version 4.6.1 the fan on the graphic card was running.
Starting with version 4.7.1 the fan stops after loading of the rescue syste=
m.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14809334390.EDAB5.3859--

--===============1412113381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1412113381==--
