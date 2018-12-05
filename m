From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Wed, 05 Dec 2018 15:12:05 +0000
Message-ID: <bug-100423-8800-rFZFJGUof0@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0256592600=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0256592600==
Content-Type: multipart/alternative; boundary="15440227250.C0E5.15041"
Content-Transfer-Encoding: 7bit


--15440227250.C0E5.15041
Date: Wed, 5 Dec 2018 15:12:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #22 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Cameron from comment #21)
> From my dmesg.
>=20
> [   12.189523] ax88179_178a 2-2:1.0 enp0s20f0u2: ax88179 - Link status is=
: 0
> [   15.645518] ax88179_178a 2-2:1.0 enp0s20f0u2: ax88179 - Link status is=
: 1
> [   29.886049] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 6013d4 [ IBUS ]
> [   57.810423] logitech-hidpp-device 0003:046D:4013.0009: HID++ 2.0 device
> connected.
> [   60.146429] logitech-hidpp-device 0003:046D:4002.000A: HID++ 2.0 device
> connected.
>=20
>=20
> I am also getting this error
>=20
> kernel 4.19.5-1-default
> openSUSE Tumbleweed

No, as I said just above your post, this would be
https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

The hex value after =E2=80=9Cat=E2=80=9D does matter.=E2=80=AF;)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15440227250.C0E5.15041
Date: Wed, 5 Dec 2018 15:12:05 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>(In reply to Cameron from <a href=3D"show_bug.cgi?id=3D100423#=
c21">comment #21</a>)
<span class=3D"quote">&gt; From my dmesg.
&gt;=20
&gt; [   12.189523] ax88179_178a 2-2:1.0 enp0s20f0u2: ax88179 - Link status=
 is: 0
&gt; [   15.645518] ax88179_178a 2-2:1.0 enp0s20f0u2: ax88179 - Link status=
 is: 1
&gt; [   29.886049] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at
&gt; 6013d4 [ IBUS ]
&gt; [   57.810423] logitech-hidpp-device 0003:046D:4013.0009: HID++ 2.0 de=
vice
&gt; connected.
&gt; [   60.146429] logitech-hidpp-device 0003:046D:4002.000A: HID++ 2.0 de=
vice
&gt; connected.
&gt;=20
&gt;=20
&gt; I am also getting this error
&gt;=20
&gt; kernel 4.19.5-1-default
&gt; openSUSE Tumbleweed</span >

No, as I said just above your post, this would be
<a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"show_bug.cgi?id=3D98386">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98386</a>

The hex value after =E2=80=9Cat=E2=80=9D does matter.=E2=80=AF;)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15440227250.C0E5.15041--

--===============0256592600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0256592600==--
