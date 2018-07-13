From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106772] Xorg crashes with nouveau and dual screen
 setup
Date: Fri, 13 Jul 2018 09:52:13 +0000
Message-ID: <bug-106772-8800-ThiORVTvuC@http.bugs.freedesktop.org/>
References: <bug-106772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0986715108=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0986715108==
Content-Type: multipart/alternative; boundary="15314755320.Ef4d9C.19176"
Content-Transfer-Encoding: 7bit


--15314755320.Ef4d9C.19176
Date: Fri, 13 Jul 2018 09:52:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106772

--- Comment #7 from Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> ---
Hello Keith,
I suffer from the same problem - crash on startup.
The backtrace is identical (attaching).
The circumstances are the same - I have four monitors with two nvidia cards
using nouveau driver.
I am using xinerama.

After applying your patch the backtrace is different:

double free or corruption (!prev)
(EE)
(EE) Backtrace:
(EE) 0: /usr/lib/xorg/Xorg (xorg_backtrace+0x4a) [0x5637ad9347da]
(EE) 1: /usr/lib/xorg/Xorg (0x5637ad780000+0x1b8489) [0x5637ad938489]
(EE) 2: /lib/x86_64-linux-gnu/libpthread.so.0 (0x7efc039f4000+0x11f50)
[0x7efc03a05f50]
(EE) 3: /lib/x86_64-linux-gnu/libc.so.6 (gsignal+0x10b) [0x7efc0366ee7b]
(EE) 4: /lib/x86_64-linux-gnu/libc.so.6 (abort+0x151) [0x7efc03670231]
(EE) 5: /lib/x86_64-linux-gnu/libc.so.6 (0x7efc0363a000+0x777b7)
[0x7efc036b17b7]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7efc0363a000+0x7dd5a)
[0x7efc036b7d5a]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (0x7efc0363a000+0x7f81c)
[0x7efc036b981c]
(EE) 8: /usr/lib/xorg/Xorg (PanoramiXCreateConnectionBlock+0x20a)
[0x5637ad87f98a]
(EE) 9: /usr/lib/xorg/Xorg (0x5637ad780000+0x609e1) [0x5637ad7e09e1]
(EE) 10: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xe7)
[0x7efc0365ba87]
(EE) 11: /usr/lib/xorg/Xorg (_start+0x2a) [0x5637ad7ca6ca]

Attaching a full log.

regards,
manio

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15314755320.Ef4d9C.19176
Date: Fri, 13 Jul 2018 09:52:12 +0000
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
   title=3D"NEW - Xorg crashes with nouveau and dual screen setup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106772#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg crashes with nouveau and dual screen setup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106772">bug 10677=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
manio&#64;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;s=
kyboo.net&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span></b>
        <pre>Hello Keith,
I suffer from the same problem - crash on startup.
The backtrace is identical (attaching).
The circumstances are the same - I have four monitors with two nvidia cards
using nouveau driver.
I am using xinerama.

After applying your patch the backtrace is different:

double free or corruption (!prev)
(EE)
(EE) Backtrace:
(EE) 0: /usr/lib/xorg/Xorg (xorg_backtrace+0x4a) [0x5637ad9347da]
(EE) 1: /usr/lib/xorg/Xorg (0x5637ad780000+0x1b8489) [0x5637ad938489]
(EE) 2: /lib/x86_64-linux-gnu/libpthread.so.0 (0x7efc039f4000+0x11f50)
[0x7efc03a05f50]
(EE) 3: /lib/x86_64-linux-gnu/libc.so.6 (gsignal+0x10b) [0x7efc0366ee7b]
(EE) 4: /lib/x86_64-linux-gnu/libc.so.6 (abort+0x151) [0x7efc03670231]
(EE) 5: /lib/x86_64-linux-gnu/libc.so.6 (0x7efc0363a000+0x777b7)
[0x7efc036b17b7]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7efc0363a000+0x7dd5a)
[0x7efc036b7d5a]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (0x7efc0363a000+0x7f81c)
[0x7efc036b981c]
(EE) 8: /usr/lib/xorg/Xorg (PanoramiXCreateConnectionBlock+0x20a)
[0x5637ad87f98a]
(EE) 9: /usr/lib/xorg/Xorg (0x5637ad780000+0x609e1) [0x5637ad7e09e1]
(EE) 10: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xe7)
[0x7efc0365ba87]
(EE) 11: /usr/lib/xorg/Xorg (_start+0x2a) [0x5637ad7ca6ca]

Attaching a full log.

regards,
manio</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15314755320.Ef4d9C.19176--

--===============0986715108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0986715108==--
