From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 19 Sep 2017 21:30:45 +0000
Message-ID: <bug-99900-8800-YlT64Uh2ro@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887809603=="
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


--===============1887809603==
Content-Type: multipart/alternative; boundary="15058566457.F1e81b1b3.11225";
 charset="UTF-8"


--15058566457.F1e81b1b3.11225
Date: Tue, 19 Sep 2017 21:30:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #18 from andrewb03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
According to the HangDiagnosis page -
https://nouveau.freedesktop.org/wiki/HangDiagnosis - this is my crash level:
Display is frozen in X, but mouse cursor moves.

SSH works as well but keyboard freezes so I'm forced to either reboot the PC
via ssh or restart X via ssh.

Any updates on this bug?  I'm seeing it on 4.12.10 in Arch Linux.

This seems to happen right around the crash:

nouveau 0000:0a:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:0a:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:0a:00.0: fifo: channel 6: killed
nouveau 0000:0a:00.0: fifo: engine 7: scheduled for recovery
nouveau 0000:0a:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:0a:00.0: gnome-shell[5893]: channel 6 killed!

At the time I was simply using Discord in gnome-shell via a Chrome tab.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15058566457.F1e81b1b3.11225
Date: Tue, 19 Sep 2017 21:30:45 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrewb03&#64;gmail.com" title=3D"andrewb03&#64;gmail.com">andrewb03&#64;gm=
ail.com</a>
</span></b>
        <pre>According to the HangDiagnosis page -
<a href=3D"https://nouveau.freedesktop.org/wiki/HangDiagnosis">https://nouv=
eau.freedesktop.org/wiki/HangDiagnosis</a> - this is my crash level:
Display is frozen in X, but mouse cursor moves.

SSH works as well but keyboard freezes so I'm forced to either reboot the PC
via ssh or restart X via ssh.

Any updates on this bug?  I'm seeing it on 4.12.10 in Arch Linux.

This seems to happen right around the crash:

nouveau 0000:0a:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:0a:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:0a:00.0: fifo: channel 6: killed
nouveau 0000:0a:00.0: fifo: engine 7: scheduled for recovery
nouveau 0000:0a:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:0a:00.0: gnome-shell[5893]: channel 6 killed!

At the time I was simply using Discord in gnome-shell via a Chrome tab.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15058566457.F1e81b1b3.11225--

--===============1887809603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1887809603==--
