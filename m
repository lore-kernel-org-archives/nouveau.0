From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Mon, 03 Feb 2014 10:14:36 +0000
Message-ID: <bug-72180-8800-jSKRs4RErV@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2033868555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2033868555==
Content-Type: multipart/alternative; boundary="1391422475.3fCba1FD4.12524"; charset="us-ascii"


--1391422475.3fCba1FD4.12524
Date: Mon, 3 Feb 2014 10:14:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D72180

--- Comment #27 from Dainius Masili=C5=ABnas <pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
For me, using the firmware attached is a bit hit-and-miss. Sometimes it wor=
ks
fine, but most of the time I get a lockup just as soon as KDE starts, while=
 the
KDE boot animation is playing. The logs have nothing unusual in them, the o=
nly
line that shows something is this in dmesg:

  nouveau E[     DRM] GPU lockup - switching to software fbcon

The Xorg log shows that everything is fine, and there are no further messag=
es.
I can switch to another console or kill the X server when that happens (but
logging in again results in a lockup). Pretty odd.

I'll try extracting the firmware myself (although I do use a GTX 660 as wel=
l)
and see if that helps.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1391422475.3fCba1FD4.12524
Date: Mon, 3 Feb 2014 10:14:35 +0000
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
   title=3D"NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72180#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72180">bug 72180<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pastas4&#64;gmail.com" title=3D"Dainius Masili=C5=ABnas &lt;pastas4&#64;gma=
il.com&gt;"> <span class=3D"fn">Dainius Masili=C5=ABnas</span></a>
</span></b>
        <pre>For me, using the firmware attached is a bit hit-and-miss. Som=
etimes it works
fine, but most of the time I get a lockup just as soon as KDE starts, while=
 the
KDE boot animation is playing. The logs have nothing unusual in them, the o=
nly
line that shows something is this in dmesg:

  nouveau E[     DRM] GPU lockup - switching to software fbcon

The Xorg log shows that everything is fine, and there are no further messag=
es.
I can switch to another console or kill the X server when that happens (but
logging in again results in a lockup). Pretty odd.

I'll try extracting the firmware myself (although I do use a GTX 660 as wel=
l)
and see if that helps.</pre>
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

--1391422475.3fCba1FD4.12524--

--===============2033868555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2033868555==--
