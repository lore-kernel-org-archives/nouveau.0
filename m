From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108982] GM206: MMIO write of 800000ec FAULT at
 10eb14 [ IBUS ]
Date: Sat, 08 Dec 2018 17:20:31 +0000
Message-ID: <bug-108982-8800-ssuDlzkkPc@http.bugs.freedesktop.org/>
References: <bug-108982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737451775=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108982-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1737451775==
Content-Type: multipart/alternative; boundary="15442896311.CD8eE9a09.13398"
Content-Transfer-Encoding: 7bit


--15442896311.CD8eE9a09.13398
Date: Sat, 8 Dec 2018 17:20:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108982

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Interesting. The only write I see to that register is in the GM107 fan cont=
rol
logic. This is not used for GM200+, as controlling the fan can't be done
anymore, except via secure firmware means.

So ... my *guess* is that this is a write failure that happens as a result =
of
the firmware that gets loaded, which is not supplied by nouveau. (Always
preferable to blame someone else...)

Can you get a dmesg with nouveau.debug=3Dtrace which should place that erro=
r more
exactly in the initialization flow.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15442896311.CD8eE9a09.13398
Date: Sat, 8 Dec 2018 17:20:31 +0000
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
   title=3D"NEW - GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108982#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108982">bug 10898=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Interesting. The only write I see to that register is in the G=
M107 fan control
logic. This is not used for GM200+, as controlling the fan can't be done
anymore, except via secure firmware means.

So ... my *guess* is that this is a write failure that happens as a result =
of
the firmware that gets loaded, which is not supplied by nouveau. (Always
preferable to blame someone else...)

Can you get a dmesg with nouveau.debug=3Dtrace which should place that erro=
r more
exactly in the initialization flow.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15442896311.CD8eE9a09.13398--

--===============1737451775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1737451775==--
