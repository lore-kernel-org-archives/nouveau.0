From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101404] GTX 970M (GM204-A) not powered off when not
 in use (DynPwr in stead of DynOff)
Date: Thu, 06 Jul 2017 15:49:02 +0000
Message-ID: <bug-101404-8800-YJm0R7GTCD@http.bugs.freedesktop.org/>
References: <bug-101404-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0198852877=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101404-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0198852877==
Content-Type: multipart/alternative; boundary="14993561411.7A8CD9f.20726";
 charset="UTF-8"


--14993561411.7A8CD9f.20726
Date: Thu, 6 Jul 2017 15:49:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101404

--- Comment #7 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
(In reply to Benny Ammitzb=C3=B8ll from comment #6)
[..]
> 00:01.0 PCI bridge [0604]: Intel Corporation Skylake PCIe Controller (x16)
> [8086:1901] (rev 07)
[..]
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM204M [GeFo=
rce
> GTX 970M] [10de:13d8] (rev a1)
[..]
> In the "Tunables" tab? They're all "Bad" when on AC (until I change them =
to
> Good):
[..]
> >> Bad           Runtime PM for PCI Device NVIDIA Corporation GM204M [GeF=
orce GTX 970M]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[..]
>    Bad           Runtime PM for PCI Device Intel Corporation Skylake PCIe
> Controller (x16)

There is your problem. You have something that modifies runtime PM settings=
. In
the default configuration, runtime PM would be enabled for both. Try
removing/disabling that problematic tool.

> Ok, but you say that I can't use the second (preferred) option when I load
> the nouveau driver - so I must use pcie_port_pm=3Doff. Shouldn't the nouv=
eau
> driver be updated to support the second option in stead?

nouveau has been updated at the same time to support the new, preferred opt=
ion.
But if you use pcie_port_pm=3Doff, it will fallback to the old method.

> > Upgrade to kernel 4.10 or newer, then your brightness keys should work
> > without forcing acpi_osi=3DLinux. See
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D123651
>=20
> Not so, I am already on kernel 4.9.34:

4.9 is too old, use 4.10 (TEN) or newer.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14993561411.7A8CD9f.20726
Date: Thu, 6 Jul 2017 15:49:01 +0000
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
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404">bug 10140=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>(In reply to Benny Ammitzb=C3=B8ll from <a href=3D"show_bug.cg=
i?id=3D101404#c6">comment #6</a>)
[..]
<span class=3D"quote">&gt; 00:01.0 PCI bridge [0604]: Intel Corporation Sky=
lake PCIe Controller (x16)
&gt; [8086:1901] (rev 07)</span >
[..]
<span class=3D"quote">&gt; 01:00.0 VGA compatible controller [0300]: NVIDIA=
 Corporation GM204M [GeForce
&gt; GTX 970M] [10de:13d8] (rev a1)</span >
[..]
<span class=3D"quote">&gt; In the &quot;Tunables&quot; tab? They're all &qu=
ot;Bad&quot; when on AC (until I change them to
&gt; Good):</span >
[..]
<span class=3D"quote">&gt; &gt;&gt; Bad           Runtime PM for PCI Device=
 NVIDIA Corporation GM204M [GeForce GTX 970M]                              =
   </span >
[..]
<span class=3D"quote">&gt;    Bad           Runtime PM for PCI Device Intel=
 Corporation Skylake PCIe
&gt; Controller (x16)</span >

There is your problem. You have something that modifies runtime PM settings=
. In
the default configuration, runtime PM would be enabled for both. Try
removing/disabling that problematic tool.

<span class=3D"quote">&gt; Ok, but you say that I can't use the second (pre=
ferred) option when I load
&gt; the nouveau driver - so I must use pcie_port_pm=3Doff. Shouldn't the n=
ouveau
&gt; driver be updated to support the second option in stead?</span >

nouveau has been updated at the same time to support the new, preferred opt=
ion.
But if you use pcie_port_pm=3Doff, it will fallback to the old method.

<span class=3D"quote">&gt; &gt; Upgrade to kernel 4.10 or newer, then your =
brightness keys should work
&gt; &gt; without forcing acpi_osi=3DLinux. See
&gt; &gt; <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D123651">=
https://bugzilla.kernel.org/show_bug.cgi?id=3D123651</a>
&gt;=20
&gt; Not so, I am already on kernel 4.9.34:</span >

4.9 is too old, use 4.10 (TEN) or newer.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14993561411.7A8CD9f.20726--

--===============0198852877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0198852877==--
