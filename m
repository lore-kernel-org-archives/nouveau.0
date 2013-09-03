From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] nouveau inconsistent changing output
 connector names in xrandr
Date: Tue, 03 Sep 2013 18:10:27 +0000
Message-ID: <bug-68075-8800-5fjI7RlOGj@http.bugs.freedesktop.org/>
References: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1454299997=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68075-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1454299997==
Content-Type: multipart/alternative; boundary="1378231827.D4E51.9202"; charset="us-ascii"


--1378231827.D4E51.9202
Date: Tue, 3 Sep 2013 18:10:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D68075

--- Comment #13 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

I haven't seen so far the "no nouveau outputs detected" or "nouveau output
names are changing" issues anymore with xorg-1.14. So that's good.=20


But when disabling nouveau output with "xrandr --output DP-2 --off" I get t=
his
Xorg crash:

[   138.763] reporting 5 7 17 134
[   139.048] have a master to look out for
[   139.048] (EE)=20
[   139.048] (EE) Backtrace:
[   139.052] (EE) 0: /usr/bin/X (OsLookupColor+0x129) [0x46ee59]
[   139.052] (EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36f2e0ef9=
f]
[   139.053] (EE) 2: /lib64/libdrm_intel.so.1
(drm_intel_bufmgr_fake_init+0xe3b) [0x7f2bd9ff2f3b]
[   139.054] (EE) 3: /lib64/libdrm_intel.so.1
(drm_intel_bufmgr_fake_init+0x2924) [0x7f2bd9ff6134]
[   139.055] (EE) 4: /usr/lib64/xorg/modules/drivers/intel_drv.so
(_init+0x9f22) [0x7f2bda22cf12]
[   139.055] (EE) 5: /usr/lib64/xorg/modules/drivers/intel_drv.so
(_init+0x6075) [0x7f2bda225285]
[   139.056] (EE) 6: /usr/bin/X (xf86PruneDuplicateModes+0x1df7) [0x4c84e7]
[   139.056] (EE) 7: /usr/bin/X (RRCrtcSet+0x589) [0x502b39]
[   139.056] (EE) 8: /usr/bin/X (ProcRRSetCrtcConfig+0x3d9) [0x503c99]
[   139.056] (EE) 9: /usr/bin/X (SendErrorToClient+0x3f7) [0x436fe7]
[   139.057] (EE) 10: /usr/bin/X (_init+0x3aaa) [0x429b8a]
[   139.058] (EE) 11: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36f2621b=
75]
[   139.058] (EE) 12: /usr/bin/X (_start+0x29) [0x4267f1]
[   139.059] (EE) 13: ? (?+0x29) [0x29]
[   139.059] (EE)=20
[   139.059] (EE) Segmentation fault at address 0x8
[   139.059] (EE)=20
Fatal server error:
[   139.059] (EE) Caught signal 11 (Segmentation fault). Server aborting
[   139.059] (EE)=20
[   139.059] (EE)=20
Please consult the Fedora Project support=20
         at http://wiki.x.org
 for help.=20
[   139.059] (EE) Please also check the log file at "/var/log/Xorg.0.log" f=
or
additional information.
[   139.059] (EE)=20
[   139.060] (II) AIGLX: Suspending AIGLX clients for VT switch
[   139.543] (EE) Server terminated with error (1). Closing log file.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1378231827.D4E51.9202
Date: Tue, 3 Sep 2013 18:10:27 +0000
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
   title=3D"NEW --- - nouveau inconsistent changing output connector names =
in xrandr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68075#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau inconsistent changing output connector names =
in xrandr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68075">bug 68075<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
I haven't seen so far the &quot;no nouveau outputs detected&quot; or &quot;=
nouveau output
names are changing&quot; issues anymore with xorg-1.14. So that's good.=20


But when disabling nouveau output with &quot;xrandr --output DP-2 --off&quo=
t; I get this
Xorg crash:

[   138.763] reporting 5 7 17 134
[   139.048] have a master to look out for
[   139.048] (EE)=20
[   139.048] (EE) Backtrace:
[   139.052] (EE) 0: /usr/bin/X (OsLookupColor+0x129) [0x46ee59]
[   139.052] (EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36f2e0ef9=
f]
[   139.053] (EE) 2: /lib64/libdrm_intel.so.1
(drm_intel_bufmgr_fake_init+0xe3b) [0x7f2bd9ff2f3b]
[   139.054] (EE) 3: /lib64/libdrm_intel.so.1
(drm_intel_bufmgr_fake_init+0x2924) [0x7f2bd9ff6134]
[   139.055] (EE) 4: /usr/lib64/xorg/modules/drivers/intel_drv.so
(_init+0x9f22) [0x7f2bda22cf12]
[   139.055] (EE) 5: /usr/lib64/xorg/modules/drivers/intel_drv.so
(_init+0x6075) [0x7f2bda225285]
[   139.056] (EE) 6: /usr/bin/X (xf86PruneDuplicateModes+0x1df7) [0x4c84e7]
[   139.056] (EE) 7: /usr/bin/X (RRCrtcSet+0x589) [0x502b39]
[   139.056] (EE) 8: /usr/bin/X (ProcRRSetCrtcConfig+0x3d9) [0x503c99]
[   139.056] (EE) 9: /usr/bin/X (SendErrorToClient+0x3f7) [0x436fe7]
[   139.057] (EE) 10: /usr/bin/X (_init+0x3aaa) [0x429b8a]
[   139.058] (EE) 11: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36f2621b=
75]
[   139.058] (EE) 12: /usr/bin/X (_start+0x29) [0x4267f1]
[   139.059] (EE) 13: ? (?+0x29) [0x29]
[   139.059] (EE)=20
[   139.059] (EE) Segmentation fault at address 0x8
[   139.059] (EE)=20
Fatal server error:
[   139.059] (EE) Caught signal 11 (Segmentation fault). Server aborting
[   139.059] (EE)=20
[   139.059] (EE)=20
Please consult the Fedora Project support=20
         at <a href=3D"http://wiki.x.org">http://wiki.x.org</a>
 for help.=20
[   139.059] (EE) Please also check the log file at &quot;/var/log/Xorg.0.l=
og&quot; for
additional information.
[   139.059] (EE)=20
[   139.060] (II) AIGLX: Suspending AIGLX clients for VT switch
[   139.543] (EE) Server terminated with error (1). Closing log file.</pre>
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

--1378231827.D4E51.9202--

--===============1454299997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1454299997==--
