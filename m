From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56196] Geforce GTX 580 unable to boot w/ nouveau,
 but works with nvidia proprietary (tested in Arch Linux, Ubuntu, Linux Mint)
Date: Fri, 20 Sep 2013 22:08:37 +0000
Message-ID: <bug-56196-8800-TRbmqyO9Gg@http.bugs.freedesktop.org/>
References: <bug-56196-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1336248100=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56196-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1336248100==
Content-Type: multipart/alternative; boundary="1379714917.b3Fc0e2.26742"; charset="us-ascii"


--1379714917.b3Fc0e2.26742
Date: Fri, 20 Sep 2013 22:08:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D56196

--- Comment #2 from register-juKALW551V8@public.gmane.org ---
I also have a problem with my GTX 580 and the Nouveau driver.

It goes like this: Booting into the system (Live cd or fresh install, Ubunt=
u or
Linux Mint or any other distribution with that driver, doesn't matter) and
after about 30-90 seconds it starts to slow down and finally freeze.

Sometimes the mouse is still moveable but the whole system is frozen. Only a
hard reset is possible at that time.

On the same PC I used older versions of Ubuntu, Xubuntu, Kubuntu, Debian, =
=E2=80=A6
without any problem. This bug is "new" (I must admit, I didn't use Linux for
about year on this PC).

The proprietary NVIDIA driver works flawlessly, if you manage to install it
(Over the console of course, tried it once with XORG and it froze mid
installation, no fun at all).

Question is: How do I get the kernel log for you? My Ubuntu installation ru=
ns
fine with the proprietary driver and when I start with a Live CD it freezes
very fast. That's a bit problematic.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1379714917.b3Fc0e2.26742
Date: Fri, 20 Sep 2013 22:08:37 +0000
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
   title=3D"NEW --- - Geforce GTX 580 unable to boot w/ nouveau, but works =
with nvidia proprietary (tested in Arch Linux, Ubuntu, Linux Mint)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D56196#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Geforce GTX 580 unable to boot w/ nouveau, but works =
with nvidia proprietary (tested in Arch Linux, Ubuntu, Linux Mint)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D56196">bug 56196<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
register&#64;vlyn.at" title=3D"register&#64;vlyn.at">register&#64;vlyn.at</=
a>
</span></b>
        <pre>I also have a problem with my GTX 580 and the Nouveau driver.

It goes like this: Booting into the system (Live cd or fresh install, Ubunt=
u or
Linux Mint or any other distribution with that driver, doesn't matter) and
after about 30-90 seconds it starts to slow down and finally freeze.

Sometimes the mouse is still moveable but the whole system is frozen. Only a
hard reset is possible at that time.

On the same PC I used older versions of Ubuntu, Xubuntu, Kubuntu, Debian, =
=E2=80=A6
without any problem. This bug is &quot;new&quot; (I must admit, I didn't us=
e Linux for
about year on this PC).

The proprietary NVIDIA driver works flawlessly, if you manage to install it
(Over the console of course, tried it once with XORG and it froze mid
installation, no fun at all).

Question is: How do I get the kernel log for you? My Ubuntu installation ru=
ns
fine with the proprietary driver and when I start with a Live CD it freezes
very fast. That's a bit problematic.</pre>
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

--1379714917.b3Fc0e2.26742--

--===============1336248100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1336248100==--
