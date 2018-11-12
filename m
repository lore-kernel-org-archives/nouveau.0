From: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question on IPA on GM107
Date: Mon, 12 Nov 2018 19:10:57 -0400
Message-ID: <CA+MSTo8ZOXbqEMfmz_Cv8gQ90smPNgpkNMWbGRG4uNc6fmDkHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1944903471=="
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

--===============1944903471==
Content-Type: multipart/alternative; boundary="000000000000f12f1a057a7fd010"

--000000000000f12f1a057a7fd010
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So I'm trying to track an special value in IPA instruction generation.
https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/cod=
egen/nv50_ir_emit_gm107.cpp#L2561

Register on 0x14 (20) is set to some source on "insn->op =3D=3D OP_PINTERP"

I have found while emulation that such value can be set sometimes to
FragCoord.w, I don't however know what that value is and how to represent
it on glsl. Do you guys know where does that value come from and what it
means?

--=20
Atentamente,
*Fernando A. Sahmkow*
*M=C3=B3vil*: +584242280286
*Correo*: fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--000000000000f12f1a057a7fd010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">So I&#39;m trying to track an special val=
ue in IPA instruction generation.<div><a href=3D"https://cgit.freedesktop.o=
rg/mesa/mesa/tree/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cp=
p#L2561">https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/no=
uveau/codegen/nv50_ir_emit_gm107.cpp#L2561</a></div><div><br></div><div>Reg=
ister on 0x14 (20) is set to some source on &quot;<span style=3D"color:rgb(=
0,0,0);font-size:13.3333px">insn-&gt;op =3D=3D OP_PINTERP&quot;</span></div=
><div><font color=3D"#000000"><span style=3D"font-size:13.3333px"><br></spa=
n></font></div><div><font color=3D"#000000"><span style=3D"font-size:13.333=
3px">I have found while emulation that such value can be set sometimes to F=
ragCoord.w, I don&#39;t however know what that value is and how to represen=
t it on glsl. Do you guys know where does that value come from and what it =
means?<br></span></font><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div><div><div><div><div><div><div>Atentamen=
te,</div></div></div></div></div></div></div><div><span style=3D"color:rgb(=
0,0,255)"><b>Fernando A. Sahmkow</b></span></div><div><b>M=C3=B3vil</b>:=C2=
=A0<a value=3D"+584242280286" style=3D"color:rgb(17,85,204)">+584242280286<=
/a><br></div><b>Correo</b>:=C2=A0<a href=3D"mailto:fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" st=
yle=3D"color:rgb(17,85,204)" target=3D"_blank">fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a></di=
v></div></div></div></div>

--000000000000f12f1a057a7fd010--

--===============1944903471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1944903471==--
