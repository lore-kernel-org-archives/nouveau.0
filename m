From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91632] Assert in nouveau_pushbuf_data
Date: Tue, 28 Jun 2016 16:03:30 +0000
Message-ID: <bug-91632-8800-bBiNklEwyb@http.bugs.freedesktop.org/>
References: <bug-91632-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1413478910=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91632-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1413478910==
Content-Type: multipart/alternative; boundary="14671298100.a7dd6.23200";
 charset="UTF-8"


--14671298100.a7dd6.23200
Date: Tue, 28 Jun 2016 16:03:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91632

--- Comment #4 from Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

any news on this issue ?

I'm running quite fresh system (OpenMandriva Lx 3.0) with:
Qt 5.6.1
Mesa 12.0-rc4
libdrm 2.4.68
kernel 4.62

gfx card nv92

and Qupzilla 2.01 crashes for me with this error=20


[tpg@lazur ~]$ LC_ALL=3DC qupzilla
QupZilla: 0 extensions loaded
Uncaught TypeError: Cannot read property 'restoreData' of null
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch10: krec 0 pushes 0 bufs 1 relocs 0
nouveau: ch10: buf 00000000 00000002 00000004 00000004 00000000
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch10: krec 0 pushes 0 bufs 1 relocs 0
nouveau: ch10: buf 00000000 00000002 00000004 00000004 00000000
ATTENTION: default value of option force_s3tc_enable overridden by environm=
ent.
QupZilla: Starting with profile 'default'
QupZilla: 0 extensions loaded
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch11: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch11: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch11: buf 00000001 00000006 00000004 00000000 00000004
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch11: krec 0 pushes 0 bufs 1 relocs 0
nouveau: ch11: buf 00000000 00000002 00000004 00000004 00000000
qupzilla: pushbuf.c:727: void nouveau_pushbuf_data(struct nouveau_pushbuf *,
struct nouveau_bo *, uint64_t, uint64_t): Warunek zapewnienia `kref' nie zo=
sta=C5=82
spe=C5=82niony.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14671298100.a7dd6.23200
Date: Tue, 28 Jun 2016 16:03:30 +0000
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
   title=3D"NEW - Assert in nouveau_pushbuf_data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91632#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Assert in nouveau_pushbuf_data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91632">bug 91632<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tpgxyz&#64;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.=
com&gt;"> <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span></b>
        <pre>Hi,

any news on this issue ?

I'm running quite fresh system (OpenMandriva Lx 3.0) with:
Qt 5.6.1
Mesa 12.0-rc4
libdrm 2.4.68
kernel 4.62

gfx card nv92

and Qupzilla 2.01 crashes for me with this error=20


[tpg&#64;lazur ~]$ LC_ALL=3DC qupzilla
QupZilla: 0 extensions loaded
Uncaught TypeError: Cannot read property 'restoreData' of null
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch10: krec 0 pushes 0 bufs 1 relocs 0
nouveau: ch10: buf 00000000 00000002 00000004 00000004 00000000
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch10: krec 0 pushes 0 bufs 1 relocs 0
nouveau: ch10: buf 00000000 00000002 00000004 00000004 00000000
ATTENTION: default value of option force_s3tc_enable overridden by environm=
ent.
QupZilla: Starting with profile 'default'
QupZilla: 0 extensions loaded
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch11: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch11: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch11: buf 00000001 00000006 00000004 00000000 00000004
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch11: krec 0 pushes 0 bufs 1 relocs 0
nouveau: ch11: buf 00000000 00000002 00000004 00000004 00000000
qupzilla: pushbuf.c:727: void nouveau_pushbuf_data(struct nouveau_pushbuf *,
struct nouveau_bo *, uint64_t, uint64_t): Warunek zapewnienia `kref' nie zo=
sta=C5=82
spe=C5=82niony.</pre>
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

--14671298100.a7dd6.23200--

--===============1413478910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1413478910==--
