From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Wed, 11 Mar 2015 16:35:46 +0000
Message-ID: <bug-80901-8800-7A6nbeqjmN@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1707228154=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1707228154==
Content-Type: multipart/alternative; boundary="1426091746.15C2D3.3618"; charset="UTF-8"


--1426091746.15C2D3.3618
Date: Wed, 11 Mar 2015 16:35:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D80901

--- Comment #41 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Lars E Pettersson from comment #39)
...
>=20
> Not sure what all these numbers means though... :)


'nvapeek' might be something like "nvidia peek(read)"
and
'nvapoke' might be something like "nvidia poke(write)",
MMIO regs.

Addresses 'e114'&'e118' with their 'values' should fall into this range:
- G80:GF100 MMIO map
  0x00e000     all     PNVIO     GPIOs, I2C buses, PWM fan control, and oth=
er
external devices
OR
- GF100+ MMIO map
  0x00e000     all     PNVIO     GPIOs, I2C buses, PWM fan control, and oth=
er
external devices

How Martin reached the actual addresses and values, he knows better. :)


Ref.
PEEK and POKE
http://en.wikipedia.org/wiki/PEEK_and_POKE

MMIO
http://en.wikipedia.org/wiki/Memory-mapped_I/O

MMIO register ranges
http://envytools.readthedocs.org/en/latest/hw/mmio.html

PNVIO: external device interface
http://envytools.readthedocs.org/en/latest/hw/io/pnvio.html

Pok=C3=A9mon
http://en.wikipedia.org/wiki/Pok=C3=A9mon

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1426091746.15C2D3.3618
Date: Wed, 11 Mar 2015 16:35:46 +0000
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
   title=3D"NEW - [NVCF] PWM fan speed too high"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901#c41">Commen=
t # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVCF] PWM fan speed too high"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901">bug 80901<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>(In reply to Lars E Pettersson from <a href=3D"show_bug.cgi?id=
=3D80901#c39">comment #39</a>)
...
<span class=3D"quote">&gt;=20
&gt; Not sure what all these numbers means though... :)</span >


'nvapeek' might be something like &quot;nvidia peek(read)&quot;
and
'nvapoke' might be something like &quot;nvidia poke(write)&quot;,
MMIO regs.

Addresses 'e114'&amp;'e118' with their 'values' should fall into this range:
- G80:GF100 MMIO map
  0x00e000     all     PNVIO     GPIOs, I2C buses, PWM fan control, and oth=
er
external devices
OR
- GF100+ MMIO map
  0x00e000     all     PNVIO     GPIOs, I2C buses, PWM fan control, and oth=
er
external devices

How Martin reached the actual addresses and values, he knows better. :)


Ref.
PEEK and POKE
<a href=3D"http://en.wikipedia.org/wiki/PEEK_and_POKE">http://en.wikipedia.=
org/wiki/PEEK_and_POKE</a>

MMIO
<a href=3D"http://en.wikipedia.org/wiki/Memory-mapped_I/O">http://en.wikipe=
dia.org/wiki/Memory-mapped_I/O</a>

MMIO register ranges
<a href=3D"http://envytools.readthedocs.org/en/latest/hw/mmio.html">http://=
envytools.readthedocs.org/en/latest/hw/mmio.html</a>

PNVIO: external device interface
<a href=3D"http://envytools.readthedocs.org/en/latest/hw/io/pnvio.html">htt=
p://envytools.readthedocs.org/en/latest/hw/io/pnvio.html</a>

Pok=C3=A9mon
<a href=3D"http://en.wikipedia.org/wiki/Pok=C3=A9mon">http://en.wikipedia.o=
rg/wiki/Pok=C3=A9mon</a></pre>
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

--1426091746.15C2D3.3618--

--===============1707228154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1707228154==--
