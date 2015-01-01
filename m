From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 19:40:56 +0000
Message-ID: <bug-87942-8800-ciJY5yDN7F@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929052038=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87942-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1929052038==
Content-Type: multipart/alternative; boundary="1420141256.6b03ea1.22518"; charset="UTF-8"


--1420141256.6b03ea1.22518
Date: Thu, 1 Jan 2015 19:40:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #8 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
(In reply to Ilia Mirkin from comment #7)
> This means you're not going to get acceleration no matter how hard you try
> to change your config, I'm afraid. See bug 70354.
>

So in fact PRIME would not be working either?

> X has to start after nouveau loads, otherwise it doesn't know about the
> nouveau adapter. (This may no longer be the case with DRI3-based offloadi=
ng
> actually...)

Then, is there a way to force nouveau to load at boot, and else, is restart=
ing
X after loading nouveau supposed to work (for the record, tried that, and it
doesn=E2=80=99t work either, but I=E2=80=99m not sure if it is supposed to =
work since it looks
like I=E2=80=99m indeed affected by the issue you=E2=80=99ve linked).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420141256.6b03ea1.22518
Date: Thu, 1 Jan 2015 19:40:56 +0000
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
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D879=
42#c7">comment #7</a>)
<span class=3D"quote">&gt; This means you're not going to get acceleration =
no matter how hard you try
&gt; to change your config, I'm afraid. See <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"show_bug.cgi?id=3D70354">bug 70354</a>.</span >
&gt;

So in fact PRIME would not be working either?

<span class=3D"quote">&gt; X has to start after nouveau loads, otherwise it=
 doesn't know about the
&gt; nouveau adapter. (This may no longer be the case with DRI3-based offlo=
ading
&gt; actually...)</span >

Then, is there a way to force nouveau to load at boot, and else, is restart=
ing
X after loading nouveau supposed to work (for the record, tried that, and it
doesn=E2=80=99t work either, but I=E2=80=99m not sure if it is supposed to =
work since it looks
like I=E2=80=99m indeed affected by the issue you=E2=80=99ve linked).</pre>
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

--1420141256.6b03ea1.22518--

--===============1929052038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1929052038==--
