From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Thu, 21 Sep 2017 04:23:16 +0000
Message-ID: <bug-99900-8800-OEfD6RVzOL@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1927095910=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1927095910==
Content-Type: multipart/alternative; boundary="15059677966.D5d37.28369";
 charset="UTF-8"


--15059677966.D5d37.28369
Date: Thu, 21 Sep 2017 04:23:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #24 from kong <riverkong.28-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
In 4.12.12 on fc26.
X hang and hang again randomly, and logged like this:

nouveau 0000:01:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM] ch 18 [007f294=
000
Xorg[2256]] subc 0 class a197 mthd 19c8 data 00000000
nouveau 0000:01:00.0: gr: ILLEGAL_MTHD ch 18 [007f294000 Xorg[2256]] subc 0
class a197 mthd 19d8 data 200308e0
nouveau 0000:01:00.0: gr: ILLEGAL_MTHD ch 18 [007f294000 Xorg[2256]] subc 0
class a197 mthd 19dc data 00000800
nouveau 0000:01:00.0: fifo: write fault at 0000000000 engine 00 [GR] client=
 0c
[GPC0/RAST] reason 02 [PTE] on channel 18 [007f294000 Xorg[2256]]
nouveau 0000:01:00.0: fifo: channel 18: killed
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 18
[007f294000 Xorg[2256]] subc 0 class a197 mthd 19e4 data 00340000
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 18
[007f294000 Xorg[2256]] subc 0 class a197 mthd 19e8 data a01108e3
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 18
[007f294000 Xorg[2256]] subc 0 class a197 mthd 19ec data 00000560


tried 4.12.13 on fc26.=20

android emulator randomly results:

nouveau: kernel rejected pushbuf: Invalid argument
nouveau: ch6: krec 0 pushes 0 bufs 13 relocs 0
nouveau: ch6: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch6: buf 00000001 00000048 00000002 00000002 00000000
nouveau: ch6: buf 00000002 00000007 00000002 00000002 00000000
nouveau: ch6: buf 00000003 00000008 00000002 00000002 00000002
nouveau: ch6: buf 00000004 0000000b 00000002 00000002 00000000
nouveau: ch6: buf 00000005 0000000a 00000002 00000002 00000002
nouveau: ch6: buf 00000006 00000006 00000004 00000000 00000004
nouveau: ch6: buf 00000007 0000004c 00000002 00000000 00000002
nouveau: ch6: buf 00000008 0000004d 00000002 00000000 00000002
nouveau: ch6: buf 00000009 00000057 00000004 00000004 00000000
nouveau: ch6: buf 0000000a 00000095 00000002 00000002 00000000
nouveau: ch6: buf 0000000b 00000065 00000002 00000002 00000000
nouveau: ch6: buf 0000000c 00000043 00000002 00000002 00000000
qemu-system-i386: pushbuf.c:727: nouveau_pushbuf_data: Assertion `kref' fai=
led.
Aborted (core dumped)


now , turn driver to xorg-x11-drv-nvidia , it not crashes.
i don't it whether about to this issue , but it must be nouveau's issue and
output similar error logs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15059677966.D5d37.28369
Date: Thu, 21 Sep 2017 04:23:16 +0000
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
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
riverkong.28&#64;gmail.com" title=3D"kong &lt;riverkong.28&#64;gmail.com&gt=
;"> <span class=3D"fn">kong</span></a>
</span></b>
        <pre>In 4.12.12 on fc26.
X hang and hang again randomly, and logged like this:

nouveau 0000:01:00.0: gr: DATA_ERROR 00000005 [INVALID_ENUM] ch 18 [007f294=
000
Xorg[2256]] subc 0 class a197 mthd 19c8 data 00000000
nouveau 0000:01:00.0: gr: ILLEGAL_MTHD ch 18 [007f294000 Xorg[2256]] subc 0
class a197 mthd 19d8 data 200308e0
nouveau 0000:01:00.0: gr: ILLEGAL_MTHD ch 18 [007f294000 Xorg[2256]] subc 0
class a197 mthd 19dc data 00000800
nouveau 0000:01:00.0: fifo: write fault at 0000000000 engine 00 [GR] client=
 0c
[GPC0/RAST] reason 02 [PTE] on channel 18 [007f294000 Xorg[2256]]
nouveau 0000:01:00.0: fifo: channel 18: killed
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 18
[007f294000 Xorg[2256]] subc 0 class a197 mthd 19e4 data 00340000
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 18
[007f294000 Xorg[2256]] subc 0 class a197 mthd 19e8 data a01108e3
nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 18
[007f294000 Xorg[2256]] subc 0 class a197 mthd 19ec data 00000560


tried 4.12.13 on fc26.=20

android emulator randomly results:

nouveau: kernel rejected pushbuf: Invalid argument
nouveau: ch6: krec 0 pushes 0 bufs 13 relocs 0
nouveau: ch6: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch6: buf 00000001 00000048 00000002 00000002 00000000
nouveau: ch6: buf 00000002 00000007 00000002 00000002 00000000
nouveau: ch6: buf 00000003 00000008 00000002 00000002 00000002
nouveau: ch6: buf 00000004 0000000b 00000002 00000002 00000000
nouveau: ch6: buf 00000005 0000000a 00000002 00000002 00000002
nouveau: ch6: buf 00000006 00000006 00000004 00000000 00000004
nouveau: ch6: buf 00000007 0000004c 00000002 00000000 00000002
nouveau: ch6: buf 00000008 0000004d 00000002 00000000 00000002
nouveau: ch6: buf 00000009 00000057 00000004 00000004 00000000
nouveau: ch6: buf 0000000a 00000095 00000002 00000002 00000000
nouveau: ch6: buf 0000000b 00000065 00000002 00000002 00000000
nouveau: ch6: buf 0000000c 00000043 00000002 00000002 00000000
qemu-system-i386: pushbuf.c:727: nouveau_pushbuf_data: Assertion `kref' fai=
led.
Aborted (core dumped)


now , turn driver to xorg-x11-drv-nvidia , it not crashes.
i don't it whether about to this issue , but it must be nouveau's issue and
output similar error logs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15059677966.D5d37.28369--

--===============1927095910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1927095910==--
