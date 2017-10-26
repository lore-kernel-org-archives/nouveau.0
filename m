From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103467] [NVC0/GF108] fifo: read fault at cd90f4d000
 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on
 channel 1 [003fe11000 DRM]
Date: Thu, 26 Oct 2017 16:21:58 +0000
Message-ID: <bug-103467-8800-NCmM1A4zc9@http.bugs.freedesktop.org/>
References: <bug-103467-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1406842923=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103467-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1406842923==
Content-Type: multipart/alternative; boundary="15090349181.EEa63Dd75.13466";
 charset="UTF-8"


--15090349181.EEa63Dd75.13466
Date: Thu, 26 Oct 2017 16:21:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103467

--- Comment #8 from erhard_f-cl+VPiYnx/1AfugRpC6u6w@public.gmane.org ---
Sorry, but that's the best I can do at the moment... When booting up the
console gets flooded with debug messages, logging in is only possible
afterwards. The dmesg > kernel_debug-log.txt I create at that time does not
show the boot process from the beginning but only repeats:
[   18.488344] nouveau: DRM:00000000:00000000: ioctl: size 48
[   18.488346] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 04 object
c000000459bba070 owner ff
[   18.488347] nouveau: DRM:00000000:00000080: ioctl: mthd size 24
[   18.488348] nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd 01
[   18.488350] nouveau: DRM:00000000:00000080: ioctl: device mthd 00000001
[   18.488351] nouveau: DRM:00000000:00000080: ioctl: device time size 16
[   18.488352] nouveau: DRM:00000000:00000080: ioctl: device time vers 0
[   18.488356] nouveau: DRM:00000000:00000000: ioctl: return 0

even if the log buffer ist set to 4M. As an alternative I can only offer the
ouput of systemd's journalctl -k.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15090349181.EEa63Dd75.13466
Date: Thu, 26 Oct 2017 16:21:58 +0000
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
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467">bug 10346=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Sorry, but that's the best I can do at the moment... When boot=
ing up the
console gets flooded with debug messages, logging in is only possible
afterwards. The dmesg &gt; kernel_debug-log.txt I create at that time does =
not
show the boot process from the beginning but only repeats:
[   18.488344] nouveau: DRM:00000000:00000000: ioctl: size 48
[   18.488346] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 04 object
c000000459bba070 owner ff
[   18.488347] nouveau: DRM:00000000:00000080: ioctl: mthd size 24
[   18.488348] nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd 01
[   18.488350] nouveau: DRM:00000000:00000080: ioctl: device mthd 00000001
[   18.488351] nouveau: DRM:00000000:00000080: ioctl: device time size 16
[   18.488352] nouveau: DRM:00000000:00000080: ioctl: device time vers 0
[   18.488356] nouveau: DRM:00000000:00000000: ioctl: return 0

even if the log buffer ist set to 4M. As an alternative I can only offer the
ouput of systemd's journalctl -k.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15090349181.EEa63Dd75.13466--

--===============1406842923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1406842923==--
