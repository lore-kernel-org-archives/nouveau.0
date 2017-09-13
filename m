From: Nicolas Mercier <mercier.nicolas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau: kernel hang on Optimus+Intel+NVidia GeForce
	1060m
Date: Wed, 13 Sep 2017 11:37:01 +0200
Message-ID: <CAKyUnMW-OUpMtXoVgP0xz-LawgtewPGQEcu5P=CgYU_Bi9pqaQ@mail.gmail.com>
References: <CAKyUnMW6f-EpyjZ=tocOR6Ji8MLprF71YzNsOKv-+UGtbvqH=g@mail.gmail.com>
 <cb794e03-6ca8-7e80-9277-ea780ee0bbd2@mni.thm.de>
 <CAKyUnMVeWzgptcN0CVLg4SYriY7+29wXcdaAH4Xig7tXSuXBtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779697045=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKyUnMVeWzgptcN0CVLg4SYriY7+29wXcdaAH4Xig7tXSuXBtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1779697045==
Content-Type: multipart/alternative; boundary="001a114e7ae2e59c4805590ee6c2"

--001a114e7ae2e59c4805590ee6c2
Content-Type: text/plain; charset="UTF-8"

I am still looking for a solution. I have hacked around in the code and
found out the following:
- Nouveau prefers using PCIE power managemet over ACPI Optimus calls. I
tried to force it to use Optimus ACPI calls, but there was an error calling
the ACPI method so it bails out and uses PCIE PM anyway.
- I tried to debug the PCIE pm states which internally uses ACPI to turn
power on/off. I could print different statuses here and there.
When the power is switched off, ACPI calls turn the power off then the
kernel successfully puts the device in state D3Cold (also turning off power
to the PCI Express port). When waking up, ACPI turns the power on,
apparently successfully (Device [PEGP] transitioned to D0). But a read from
the PCI bus to get the power state & other flags return 65535 (~0) and the
kernel fails to set the device in D0 (although ACPI claims it is in D0)
The call to pci_raw_set_power_state (in drivers/pci/pci.c) seems to fail
because pci_read_config_word returns "~0" (and does not return any error
code)

I have tried different things; if I use pcie_port_pm=off, the NVidia card
goes to state D3Hot (if I am not mistaken, its PCIE port is still powered)
but that did not fix it. I tried to turn on or off different PCI/PCIexpress
features such as hotplug, PM and so on. The only thing that works is that
PM is fully disabled, which equals to the device not being powered off, so
that would be equivalent to nouveau.runpm=0, which is not helping a lot. I
have tried to force pcie aspm by recompiling the ACPI table, still no luck.

I am still taking a look, but it seems like the problem comes from the
PCIExpress PM functions and ACPI, not directly from Nouveau

/n

--001a114e7ae2e59c4805590ee6c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">I am still looking for a soluti=
on. I have hacked around in the code and found out the following:</div><div=
 class=3D"gmail_extra">- Nouveau prefers using PCIE power managemet over AC=
PI Optimus calls. I tried to force it to use Optimus ACPI calls, but there =
was an error calling the ACPI method so it bails out and uses PCIE PM anywa=
y.</div><div class=3D"gmail_extra">- I tried to debug the PCIE pm states wh=
ich internally uses ACPI to turn power on/off. I could print different stat=
uses here and there.</div><div class=3D"gmail_extra">When the power is swit=
ched off, ACPI calls turn the power off then the kernel successfully puts t=
he device in state D3Cold (also turning off power to the PCI Express port).=
 When waking up, ACPI turns the power on, apparently successfully (Device [=
PEGP] transitioned to D0). But a read from the PCI bus to get the power sta=
te &amp; other flags return 65535 (~0) and the kernel fails to set the devi=
ce in D0 (although ACPI claims it is in D0)</div><div class=3D"gmail_extra"=
>The call to pci_raw_set_power_state (in drivers/pci/pci.c) seems to fail b=
ecause pci_read_config_word returns &quot;~0&quot; (and does not return any=
 error code)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">I have tried different things; if I use pcie_port_pm=3Doff, the NVid=
ia card goes to state D3Hot (if I am not mistaken, its PCIE port is still p=
owered) but that did not fix it. I tried to turn on or off different PCI/PC=
Iexpress features such as hotplug, PM and so on. The only thing that works =
is that PM is fully disabled, which equals to the device not being powered =
off, so that would be equivalent to nouveau.runpm=3D0, which is not helping=
 a lot. I have tried to force pcie aspm by recompiling the ACPI table, stil=
l no luck.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">I am still taking a look, but it seems like the problem comes from the=
 PCIExpress PM functions and ACPI, not directly from Nouveau</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">/n</div></div>

--001a114e7ae2e59c4805590ee6c2--

--===============1779697045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1779697045==--
