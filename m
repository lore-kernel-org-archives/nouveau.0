From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99202] system freeze - fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT] - MULTIPLE_WARP_ERRORS - DATA_ERROR 00000004
 [INVALID_VALUE] - ILLEGAL_CLASS ch 11 - RT_STORAGE_TYPE_MISMATCH -
 CLASS_SUBCH_MISMATCH
Date: Thu, 06 Jul 2017 20:12:06 +0000
Message-ID: <bug-99202-8800-0B1W1K8PIT@http.bugs.freedesktop.org/>
References: <bug-99202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2064459346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99202-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2064459346==
Content-Type: multipart/alternative; boundary="14993719262.Ddb9D6E2e.26887";
 charset="UTF-8"


--14993719262.Ddb9D6E2e.26887
Date: Thu, 6 Jul 2017 20:12:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99202

--- Comment #2 from Jeff <jeff-p6X7lc9ZsvHQT0dZR+AlfA@public.gmane.org> ---
I am seeing the _exact_ same issue (quoted below), as described by in the
original message. Same symptoms and error messages.

"The screen freezes except for that the mouse pointer can be used (click ha=
s no
effect). Apart from the magic syskeys (sync, unmount, boot) the keyboard
doesn't react. I can not use ALT-tab to switch to another program. I can not
leave the game (fullscreen mode) by using the ingame console or using ALT-F=
4.
The mouse pointer is trapped on the monitor where the game runs (I have two=
).
The sound keeps playing and sound effects are played now and then too. I tr=
ied
to get to the terminals via CTRL-ALT-F[1-6] but nothing happens. Switching
(KDE) desktops via CTRL-ALT-[arrow-left,arrow-right] is just the same."

I am running Ubuntu 16.10 on a Dell Precision Tower 5810.

Jul  6 10:54:38 nachos gcr-prompter[22026]: GtkDialog mapped without a
transient parent. This is discouraged.
Jul  6 10:58:31 nachos kernel: [82204.289470] nouveau 0000:03:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Jul  6 10:58:31 nachos kernel: [82204.289480] nouveau 0000:03:00.0: fifo: gr
engine fault on channel 5, recovering...

03:00.0 VGA compatible controller: NVIDIA Corporation GK107 [NVS 510] (rev =
a1)
(prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation GK107 [NVS 510]
        Physical Slot: 2
        Flags: bus master, fast devsel, latency 0, IRQ 30
        Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

Linux nachos 4.8.0-58-generic #63-Ubuntu SMP Mon Jun 26 17:08:21 UTC 2017
x86_64 x86_64 x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14993719262.Ddb9D6E2e.26887
Date: Thu, 6 Jul 2017 20:12:06 +0000
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
   title=3D"NEW - system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] - MU=
LTIPLE_WARP_ERRORS - DATA_ERROR 00000004 [INVALID_VALUE] - ILLEGAL_CLASS ch=
 11 - RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99202#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] - MU=
LTIPLE_WARP_ERRORS - DATA_ERROR 00000004 [INVALID_VALUE] - ILLEGAL_CLASS ch=
 11 - RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99202">bug 99202<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeff&#64;youtah.com" title=3D"Jeff &lt;jeff&#64;youtah.com&gt;"> <span clas=
s=3D"fn">Jeff</span></a>
</span></b>
        <pre>I am seeing the _exact_ same issue (quoted below), as describe=
d by in the
original message. Same symptoms and error messages.

&quot;The screen freezes except for that the mouse pointer can be used (cli=
ck has no
effect). Apart from the magic syskeys (sync, unmount, boot) the keyboard
doesn't react. I can not use ALT-tab to switch to another program. I can not
leave the game (fullscreen mode) by using the ingame console or using ALT-F=
4.
The mouse pointer is trapped on the monitor where the game runs (I have two=
).
The sound keeps playing and sound effects are played now and then too. I tr=
ied
to get to the terminals via CTRL-ALT-F[1-6] but nothing happens. Switching
(KDE) desktops via CTRL-ALT-[arrow-left,arrow-right] is just the same.&quot;

I am running Ubuntu 16.10 on a Dell Precision Tower 5810.

Jul  6 10:54:38 nachos gcr-prompter[22026]: GtkDialog mapped without a
transient parent. This is discouraged.
Jul  6 10:58:31 nachos kernel: [82204.289470] nouveau 0000:03:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Jul  6 10:58:31 nachos kernel: [82204.289480] nouveau 0000:03:00.0: fifo: gr
engine fault on channel 5, recovering...

03:00.0 VGA compatible controller: NVIDIA Corporation GK107 [NVS 510] (rev =
a1)
(prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation GK107 [NVS 510]
        Physical Slot: 2
        Flags: bus master, fast devsel, latency 0, IRQ 30
        Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

Linux nachos 4.8.0-58-generic #63-Ubuntu SMP Mon Jun 26 17:08:21 UTC 2017
x86_64 x86_64 x86_64 GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14993719262.Ddb9D6E2e.26887--

--===============2064459346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2064459346==--
