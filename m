From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98630] Bad color and glitches on PPC64
Date: Mon, 07 Nov 2016 20:42:14 +0000
Message-ID: <bug-98630-8800-dMBQt7U0UK@http.bugs.freedesktop.org/>
References: <bug-98630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0474846095=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0474846095==
Content-Type: multipart/alternative; boundary="14785513340.bFc7F.15254";
 charset="UTF-8"


--14785513340.bFc7F.15254
Date: Mon, 7 Nov 2016 20:42:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98630

--- Comment #9 from Mingcong Bai <jeffbai-ymACFijhrKM@public.gmane.org> ---
> Oh interesting. That means the confusion is in the DDX. (Or disagreement
> between mesa and the DDX.) Please confirm that you're running a semi-rece=
nt
> version of xf86-video-nouveau (e.g. 1.0.12), and actually verify that it
> says NOUVEAU(0) in your xorg log.

Definitely...

[ 18082.072] (II) AIGLX: Suspending AIGLX clients for VT switch
[ 18082.072] (II) NOUVEAU(0): NVLeaveVT is called.
[ 18609.555] (II) AIGLX: Resuming AIGLX clients after VT switch
[ 18609.555] (II) NOUVEAU(0): NVEnterVT is called.
[ 18609.588] (II) NOUVEAU(0): EDID vendor "DEL", prod id 41112
[ 18609.588] (II) NOUVEAU(0): Using hsync ranges from config file
[ 18609.588] (II) NOUVEAU(0): Using vrefresh ranges from config file
[ 18609.588] (II) NOUVEAU(0): Printing DDC gathered Modelines:

And yes, it should be the newest version available:

jeffbai@G5-AOSC [ ~ ] $ dpkg -s xf86-video-nouveau=20
Package: xf86-video-nouveau
Status: install ok installed
Section: x11
Installed-Size: 364
Maintainer: Everette Rong <l.e.r-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Architecture: ppc64
Version: 1.0.12
Depends: xorg-server (>=3D 1.18.4), libdrm (>=3D 2.4.70), systemd (>=3D 1:2=
31-2)
Description: XF86 driver for NVIDIA graphics cards

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14785513340.bFc7F.15254
Date: Mon, 7 Nov 2016 20:42:14 +0000
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
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630">bug 98630<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeffbai&#64;aosc.xyz" title=3D"Mingcong Bai &lt;jeffbai&#64;aosc.xyz&gt;"> =
<span class=3D"fn">Mingcong Bai</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Oh interesting. That means the conf=
usion is in the DDX. (Or disagreement
&gt; between mesa and the DDX.) Please confirm that you're running a semi-r=
ecent
&gt; version of xf86-video-nouveau (e.g. 1.0.12), and actually verify that =
it
&gt; says NOUVEAU(0) in your xorg log.</span >

Definitely...

[ 18082.072] (II) AIGLX: Suspending AIGLX clients for VT switch
[ 18082.072] (II) NOUVEAU(0): NVLeaveVT is called.
[ 18609.555] (II) AIGLX: Resuming AIGLX clients after VT switch
[ 18609.555] (II) NOUVEAU(0): NVEnterVT is called.
[ 18609.588] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 41112
[ 18609.588] (II) NOUVEAU(0): Using hsync ranges from config file
[ 18609.588] (II) NOUVEAU(0): Using vrefresh ranges from config file
[ 18609.588] (II) NOUVEAU(0): Printing DDC gathered Modelines:

And yes, it should be the newest version available:

jeffbai&#64;G5-AOSC [ ~ ] $ dpkg -s xf86-video-nouveau=20
Package: xf86-video-nouveau
Status: install ok installed
Section: x11
Installed-Size: 364
Maintainer: Everette Rong &lt;<a href=3D"mailto:l.e.r&#64;riseup.net">l.e.r=
&#64;riseup.net</a>&gt;
Architecture: ppc64
Version: 1.0.12
Depends: xorg-server (&gt;=3D 1.18.4), libdrm (&gt;=3D 2.4.70), systemd (&g=
t;=3D 1:231-2)
Description: XF86 driver for NVIDIA graphics cards</pre>
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

--14785513340.bFc7F.15254--

--===============0474846095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0474846095==--
