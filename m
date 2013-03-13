From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fix unaligned accesses for SPARC
Date: Tue, 12 Mar 2013 22:18:41 -0500
Message-ID: <CAEk2St=L0goZW-9XfKZx0-ApzO9yKYROtusdqZeoOEB=BB+Esg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0255978903=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0255978903==
Content-Type: multipart/alternative; boundary=20cf300facd3f052fe04d7c5dce5

--20cf300facd3f052fe04d7c5dce5
Content-Type: text/plain; charset=ISO-8859-1

The nouveau driver makes a number of unaligned accesses via the ROM16(),
ROM32() and ROM64() macros which fault on SPARC (but would be transparently
handled by x86 hardware). Making use of get_unaligned() macro fixes the
problem for me.

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h
b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 7ccd28f..92031f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -26,6 +26,8 @@

 #include "nvreg.h"

+#include <asm/unaligned.h>
+
 #define DCB_MAX_NUM_ENTRIES 16
 #define DCB_MAX_NUM_I2C_ENTRIES 16
 #define DCB_MAX_NUM_GPIO_ENTRIES 32
@@ -33,10 +35,10 @@

 #define DCB_LOC_ON_CHIP 0

-#define ROM16(x) le16_to_cpu(*(u16 *)&(x))
-#define ROM32(x) le32_to_cpu(*(u32 *)&(x))
+#define ROM16(x) le16_to_cpu(get_unaligned((u16 *)&(x)))
+#define ROM32(x) le32_to_cpu(get_unaligned((u32 *)&(x)))
 #define ROM48(x) ({ u8 *p = &(x); (u64)ROM16(p[4]) << 32 | ROM32(p[0]); })
-#define ROM64(x) le64_to_cpu(*(u64 *)&(x))
+#define ROM64(x) le64_to_cpu(get_unaligned((u64 *)&(x)))
 #define ROMPTR(d,x) ({            \
        struct nouveau_drm *drm = nouveau_drm((d)); \
        ROM16(x) ? &drm->vbios.data[ROM16(x)] : NULL; \

--20cf300facd3f052fe04d7c5dce5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The nouveau driver makes a number of unaligned accesses via the ROM16(), RO=
M32() and ROM64() macros which fault on SPARC (but would be transparently h=
andled by x86 hardware). Making use of get_unaligned() macro fixes the prob=
lem for me.<div>
<br></div><div><div>diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/d=
rivers/gpu/drm/nouveau/nouveau_bios.h</div><div>index 7ccd28f..92031f6 1006=
44</div><div>--- a/drivers/gpu/drm/nouveau/nouveau_bios.h</div><div>+++ b/d=
rivers/gpu/drm/nouveau/nouveau_bios.h</div>
<div>@@ -26,6 +26,8 @@</div><div><br></div><div>=A0#include &quot;nvreg.h&q=
uot;</div><div><br></div><div>+#include &lt;asm/unaligned.h&gt;</div><div>+=
</div><div>=A0#define DCB_MAX_NUM_ENTRIES 16</div><div>=A0#define DCB_MAX_N=
UM_I2C_ENTRIES 16</div>
<div>=A0#define DCB_MAX_NUM_GPIO_ENTRIES 32</div><div>@@ -33,10 +35,10 @@</=
div><div><br></div><div>=A0#define DCB_LOC_ON_CHIP 0</div><div><br></div><d=
iv>-#define ROM16(x) le16_to_cpu(*(u16 *)&amp;(x))</div><div>-#define ROM32=
(x) le32_to_cpu(*(u32 *)&amp;(x))</div>
<div>+#define ROM16(x) le16_to_cpu(get_unaligned((u16 *)&amp;(x)))</div><di=
v>+#define ROM32(x) le32_to_cpu(get_unaligned((u32 *)&amp;(x)))</div><div>=
=A0#define ROM48(x) ({ u8 *p =3D &amp;(x); (u64)ROM16(p[4]) &lt;&lt; 32 | R=
OM32(p[0]); })</div>
<div>-#define ROM64(x) le64_to_cpu(*(u64 *)&amp;(x))</div><div>+#define ROM=
64(x) le64_to_cpu(get_unaligned((u64 *)&amp;(x)))</div><div>=A0#define ROMP=
TR(d,x) ({ =A0 =A0 =A0 =A0 =A0 =A0\</div><div>=A0 =A0 =A0 =A0 struct nouvea=
u_drm *drm =3D nouveau_drm((d)); \</div>
<div>=A0 =A0 =A0 =A0 ROM16(x) ? &amp;drm-&gt;vbios.data[ROM16(x)] : NULL; \=
</div></div><div><br></div>

--20cf300facd3f052fe04d7c5dce5--

--===============0255978903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0255978903==--
