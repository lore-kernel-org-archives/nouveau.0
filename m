From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101404] GTX 970M (GM204-A) not powered off when not
 in use (DynPwr in stead of DynOff)
Date: Wed, 05 Jul 2017 11:14:10 +0000
Message-ID: <bug-101404-8800-QiAA22VPMp@http.bugs.freedesktop.org/>
References: <bug-101404-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0378031078=="
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


--===============0378031078==
Content-Type: multipart/alternative; boundary="14992532490.DaCBf0Cb.6399";
 charset="UTF-8"


--14992532490.DaCBf0Cb.6399
Date: Wed, 5 Jul 2017 11:14:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101404

--- Comment #4 from Benny Ammitzb=C3=B8ll <benny-t2dRYjLbInkVZ4pArIi0Q3XJ5CkEIoRN@public.gmane.org> ---
(In reply to Peter Wu from comment #3)
> When the nouveau driver is loaded, runtime PM for the Nvidia PCI device
> (01:00.0 in your case) should be enabled.

Yes, I agree. Why is the Nvidia card not going to DynOff when on AC and not
being used then? I can force it by using powertop, but why does this not ha=
ppen
automatically?

> Without pcie_port_pm=3Doff this will
> also enable runtime PM for the parent device, a PCIe port.

Ok, but then I don't understand why without pcie_port_pm=3Doff I get a high=
er
power consumption? I mean, the parent device should power down the entire P=
CIe
port incl. the Nvidia card? And before linux kernel 4.8 (I think)
pcie_port_pm=3Doff was not needed, so what happened?

> Any reason why you boot with acpi_osi=3D! acpi_osi=3DLinux? If you want to
> prevent a lockup that occurs with Clevo P6xxRx models, try
> acpi_osi=3D"!Windows 2015"
> (see https://bugzilla.kernel.org/show_bug.cgi?id=3D156341)

Because while acpi_osi=3D"!Windows 2015" does prevent the lockup, I still h=
ave
some Fn keys that are not working (notably those that adjust screen brightn=
ess,
but others as well). With acpi_osi=3D! acpi_osi=3DLinux all of my Fn keys a=
re
working, incl. no lockup.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14992532490.DaCBf0Cb.6399
Date: Wed, 5 Jul 2017 11:14:09 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404">bug 10140=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
benny&#64;ammitzboell-consult.dk" title=3D"Benny Ammitzb=C3=B8ll &lt;benny&=
#64;ammitzboell-consult.dk&gt;"> <span class=3D"fn">Benny Ammitzb=C3=B8ll</=
span></a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D101404=
#c3">comment #3</a>)
<span class=3D"quote">&gt; When the nouveau driver is loaded, runtime PM fo=
r the Nvidia PCI device
&gt; (01:00.0 in your case) should be enabled.</span >

Yes, I agree. Why is the Nvidia card not going to DynOff when on AC and not
being used then? I can force it by using powertop, but why does this not ha=
ppen
automatically?

<span class=3D"quote">&gt; Without pcie_port_pm=3Doff this will
&gt; also enable runtime PM for the parent device, a PCIe port.</span >

Ok, but then I don't understand why without pcie_port_pm=3Doff I get a high=
er
power consumption? I mean, the parent device should power down the entire P=
CIe
port incl. the Nvidia card? And before linux kernel 4.8 (I think)
pcie_port_pm=3Doff was not needed, so what happened?

<span class=3D"quote">&gt; Any reason why you boot with acpi_osi=3D! acpi_o=
si=3DLinux? If you want to
&gt; prevent a lockup that occurs with Clevo P6xxRx models, try
&gt; acpi_osi=3D&quot;!Windows 2015&quot;
&gt; (see <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D156341">=
https://bugzilla.kernel.org/show_bug.cgi?id=3D156341</a>)</span >

Because while acpi_osi=3D&quot;!Windows 2015&quot; does prevent the lockup,=
 I still have
some Fn keys that are not working (notably those that adjust screen brightn=
ess,
but others as well). With acpi_osi=3D! acpi_osi=3DLinux all of my Fn keys a=
re
working, incl. no lockup.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14992532490.DaCBf0Cb.6399--

--===============0378031078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0378031078==--
