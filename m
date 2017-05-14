From: Max Ehrlich <max.ehr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GP10x failures on 4.12rc1
Date: Sun, 14 May 2017 19:09:31 +0000
Message-ID: <CAPyx93zPxNbK+Nfr53UaEbQcNgcXhDL7b26MK0ZJYLmiSvHJSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0716342590=="
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

--===============0716342590==
Content-Type: multipart/alternative; boundary="001a114222d650db67054f80ae0f"

--001a114222d650db67054f80ae0f
Content-Type: text/plain; charset="UTF-8"

I have two nvidia pascal cards on my machine, a GP107M (GeForce GTK 1050
Mobile) and a GP104 (GTX 1080 connected via thunderbolt).

With 4.12 RC1 (which I understand to include signed firmware from nVidia)
neither of these cards work. Here is the output from demsg when I modprobe
nouveau.

[  112.565946] nouveau: detected PR support, will not use DSM
[  112.565966] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[  112.566063] nouveau 0000:01:00.0: unknown chipset (ffffffff)
[  112.566067] nouveau: probe of 0000:01:00.0 failed with error -12
[  112.566245] nouveau 0000:0b:00.0: NVIDIA GP104 (134000a1)
[  112.850486] nouveau 0000:0b:00.0: bios: version 86.04.17.00.01
[  112.855307] nouveau 0000:0b:00.0: Direct firmware load for
nvidia/gp104/gr/sw_nonctx.bin failed with error -2
[  112.855310] nouveau 0000:0b:00.0: gr: failed to load gr/sw_nonctx
[  112.855315] nouveau 0000:0b:00.0: gr ctor failed, -2
[  112.855322] nouveau: probe of 0000:0b:00.0 failed with error -2

Let me know what else I can provide to help diagnose the issue, I am not
familiar with the debugging process for this kind of thing

--001a114222d650db67054f80ae0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have two nvidia pascal cards on my machine, a GP107=
M (GeForce GTK 1050 Mobile) and a GP104 (GTX 1080 connected via thunderbolt=
).<br></div><div><br></div><div>With 4.12 RC1 (which I understand to includ=
e signed firmware from nVidia) neither of these cards work. Here is the out=
put from demsg when I modprobe nouveau.</div><div><br></div><div>[ =C2=A011=
2.565946] nouveau: detected PR support, will not use DSM</div><div>[ =C2=A0=
112.565966] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)</div><d=
iv>[ =C2=A0112.566063] nouveau 0000:01:00.0: unknown chipset (ffffffff)</di=
v><div>[ =C2=A0112.566067] nouveau: probe of 0000:01:00.0 failed with error=
 -12</div><div>[ =C2=A0112.566245] nouveau 0000:0b:00.0: NVIDIA GP104 (1340=
00a1)</div><div>[ =C2=A0112.850486] nouveau 0000:0b:00.0: bios: version 86.=
04.17.00.01</div><div>[ =C2=A0112.855307] nouveau 0000:0b:00.0: Direct firm=
ware load for nvidia/gp104/gr/sw_nonctx.bin failed with error -2</div><div>=
[ =C2=A0112.855310] nouveau 0000:0b:00.0: gr: failed to load gr/sw_nonctx</=
div><div>[ =C2=A0112.855315] nouveau 0000:0b:00.0: gr ctor failed, -2</div>=
<div>[ =C2=A0112.855322] nouveau: probe of 0000:0b:00.0 failed with error -=
2</div><div><br></div><div>Let me know what else I can provide to help diag=
nose the issue, I am not familiar with the debugging process for this kind =
of thing</div></div>

--001a114222d650db67054f80ae0f--

--===============0716342590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0716342590==--
