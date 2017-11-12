From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103689] WARN on nouveau_bo_move_ntfy when allocating
	new bo
Date: Sun, 12 Nov 2017 20:53:42 +0000
Message-ID: <bug-103689-8800-6rJqbddUij@http.bugs.freedesktop.org/>
References: <bug-103689-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1047804377=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103689-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1047804377==
Content-Type: multipart/alternative; boundary="15105200222.Bd11F.21092";
 charset="UTF-8"


--15105200222.Bd11F.21092
Date: Sun, 12 Nov 2017 20:53:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103689

--- Comment #3 from akayn <yena0xc5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
hello

look, the complete details about this incident including the kernel ver etc,
are given.=20
this is the kernel log first it warns and then it will panic the entire sys=
tem,
this is the fault:

Nov 10 11:24:37 nitro kernel: [  196.887267] nouveau 0000:01:00.0: fifo: re=
ad
fault at 002b8c0000 engine 00 [PGRAPH] client 10 [] reason 02
[PAGE_NOT_PRESENT] on channel 8 [003f986000 chromium-browse[2658]]

its clear that the driver try to read a non existing page.
i can reproduce it every single time.
if you cannot reproduce, then i would be very happy, becouse this would mean
that it is only my own personal problem and not anything generic.

i have tested it on latest ubuntu installation with your drivers, i dont kn=
ow
who should i submit this bug to if not you.

what additional information should i give you?

if you cannot reproduce with chromium, you may reproduce with chromium-asan
that can be downloaded from here:

https://commondatastorage.googleapis.com/chromium-browser-asan/index.html?p=
refix=3Dlinux-release/

download the latest.

regards.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are on the CC list for the bug.=

--15105200222.Bd11F.21092
Date: Sun, 12 Nov 2017 20:53:42 +0000
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
   title=3D"NEW - WARN on nouveau_bo_move_ntfy when allocating new bo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARN on nouveau_bo_move_ntfy when allocating new bo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689">bug 10368=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yena0xc5&#64;gmail.com" title=3D"akayn &lt;yena0xc5&#64;gmail.com&gt;"> <sp=
an class=3D"fn">akayn</span></a>
</span></b>
        <pre>hello

look, the complete details about this incident including the kernel ver etc,
are given.=20
this is the kernel log first it warns and then it will panic the entire sys=
tem,
this is the fault:

Nov 10 11:24:37 nitro kernel: [  196.887267] nouveau 0000:01:00.0: fifo: re=
ad
fault at 002b8c0000 engine 00 [PGRAPH] client 10 [] reason 02
[PAGE_NOT_PRESENT] on channel 8 [003f986000 chromium-browse[2658]]

its clear that the driver try to read a non existing page.
i can reproduce it every single time.
if you cannot reproduce, then i would be very happy, becouse this would mean
that it is only my own personal problem and not anything generic.

i have tested it on latest ubuntu installation with your drivers, i dont kn=
ow
who should i submit this bug to if not you.

what additional information should i give you?

if you cannot reproduce with chromium, you may reproduce with chromium-asan
that can be downloaded from here:

<a href=3D"https://commondatastorage.googleapis.com/chromium-browser-asan/i=
ndex.html?prefix=3Dlinux-release/">https://commondatastorage.googleapis.com=
/chromium-browser-asan/index.html?prefix=3Dlinux-release/</a>

download the latest.

regards.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are on the CC list for the bug.</li>
      </ul>
    </body>
</html>=

--15105200222.Bd11F.21092--

--===============1047804377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1047804377==--
