From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98690] [nouveau bisected] System freeze when
 starting X using kernel 4.9-rc1 or later
Date: Sun, 30 Jul 2017 04:14:25 +0000
Message-ID: <bug-98690-8800-I2eEO4UUYm@http.bugs.freedesktop.org/>
References: <bug-98690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1877343151=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1877343151==
Content-Type: multipart/alternative; boundary="15013880654.6C7Ae.15809";
 charset="UTF-8"


--15013880654.6C7Ae.15809
Date: Sun, 30 Jul 2017 04:14:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98690

--- Comment #77 from Gleb Nemshilov <gleb-97jfqw80gc5Wk0Htik3J/w@public.gmane.org> ---
Hi Peter and everyone!

I've seen that the latest patch which solves the issue was merged to 4.12 a=
nd
4.9, but the initial fix with 1s delay is still in the tree. Will this also=
 be
resolved? It looks like the previous patch can be reverted as the proper fi=
x is
now available.

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_probe_hel=
per.c#L246

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15013880654.6C7Ae.15809
Date: Sun, 30 Jul 2017 04:14:25 +0000
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
   title=3D"NEW - [nouveau bisected] System freeze when starting X using ke=
rnel 4.9-rc1 or later"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98690#c77">Commen=
t # 77</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau bisected] System freeze when starting X using ke=
rnel 4.9-rc1 or later"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98690">bug 98690<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gleb&#64;fastmail.com" title=3D"Gleb Nemshilov &lt;gleb&#64;fastmail.com&gt=
;"> <span class=3D"fn">Gleb Nemshilov</span></a>
</span></b>
        <pre>Hi Peter and everyone!

I've seen that the latest patch which solves the issue was merged to 4.12 a=
nd
4.9, but the initial fix with 1s delay is still in the tree. Will this also=
 be
resolved? It looks like the previous patch can be reverted as the proper fi=
x is
now available.

<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/dr=
m_probe_helper.c#L246">https://github.com/torvalds/linux/blob/master/driver=
s/gpu/drm/drm_probe_helper.c#L246</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15013880654.6C7Ae.15809--

--===============1877343151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1877343151==--
