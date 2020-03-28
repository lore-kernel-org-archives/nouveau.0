From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question on MME and Compute Subchannel in Kepler+
Date: Fri, 27 Mar 2020 21:32:13 -0400
Message-ID: <CA+MSTo-4LDtfB_mQCU8ECi0BXCAazrdTiHm1BPObyHp=pUV9jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1696290049=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============1696290049==
Content-Type: multipart/alternative; boundary="000000000000505c7c05a1e037ee"

--000000000000505c7c05a1e037ee
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I've been trying to adapt a switch emulator to emulate nouveau's compute.
We've been told some things like indirect dispatch use the MME in Nouveau,
however, looking at NVIDIA's open gpu documentation there's no MME in
compute engine since Kepler.
https://github.com/NVIDIA/open-gpu-doc/blob/master/classes/compute/clb1c0.h MME
for compute should still exist because of the presence of MME Shadow Memory
Scratch registers.

How does MME for Compute works on Kepler+ ? Does it use the 3D Subchannel?
if so how do I know when its targeting the Compute Subchannel?

--000000000000505c7c05a1e037ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div><div>I&#39;ve bee=
n trying to adapt a switch emulator to emulate=C2=A0nouveau&#39;s compute. =
We&#39;ve been told some things like indirect dispatch use the MME in Nouve=
au, however, looking at NVIDIA&#39;s open gpu documentation there&#39;s no =
MME in compute engine since Kepler.=C2=A0<a href=3D"https://github.com/NVID=
IA/open-gpu-doc/blob/master/classes/compute/clb1c0.h">https://github.com/NV=
IDIA/open-gpu-doc/blob/master/classes/compute/clb1c0.h</a>=C2=A0MME for com=
pute should still exist because of the presence of MME Shadow Memory Scratc=
h registers.=C2=A0</div><div><br></div><div>How does MME for Compute works =
on Kepler+=C2=A0? Does it use the 3D Subchannel? if so how do I know when i=
ts targeting=C2=A0the Compute Subchannel?</div><div dir=3D"ltr" class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"></div></div>

--000000000000505c7c05a1e037ee--

--===============1696290049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1696290049==--
