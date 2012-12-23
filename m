From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55258] nouveau failure on resume (reloc wait_idle
	failed)
Date: Sun, 23 Dec 2012 21:55:08 +0000
Message-ID: <bug-55258-8800-U8kfqyfEz7@http.bugs.freedesktop.org/>
References: <bug-55258-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1826461231=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55258-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1826461231==
Content-Type: multipart/alternative; boundary="1356299708.03AFEcF22.1321"; charset="us-ascii"


--1356299708.03AFEcF22.1321
Date: Sun, 23 Dec 2012 21:55:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D55258

Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Happens here, using a NV34 [GeForce FX 5200] on AMD64
suspend works, hibernate works using the console (but didn't try several
attempts yet).
But when hibernate resumes X is a bit garbled then I'm stuck.


Dec 23 22:36:47 b1b1 kernel: [  130.943828] EXT4-fs (sda1): re-mounted. Opt=
s:
commit=3D0
Dec 23 22:36:49 b1b1 kernel: [  133.624015] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:36:49 b1b1 kernel: [  133.624025] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:36:49 b1b1 acpid: client connected from 1429[0:0]
Dec 23 22:36:49 b1b1 acpid: 1 client rule loaded
Dec 23 22:36:49 b1b1 kernel: [  133.626369] nouveau  [     DRM] index 0
Dec 23 22:36:49 b1b1 kernel: [  133.663802] nouveau  [     DRM] native mode
from largest: 1280x1024@75
Dec 23 22:36:52 b1b1 kernel: [  136.720020] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:36:52 b1b1 kernel: [  136.720027] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:01 b1b1 kernel: [  145.725096] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:37:01 b1b1 kernel: [  145.725109] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:04 b1b1 kernel: [  148.724012] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:37:04 b1b1 kernel: [  148.724015] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:07 b1b1 kernel: [  151.724018] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:37:07 b1b1 kernel: [  151.724027] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:08 b1b1 kernel: [  152.467763] SysRq : Emergency Sync

pm_trace wasn't very helpful here (resume *is* successful)
[    0.807743]   Magic number: 0:455:740
[    0.807803]   hash matches drivers/base/power/main.c:645

x11-drivers/xf86-video-nouveau 1.0.4
media-libs/mesa 9.0

maybe related to bug #50121

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1356299708.03AFEcF22.1321
Date: Sun, 23 Dec 2012 21:55:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:gibboris&=
#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.com&gt;"> =
<span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau failure on resume (reloc wait_idle failed)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D55258">bug 55258<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>gibboris&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau failure on resume (reloc wait_idle failed)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D55258#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau failure on resume (reloc wait_idle failed)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D55258">bug 55258<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gibboris&#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.c=
om&gt;"> <span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span></b>
        <pre>Happens here, using a NV34 [GeForce FX 5200] on AMD64
suspend works, hibernate works using the console (but didn't try several
attempts yet).
But when hibernate resumes X is a bit garbled then I'm stuck.


Dec 23 22:36:47 b1b1 kernel: [  130.943828] EXT4-fs (sda1): re-mounted. Opt=
s:
commit=3D0
Dec 23 22:36:49 b1b1 kernel: [  133.624015] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:36:49 b1b1 kernel: [  133.624025] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:36:49 b1b1 acpid: client connected from 1429[0:0]
Dec 23 22:36:49 b1b1 acpid: 1 client rule loaded
Dec 23 22:36:49 b1b1 kernel: [  133.626369] nouveau  [     DRM] index 0
Dec 23 22:36:49 b1b1 kernel: [  133.663802] nouveau  [     DRM] native mode
from largest: 1280x1024&#64;75
Dec 23 22:36:52 b1b1 kernel: [  136.720020] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:36:52 b1b1 kernel: [  136.720027] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:01 b1b1 kernel: [  145.725096] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:37:01 b1b1 kernel: [  145.725109] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:04 b1b1 kernel: [  148.724012] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:37:04 b1b1 kernel: [  148.724015] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:07 b1b1 kernel: [  151.724018] nouveau E[     DRM] reloc wait_=
idle
failed: -16
Dec 23 22:37:07 b1b1 kernel: [  151.724027] nouveau E[     DRM] reloc apply:
-16
Dec 23 22:37:08 b1b1 kernel: [  152.467763] SysRq : Emergency Sync

pm_trace wasn't very helpful here (resume *is* successful)
[    0.807743]   Magic number: 0:455:740
[    0.807803]   hash matches drivers/base/power/main.c:645

x11-drivers/xf86-video-nouveau 1.0.4
media-libs/mesa 9.0

maybe related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both=
 fail to resume with commit 'convert to exec engine, and improve channel sy=
nc'"
   href=3D"show_bug.cgi?id=3D50121">bug #50121</a></pre>
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

--1356299708.03AFEcF22.1321--

--===============1826461231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1826461231==--
