From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96836] Kernel unaligned access at TPC[105d9fb4]
 nvkm_instobj_wr32+0x14/0x20 [nouveau]
Date: Sun, 10 Jul 2016 02:57:25 +0000
Message-ID: <bug-96836-8800-EsHOjeQZ3D@http.bugs.freedesktop.org/>
References: <bug-96836-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350530034=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96836-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1350530034==
Content-Type: multipart/alternative; boundary="14681194450.F643EF.19760";
 charset="UTF-8"


--14681194450.F643EF.19760
Date: Sun, 10 Jul 2016 02:57:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96836

--- Comment #13 from Kieron Gillespie <ciaran.gillespie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So I tried unplugging the monitor just to see what would happen, welp...

Message from syslogd@celestia at Jul  9 22:55:21 ...
 kernel:[ 2211.347894] Kernel panic - not syncing: Irrecoverable deferred e=
rror
trap.

Message from syslogd@celestia at Jul  9 22:55:21 ...
 kernel:[ 2211.347894]=20

Message from syslogd@celestia at Jul  9 22:55:21 ...
 kernel:[ 2213.461991] Press Stop-A (L1-A) to return to the boot prom

Message from syslogd@celestia at Jul  9 22:55:21 ...
 kernel:[ 2213.534081] ---[ end Kernel panic - not syncing: Irrecoverable
deferred error trap.

Message from syslogd@celestia at Jul  9 22:55:21 ...
 kernel:[ 2213.534081]=20

Message from syslogd@celestia at Jul  9 22:55:54 ...
 kernel:[ 2246.560543] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s!
[Xorg:3774]

Well now I know what happens! :P

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14681194450.F643EF.19760
Date: Sun, 10 Jul 2016 02:57:25 +0000
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
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel unaligned access at TPC[105d9fb4] nvkm_instobj_wr3=
2+0x14/0x20 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96836">bug 96836<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ciaran.gillespie&#64;gmail.com" title=3D"Kieron Gillespie &lt;ciaran.gilles=
pie&#64;gmail.com&gt;"> <span class=3D"fn">Kieron Gillespie</span></a>
</span></b>
        <pre>So I tried unplugging the monitor just to see what would happe=
n, welp...

Message from syslogd&#64;celestia at Jul  9 22:55:21 ...
 kernel:[ 2211.347894] Kernel panic - not syncing: Irrecoverable deferred e=
rror
trap.

Message from syslogd&#64;celestia at Jul  9 22:55:21 ...
 kernel:[ 2211.347894]=20

Message from syslogd&#64;celestia at Jul  9 22:55:21 ...
 kernel:[ 2213.461991] Press Stop-A (L1-A) to return to the boot prom

Message from syslogd&#64;celestia at Jul  9 22:55:21 ...
 kernel:[ 2213.534081] ---[ end Kernel panic - not syncing: Irrecoverable
deferred error trap.

Message from syslogd&#64;celestia at Jul  9 22:55:21 ...
 kernel:[ 2213.534081]=20

Message from syslogd&#64;celestia at Jul  9 22:55:54 ...
 kernel:[ 2246.560543] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s!
[Xorg:3774]

Well now I know what happens! :P</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14681194450.F643EF.19760--

--===============1350530034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1350530034==--
