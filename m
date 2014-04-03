From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77003] [NV50] Fan speed to high with Kernel versions
 3.13.x - Nvidia GeForce GTS 240 (NV92)
Date: Thu, 03 Apr 2014 15:43:17 +0000
Message-ID: <bug-77003-8800-sFUIF838OZ@http.bugs.freedesktop.org/>
References: <bug-77003-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1243121947=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77003-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1243121947==
Content-Type: multipart/alternative; boundary="1396539797.27883a671.4716"; charset="us-ascii"


--1396539797.27883a671.4716
Date: Thu, 3 Apr 2014 15:43:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D77003

--- Comment #3 from Roman Spirgi <the.ant-hi6Y0CQ0nG0@public.gmane.org> ---
Created attachment 96855
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D96855&action=3Dedit
vbios.rom

Vbtracetool didn't find file "pci/pci.h" during make. So I did create it wi=
th
the nouveau module, hope this is OK instead.

Temp is quite high with 84=C2=B0, isn't it? With Kernel versions < 3.13.x f=
an speed
doesn't get up to 6Ks. I'm using Gnome 3 with Liber8, Firefox, ... nothing
spectacular.

This is with Kernel 3.12.9:
---
nouveau-pci-0100
Adapter: PCI adapter
fan1:        4702 RPM
temp1:        +84.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
---

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1396539797.27883a671.4716
Date: Thu, 3 Apr 2014 15:43:17 +0000
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
   title=3D"NEW --- - [NV50] Fan speed to high with Kernel versions 3.13.x =
- Nvidia GeForce GTS 240 (NV92)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D77003#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV50] Fan speed to high with Kernel versions 3.13.x =
- Nvidia GeForce GTS 240 (NV92)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D77003">bug 77003<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
the.ant&#64;gmx.net" title=3D"Roman Spirgi &lt;the.ant&#64;gmx.net&gt;"> <s=
pan class=3D"fn">Roman Spirgi</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D96855"=
 name=3D"attach_96855" title=3D"vbios.rom">attachment 96855</a> <a href=3D"=
attachment.cgi?id=3D96855&amp;action=3Dedit" title=3D"vbios.rom">[details]<=
/a></span>
vbios.rom

Vbtracetool didn't find file &quot;pci/pci.h&quot; during make. So I did cr=
eate it with
the nouveau module, hope this is OK instead.

Temp is quite high with 84=C2=B0, isn't it? With Kernel versions &lt; 3.13.=
x fan speed
doesn't get up to 6Ks. I'm using Gnome 3 with Liber8, Firefox, ... nothing
spectacular.

This is with Kernel 3.12.9:
---
nouveau-pci-0100
Adapter: PCI adapter
fan1:        4702 RPM
temp1:        +84.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
---</pre>
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

--1396539797.27883a671.4716--

--===============1243121947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1243121947==--
