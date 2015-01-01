From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Thu, 01 Jan 2015 21:40:09 +0000
Message-ID: <bug-70354-8800-GyaIbwkmmI@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1567449833=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1567449833==
Content-Type: multipart/alternative; boundary="1420148410.fcad5.30009"; charset="UTF-8"


--1420148410.fcad5.30009
Date: Thu, 1 Jan 2015 21:40:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #34 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
Per bug 87942, it seems I=E2=80=99m affected too (Dell XPS 9530, GT750M).

And rcutree.rcu_idle_gp_delay=3D1 doesn=E2=80=99t fix this for me, I=E2=80=
=99m running with this
for a while because nvidia needs it, but it doesn=E2=80=99t change anything=
 for
nouveau.

Is Ben=E2=80=99s patch still working for everyone here (I have not tested i=
t myself,
since I=E2=80=99m not sure on how to do so), and if so is there a chance it=
 will land
somewhere in the future?

Or is there another solution to try?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420148410.fcad5.30009
Date: Thu, 1 Jan 2015 21:40:10 +0000
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
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c34">Commen=
t # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>Per <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"show_bug.cgi?id=3D87942">bug 87942</a>, it seems I=E2=80=99m aff=
ected too (Dell XPS 9530, GT750M).

And rcutree.rcu_idle_gp_delay=3D1 doesn=E2=80=99t fix this for me, I=E2=80=
=99m running with this
for a while because nvidia needs it, but it doesn=E2=80=99t change anything=
 for
nouveau.

Is Ben=E2=80=99s patch still working for everyone here (I have not tested i=
t myself,
since I=E2=80=99m not sure on how to do so), and if so is there a chance it=
 will land
somewhere in the future?

Or is there another solution to try?</pre>
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

--1420148410.fcad5.30009--

--===============1567449833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1567449833==--
