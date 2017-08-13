From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102106] xorg crashes when running gscan2pdf
 (libgtk2-perl) test case
Date: Sun, 13 Aug 2017 21:36:37 +0000
Message-ID: <bug-102106-8800-1sStvHUPz9@http.bugs.freedesktop.org/>
References: <bug-102106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1924937726=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1924937726==
Content-Type: multipart/alternative; boundary="15026601971.B1Bec.3590";
 charset="UTF-8"


--15026601971.B1Bec.3590
Date: Sun, 13 Aug 2017 21:36:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102106

--- Comment #9 from jffry-VwIFZPTo/vqsTnJN9+BGXg@public.gmane.org ---
I use lightdm. I booted the machine, but didn't log in.

I logged in from another machine via ssh:

$ ps -efl | grep org
4 S root      7814   570  0  80   0 - 96782 -      22:24 tty7     00:00:00
/usr/lib/xorg/Xorg :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten =
tcp
vt7 -novtswitch

ssh had evidently started X, although I didn't use -X or -Y.

$ export DISPLAY=3D:0
$ PERL5LIB=3D"blib:blib/arch:lib:$PERL5LIB" perl t/124_cancel_save_djvu.t=20
1..1
Invalid MIT-MAGIC-COOKIE-1 keyGtk-WARNING **: cannot open display: :0 at
/usr/lib/x86_64-linux-gnu/perl5/5.26/Gtk2.pm line 126.

$ Xorg :0
/usr/lib/xorg/Xorg.wrap: Only console users are allowed to run the X server

$ sudo Xorg :0
(EE)=20
Fatal server error:
(EE) Server is already active for display 0
        If this server is no longer running, remove /tmp/.X0-lock
        and start again.
(EE)=20
(EE)=20
Please consult the The X.Org Foundation support=20
         at http://wiki.x.org
 for help.=20
(EE)=20

When I tried to log in with ssh -Y, the Perl test crashed and took out the =
ssh
connection. $DISPLAY was set to localhost:10, which I assume means that nou=
veau
is not the culprit.

How do I start the machine and not start X? Do I just kill X with -9, before
starting it again. Isn't that what I had at the first attempt? If so, why c=
ould
I not connect to it?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15026601971.B1Bec.3590
Date: Sun, 13 Aug 2017 21:36:37 +0000
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
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106">bug 10210=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jffry&#64;posteo.net" title=3D"jffry&#64;posteo.net">jffry&#64;posteo.net</=
a>
</span></b>
        <pre>I use lightdm. I booted the machine, but didn't log in.

I logged in from another machine via ssh:

$ ps -efl | grep org
4 S root      7814   570  0  80   0 - 96782 -      22:24 tty7     00:00:00
/usr/lib/xorg/Xorg :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten =
tcp
vt7 -novtswitch

ssh had evidently started X, although I didn't use -X or -Y.

$ export DISPLAY=3D:0
$ PERL5LIB=3D&quot;blib:blib/arch:lib:$PERL5LIB&quot; perl t/124_cancel_sav=
e_djvu.t=20
1..1
Invalid MIT-MAGIC-COOKIE-1 keyGtk-WARNING **: cannot open display: :0 at
/usr/lib/x86_64-linux-gnu/perl5/5.26/Gtk2.pm line 126.

$ Xorg :0
/usr/lib/xorg/Xorg.wrap: Only console users are allowed to run the X server

$ sudo Xorg :0
(EE)=20
Fatal server error:
(EE) Server is already active for display 0
        If this server is no longer running, remove /tmp/.X0-lock
        and start again.
(EE)=20
(EE)=20
Please consult the The X.Org Foundation support=20
         at <a href=3D"http://wiki.x.org">http://wiki.x.org</a>
 for help.=20
(EE)=20

When I tried to log in with ssh -Y, the Perl test crashed and took out the =
ssh
connection. $DISPLAY was set to localhost:10, which I assume means that nou=
veau
is not the culprit.

How do I start the machine and not start X? Do I just kill X with -9, before
starting it again. Isn't that what I had at the first attempt? If so, why c=
ould
I not connect to it?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15026601971.B1Bec.3590--

--===============1924937726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1924937726==--
