From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84706] [NV94] HDMI Connected,
	but TV reports "no signal"
Date: Tue, 07 Oct 2014 14:27:38 +0000
Message-ID: <bug-84706-8800-pzKfPdU2SS@http.bugs.freedesktop.org/>
References: <bug-84706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0958515704=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0958515704==
Content-Type: multipart/alternative; boundary="1412692058.dcC251.3484"; charset="UTF-8"


--1412692058.dcC251.3484
Date: Tue, 7 Oct 2014 14:27:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D84706

--- Comment #5 from Jay van Dam <jayvandam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thank you for explaining about the different chips and pointing out I do ha=
ve a
G94, always the marketing scams... :)=20

I tried kernel 3.17, 3.7 and 3.2 but none of them showed any different
behavior, all the time the tv shows =E2=80=9Cno signal=E2=80=9D.

As I am using BTRFS as my primary filesystem and kernel 3.2 isn=E2=80=99t w=
orking with
the latest version of BTRFS, on a separate disk I reinstalled my system wit=
h an
EXT4 filesystem to try the 3.2 kernel.

The installation of Arch Linux works with a Live CD, I inserted the CD wire=
d up
the HDMI port and start installing. Half way the installation I actually
realized I was using the HDMI port and the display was still working proper=
ly
after the bootloader screen. Out of curiousity I checked what graphics driv=
er
was loaded and it was in fact the nouveau driver. I've added the kernel log=
 and
vbios from the live CD, it couldn't find any differences thought...

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1412692058.dcC251.3484
Date: Tue, 7 Oct 2014 14:27:38 +0000
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
   title=3D"NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quo=
t;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D84706#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quo=
t;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D84706">bug 84706<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jayvandam&#64;gmail.com" title=3D"Jay van Dam &lt;jayvandam&#64;gmail.com&g=
t;"> <span class=3D"fn">Jay van Dam</span></a>
</span></b>
        <pre>Thank you for explaining about the different chips and pointin=
g out I do have a
G94, always the marketing scams... :)=20

I tried kernel 3.17, 3.7 and 3.2 but none of them showed any different
behavior, all the time the tv shows =E2=80=9Cno signal=E2=80=9D.

As I am using BTRFS as my primary filesystem and kernel 3.2 isn=E2=80=99t w=
orking with
the latest version of BTRFS, on a separate disk I reinstalled my system wit=
h an
EXT4 filesystem to try the 3.2 kernel.

The installation of Arch Linux works with a Live CD, I inserted the CD wire=
d up
the HDMI port and start installing. Half way the installation I actually
realized I was using the HDMI port and the display was still working proper=
ly
after the bootloader screen. Out of curiousity I checked what graphics driv=
er
was loaded and it was in fact the nouveau driver. I've added the kernel log=
 and
vbios from the live CD, it couldn't find any differences thought...</pre>
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

--1412692058.dcC251.3484--

--===============0958515704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0958515704==--
