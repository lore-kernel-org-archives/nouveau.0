From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Sat, 14 Feb 2015 18:56:40 +0000
Message-ID: <bug-87819-8800-jOfUlrrtc7@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0637493198=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0637493198==
Content-Type: multipart/alternative; boundary="1423940200.03B57De82.21144"; charset="UTF-8"


--1423940200.03B57De82.21144
Date: Sat, 14 Feb 2015 18:56:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87819

--- Comment #15 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Stuart Longland from comment #13)
> I'll run it up the flagpole and see who salutes=E2=80=A6 Out of interest =
how much of
> current 'nouveau' HEAD is in the mainline kernel at present?

Up to tag 3.19 of this repository:
http://cgit.freedesktop.org/~darktama/nouveau/.


(In reply to Stuart Longland from comment #14)
> I cannot get this to build:
>=20
> RC=3D0 stuartl@vk4msl-mb /usr/src/linux-2.6-stable $ make menuconfig
> make: *** No rule to make target `menuconfig'.  Stop.
> RC=3D2 stuartl@vk4msl-mb /usr/src/linux-2.6-stable $ git describe
> fatal: No tags can describe 'e616d549c78c27b6b4d4da25a2369b32bb2a99db'.
> Try --always, or create some tags.
> RC=3D128 stuartl@vk4msl-mb /usr/src/linux-2.6-stable $ git log -1 | cat
> commit e616d549c78c27b6b4d4da25a2369b32bb2a99db
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Fri Feb 6 09:36:12 2015 +1000
>=20
>     lib: fix drm backend

I guess you're trying to compile Ben's repository
(http://cgit.freedesktop.org/~darktama/nouveau/)? If that's the case, it is=
 an
out-of-tree repository, so you still need "regular" kernel sources.
To compile it, go to the drm/ directory and execute just a make - it will t=
ry
to find where the sources are for the kernel you're actually running, or you
can override this by setting the env variable LINUXDIR. This will only comp=
ile
the nouveau.ko module, which you will then find at drm/nouveau/nouveau.ko.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1423940200.03B57De82.21144
Date: Sat, 14 Feb 2015 18:56:40 +0000
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
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819">bug 87819<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Stuart Longland from <a href=3D"show_bug.cgi?id=
=3D87819#c13">comment #13</a>)
<span class=3D"quote">&gt; I'll run it up the flagpole and see who salutes=
=E2=80=A6 Out of interest how much of
&gt; current 'nouveau' HEAD is in the mainline kernel at present?</span >

Up to tag 3.19 of this repository:
<a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.free=
desktop.org/~darktama/nouveau/</a>.


(In reply to Stuart Longland from <a href=3D"show_bug.cgi?id=3D87819#c14">c=
omment #14</a>)
<span class=3D"quote">&gt; I cannot get this to build:
&gt;=20
&gt; RC=3D0 stuartl&#64;vk4msl-mb /usr/src/linux-2.6-stable $ make menuconf=
ig
&gt; make: *** No rule to make target `menuconfig'.  Stop.
&gt; RC=3D2 stuartl&#64;vk4msl-mb /usr/src/linux-2.6-stable $ git describe
&gt; fatal: No tags can describe 'e616d549c78c27b6b4d4da25a2369b32bb2a99db'.
&gt; Try --always, or create some tags.
&gt; RC=3D128 stuartl&#64;vk4msl-mb /usr/src/linux-2.6-stable $ git log -1 =
| cat
&gt; commit e616d549c78c27b6b4d4da25a2369b32bb2a99db
&gt; Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeg=
gs&#64;redhat.com</a>&gt;
&gt; Date:   Fri Feb 6 09:36:12 2015 +1000
&gt;=20
&gt;     lib: fix drm backend</span >

I guess you're trying to compile Ben's repository
(<a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.fre=
edesktop.org/~darktama/nouveau/</a>)? If that's the case, it is an
out-of-tree repository, so you still need &quot;regular&quot; kernel source=
s.
To compile it, go to the drm/ directory and execute just a make - it will t=
ry
to find where the sources are for the kernel you're actually running, or you
can override this by setting the env variable LINUXDIR. This will only comp=
ile
the nouveau.ko module, which you will then find at drm/nouveau/nouveau.ko.<=
/pre>
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

--1423940200.03B57De82.21144--

--===============0637493198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0637493198==--
