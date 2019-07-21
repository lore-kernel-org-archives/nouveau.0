From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Sun, 21 Jul 2019 15:12:33 +0000
Message-ID: <bug-100567-8800-gqoTCQdKBx@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1909210300=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1909210300==
Content-Type: multipart/alternative; boundary="15637219545.deaCd9B9.11778"
Content-Transfer-Encoding: 7bit


--15637219545.deaCd9B9.11778
Date: Sun, 21 Jul 2019 15:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #36 from Harry Coin <hgcoin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
And here's another hard lock from this morning.  Much shorter syslog trace

$ uname -a
Linux ceo1homenx 5.2.0-8-generic #9-Ubuntu SMP Mon Jul 8 13:07:27 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

Jul 21 09:39:02 ceo1homenx systemd[1]: phpsessionclean.service: Succeeded.
Jul 21 09:39:02 ceo1homenx systemd[1]: Started Clean php session files.
Jul 21 09:45:02 ceo1homenx CRON[27199]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jul 21 09:45:20 ceo1homenx kernel: [89849.919490] nouveau 0000:01:00.0: fif=
o:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Jul 21 09:45:20 ceo1homenx kernel: [89849.919500] nouveau 0000:01:00.0: fif=
o:
runlist 0: scheduled for recovery
Jul 21 09:45:20 ceo1homenx kernel: [89849.919506] nouveau 0000:01:00.0: fif=
o:
channel 8: killed
Jul 21 09:45:20 ceo1homenx kernel: [89849.919511] nouveau 0000:01:00.0: fif=
o:
engine 0: scheduled for recovery
Jul 21 09:45:20 ceo1homenx kernel: [89849.919815] nouveau 0000:01:00.0:
Xorg[1546]: channel 8 killed!

-- hard lock -- No numlock/capslock,  system power button ineffective only
power-cycle works to restore operations.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637219545.deaCd9B9.11778
Date: Sun, 21 Jul 2019 15:12:34 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hgcoin&#64;gmail.com" title=3D"Harry Coin &lt;hgcoin&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Harry Coin</span></a>
</span></b>
        <pre>And here's another hard lock from this morning.  Much shorter =
syslog trace

$ uname -a
Linux ceo1homenx 5.2.0-8-generic #9-Ubuntu SMP Mon Jul 8 13:07:27 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

Jul 21 09:39:02 ceo1homenx systemd[1]: phpsessionclean.service: Succeeded.
Jul 21 09:39:02 ceo1homenx systemd[1]: Started Clean php session files.
Jul 21 09:45:02 ceo1homenx CRON[27199]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jul 21 09:45:20 ceo1homenx kernel: [89849.919490] nouveau 0000:01:00.0: fif=
o:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Jul 21 09:45:20 ceo1homenx kernel: [89849.919500] nouveau 0000:01:00.0: fif=
o:
runlist 0: scheduled for recovery
Jul 21 09:45:20 ceo1homenx kernel: [89849.919506] nouveau 0000:01:00.0: fif=
o:
channel 8: killed
Jul 21 09:45:20 ceo1homenx kernel: [89849.919511] nouveau 0000:01:00.0: fif=
o:
engine 0: scheduled for recovery
Jul 21 09:45:20 ceo1homenx kernel: [89849.919815] nouveau 0000:01:00.0:
Xorg[1546]: channel 8 killed!

-- hard lock -- No numlock/capslock,  system power button ineffective only
power-cycle works to restore operations.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637219545.deaCd9B9.11778--

--===============1909210300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1909210300==--
