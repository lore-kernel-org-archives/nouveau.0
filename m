From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP errors & PFIFO
	errors
Date: Fri, 15 May 2015 14:48:07 +0000
Message-ID: <bug-90453-8800-O1fIUdYzNo@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2075622723=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2075622723==
Content-Type: multipart/alternative; boundary="1431701287.d2d32d1.20613"; charset="UTF-8"


--1431701287.d2d32d1.20613
Date: Fri, 15 May 2015 14:48:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #13 from Michiel Helvensteijn <mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
During the freeze-up just now, dmesg gave me this beauty:

[ 9126.410442] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x007f2f2000
gnome-shell[1419]]
[ 9126.410451] nouveau E[  PGRAPH][0000:01:00.0] GPC1/PROP trap: (unknown enum
0x00000002)
[ 9126.410454] nouveau E[  PGRAPH][0000:01:00.0] x = 4560, y = 160, format = 0,
storage type = 0
[ 9126.410461] nouveau E[  PGRAPH][0000:01:00.0] GPC2/PROP trap: (unknown enum
0x00000002)
[ 9126.410462] nouveau E[  PGRAPH][0000:01:00.0] x = 4576, y = 152, format = 0,
storage type = 0
[ 9130.744302] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[ 9130.744306] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
9, recovering...
[ 9145.526131] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380020382:2380048967 (repaired)
[ 9146.092788] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380020382:2380048967 (repaired)
[ 9147.229435] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380020382:2380048967 (repaired)
[ 9164.935810] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380247127:2380249895 (repaired)
[ 9165.382470] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380247127:2380249895 (repaired)
[ 9172.099024] nouveau E[systemd-logind[431]] failed to idle channel 0xcccc0000
[systemd-logind[431]]
[ 9187.098777] nouveau E[systemd-logind[431]] failed to idle channel 0xcccc0000
[systemd-logind[431]]
[ 9187.098878] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000023000
[PTE] from PBDMA0/HOST_CPU on channel 0x007f541000 [unknown]
[ 9202.351857] nouveau E[gnome-shell[1419]] failed to idle channel 0xcccc0000
[gnome-shell[1419]]
[ 9217.351609] nouveau E[gnome-shell[1419]] failed to idle channel 0xcccc0000
[gnome-shell[1419]]
[ 9232.351361] nouveau E[chromium[2607]] failed to idle channel 0xcccc0000
[chromium[2607]]
[ 9247.351111] nouveau E[chromium[2607]] failed to idle channel 0xcccc0000
[chromium[2607]]

In case it makes a difference, this is after I tried installing the binary
nvidia drivers again, failing, and going back to nouveau. This is also with all
the latest gtk / gnome versions installed again (so the above errors follow the
long string of PDISP errors in the dmesg output).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431701287.d2d32d1.20613
Date: Fri, 15 May 2015 14:48:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors &amp; PFIFO errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors &amp; PFIFO errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:mhelvens&#64;gmail.com" title="Michiel Helvensteijn &lt;mhelvens&#64;gmail.com&gt;"> <span class="fn">Michiel Helvensteijn</span></a>
</span></b>
        <pre>During the freeze-up just now, dmesg gave me this beauty:

[ 9126.410442] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x007f2f2000
gnome-shell[1419]]
[ 9126.410451] nouveau E[  PGRAPH][0000:01:00.0] GPC1/PROP trap: (unknown enum
0x00000002)
[ 9126.410454] nouveau E[  PGRAPH][0000:01:00.0] x = 4560, y = 160, format = 0,
storage type = 0
[ 9126.410461] nouveau E[  PGRAPH][0000:01:00.0] GPC2/PROP trap: (unknown enum
0x00000002)
[ 9126.410462] nouveau E[  PGRAPH][0000:01:00.0] x = 4576, y = 152, format = 0,
storage type = 0
[ 9130.744302] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[ 9130.744306] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
9, recovering...
[ 9145.526131] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380020382:2380048967 (repaired)
[ 9146.092788] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380020382:2380048967 (repaired)
[ 9147.229435] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380020382:2380048967 (repaired)
[ 9164.935810] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380247127:2380249895 (repaired)
[ 9165.382470] Peer 84.104.35.99:51165/34567 unexpectedly shrunk window
2380247127:2380249895 (repaired)
[ 9172.099024] nouveau E[systemd-logind[431]] failed to idle channel 0xcccc0000
[systemd-logind[431]]
[ 9187.098777] nouveau E[systemd-logind[431]] failed to idle channel 0xcccc0000
[systemd-logind[431]]
[ 9187.098878] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000023000
[PTE] from PBDMA0/HOST_CPU on channel 0x007f541000 [unknown]
[ 9202.351857] nouveau E[gnome-shell[1419]] failed to idle channel 0xcccc0000
[gnome-shell[1419]]
[ 9217.351609] nouveau E[gnome-shell[1419]] failed to idle channel 0xcccc0000
[gnome-shell[1419]]
[ 9232.351361] nouveau E[chromium[2607]] failed to idle channel 0xcccc0000
[chromium[2607]]
[ 9247.351111] nouveau E[chromium[2607]] failed to idle channel 0xcccc0000
[chromium[2607]]

In case it makes a difference, this is after I tried installing the binary
nvidia drivers again, failing, and going back to nouveau. This is also with all
the latest gtk / gnome versions installed again (so the above errors follow the
long string of PDISP errors in the dmesg output).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431701287.d2d32d1.20613--

--===============2075622723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2075622723==--
