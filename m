From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94727] [NV30/NV40] nouveau/pushbuf.c:238:
 pushbuf_krel: Assertion `bkref` failed.
Date: Thu, 08 Dec 2016 10:37:39 +0000
Message-ID: <bug-94727-8800-MVUWqSHHHc@http.bugs.freedesktop.org/>
References: <bug-94727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1814553189=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1814553189==
Content-Type: multipart/alternative; boundary="14811934590.8DaeAe.20453";
 charset="UTF-8"


--14811934590.8DaeAe.20453
Date: Thu, 8 Dec 2016 10:37:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94727

--- Comment #10 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #7)
> [...] If you can send me an apitrace I can replay to cause this to happen,
> I can investigate [and the NV34 doesn't support as much stuff as a NV4x,
> but I can fake it]. [...]

Ah! I managed to reproduce with apitrace \o/

   Xwayland: pushbuf.c:238: pushbuf_krel: Assertion `bkref' failed.
   apitrace: warning: caught signal 6
   apitrace: flushing trace due to an exception
   /usr/bin/../lib64/apitrace/wrappers/glxtrace.so+0x224c8c
   [...]
   apitrace: info: taking default action for signal 6

The capture is there:

https://people.freedesktop.org/~ofourdan/xwayland-apitrace.bz2

Please let me know if that helps!

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14811934590.8DaeAe.20453
Date: Thu, 8 Dec 2016 10:37:39 +0000
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
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727">bug 94727<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D947=
27#c7">comment #7</a>)
<span class=3D"quote">&gt; [...] If you can send me an apitrace I can repla=
y to cause this to happen,
&gt; I can investigate [and the NV34 doesn't support as much stuff as a NV4=
x,
&gt; but I can fake it]. [...]</span >

Ah! I managed to reproduce with apitrace \o/

   Xwayland: pushbuf.c:238: pushbuf_krel: Assertion `bkref' failed.
   apitrace: warning: caught signal 6
   apitrace: flushing trace due to an exception
   /usr/bin/../lib64/apitrace/wrappers/glxtrace.so+0x224c8c
   [...]
   apitrace: info: taking default action for signal 6

The capture is there:

<a href=3D"https://people.freedesktop.org/~ofourdan/xwayland-apitrace.bz2">=
https://people.freedesktop.org/~ofourdan/xwayland-apitrace.bz2</a>

Please let me know if that helps!</pre>
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

--14811934590.8DaeAe.20453--

--===============1814553189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1814553189==--
