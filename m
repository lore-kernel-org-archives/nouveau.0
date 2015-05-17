From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89912] Sometimes Nouveau hangs kernel with PGRAPH
	engine fault
Date: Sun, 17 May 2015 03:52:31 +0000
Message-ID: <bug-89912-8800-JuXjUHmHFk@http.bugs.freedesktop.org/>
References: <bug-89912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1059153786=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89912-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1059153786==
Content-Type: multipart/alternative; boundary="1431834751.D8f8AbDA1.9104"; charset="UTF-8"


--1431834751.D8f8AbDA1.9104
Date: Sun, 17 May 2015 03:52:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89912

--- Comment #1 from D=C4=81vis <davispuh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Still happening with kernel 4.0.2

kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002aa000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[485]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...


Any idea how to find cause? why it hangs...

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1431834751.D8f8AbDA1.9104
Date: Sun, 17 May 2015 03:52:31 +0000
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
   title=3D"NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89912#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89912">bug 89912<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
davispuh&#64;gmail.com" title=3D"D=C4=81vis &lt;davispuh&#64;gmail.com&gt;"=
> <span class=3D"fn">D=C4=81vis</span></a>
</span></b>
        <pre>Still happening with kernel 4.0.2

kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002aa000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[485]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...


Any idea how to find cause? why it hangs...</pre>
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

--1431834751.D8f8AbDA1.9104--

--===============1059153786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1059153786==--
