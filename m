From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] GPU-DRM-nouveau: Delete unnecessary braces
Date: Wed, 21 Sep 2016 08:49:55 +0100
Message-ID: <086ff731-e6d2-6017-a6b2-2625174db40b@spliet.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
 <74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1089384891=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
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

This is a multi-part message in MIME format.
--===============1089384891==
Content-Type: multipart/alternative;
 boundary="------------79EB220FA584F2E81902A2A7"

This is a multi-part message in MIME format.
--------------79EB220FA584F2E81902A2A7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Comments in-line. Thanks.

Roy

Op 21-09-16 om 08:26 schreef SF Markus Elfring:
> From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Date: Wed, 21 Sep 2016 08:28:08 +0200
>
> Do not use curly brackets at four source code places
> where a single statement should be sufficient.
>
> Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
> index dbaf577..cb50539 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
> @@ -127,12 +127,11 @@ gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
>   	}
>   
>   	/* Find the best value for 0x1111e0 */
> -	for (i = 0; i < 4; i++) {
> +	for (i = 0; i < 4; i++)
>   		if (bins[i] > qty) {
>   			bin = i + 3;
>   			qty = bins[i];
>   		}
> -	}
I'm not a fan of removing the braces around a multi-line statement, 
despite being functionally correct. It obscures the program structure on 
displays with a low effective vertical resolution.
>   
>   	train->r_100720 = 0;
>   	for (i = 0; i < 8; i++) {
> @@ -729,9 +728,8 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
>   		ram_mask(fuc, 0x1007e0, 0x22222222, r100760);
>   	}
>   
> -	if (device->chipset == 0xa3 && freq > 500000) {
> +	if (device->chipset == 0xa3 && freq > 500000)
>   		ram_mask(fuc, 0x100700, 0x00000006, 0x00000000);
> -	}
>   
>   	/* Final switch */
>   	if (mclk.pll) {
> @@ -745,12 +743,11 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
>   	ram_nsec(fuc, 2000);
>   
>   	/* Set RAM MR parameters and timings */
> -	for (i = 2; i >= 0; i--) {
> +	for (i = 2; i >= 0; i--)
>   		if (ram_rd32(fuc, mr[i]) != ram->base.mr[i]) {
>   			ram_wr32(fuc, mr[i], ram->base.mr[i]);
>   			ram_nsec(fuc, 1000);
>   		}
> -	}
Idem.
>   
>   	ram_wr32(fuc, 0x100220[3], timing[3]);
>   	ram_wr32(fuc, 0x100220[1], timing[1]);
> @@ -838,11 +835,10 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
>   	if (!next->bios.ramcfg_DLLoff)
>   		nvkm_sddr2_dll_reset(fuc);
>   
> -	if (ram->base.type == NVKM_RAM_TYPE_GDDR3) {
> +	if (ram->base.type == NVKM_RAM_TYPE_GDDR3)
>   		ram_nsec(fuc, 31000);
> -	} else {
> +	else
>   		ram_nsec(fuc, 14000);
> -	}
>   
>   	if (ram->base.type == NVKM_RAM_TYPE_DDR3) {
>   		ram_wr32(fuc, 0x100264, 0x1);


--------------79EB220FA584F2E81902A2A7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">Comments in-line</font>. <font size="-1">Thanks.<br>
      <br>
      Roy</font><br>
    <br>
    <div class="moz-cite-prefix">Op 21-09-16 om 08:26 schreef SF Markus
      Elfring:<br>
    </div>
    <blockquote
      cite="mid:74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org"
      type="cite">
      <pre wrap="">From: Markus Elfring <a class="moz-txt-link-rfc2396E" href="mailto:elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org">&lt;elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org&gt;</a>
Date: Wed, 21 Sep 2016 08:28:08 +0200

Do not use curly brackets at four source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <a class="moz-txt-link-rfc2396E" href="mailto:elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org">&lt;elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org&gt;</a>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index dbaf577..cb50539 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -127,12 +127,11 @@ gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
 	}
 
 	/* Find the best value for 0x1111e0 */
-	for (i = 0; i &lt; 4; i++) {
+	for (i = 0; i &lt; 4; i++)
 		if (bins[i] &gt; qty) {
 			bin = i + 3;
 			qty = bins[i];
 		}
-	}</pre>
    </blockquote>
    <font size="-1">I'm not a fan of removing the braces around a
      multi-line statement, despite being functionally correct. It
      obscures the program structure on displays with a low effective
      vertical resolution.</font><br>
    <blockquote
      cite="mid:74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org"
      type="cite">
      <pre wrap=""> 
 	train-&gt;r_100720 = 0;
 	for (i = 0; i &lt; 8; i++) {
@@ -729,9 +728,8 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
 		ram_mask(fuc, 0x1007e0, 0x22222222, r100760);
 	}
 
-	if (device-&gt;chipset == 0xa3 &amp;&amp; freq &gt; 500000) {
+	if (device-&gt;chipset == 0xa3 &amp;&amp; freq &gt; 500000)
 		ram_mask(fuc, 0x100700, 0x00000006, 0x00000000);
-	}
 
 	/* Final switch */
 	if (mclk.pll) {
@@ -745,12 +743,11 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
 	ram_nsec(fuc, 2000);
 
 	/* Set RAM MR parameters and timings */
-	for (i = 2; i &gt;= 0; i--) {
+	for (i = 2; i &gt;= 0; i--)
 		if (ram_rd32(fuc, mr[i]) != ram-&gt;base.mr[i]) {
 			ram_wr32(fuc, mr[i], ram-&gt;base.mr[i]);
 			ram_nsec(fuc, 1000);
 		}
-	}</pre>
    </blockquote>
    <font size="-1">Idem.</font><br>
    <blockquote
      cite="mid:74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org"
      type="cite">
      <pre wrap=""> 
 	ram_wr32(fuc, 0x100220[3], timing[3]);
 	ram_wr32(fuc, 0x100220[1], timing[1]);
@@ -838,11 +835,10 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
 	if (!next-&gt;bios.ramcfg_DLLoff)
 		nvkm_sddr2_dll_reset(fuc);
 
-	if (ram-&gt;base.type == NVKM_RAM_TYPE_GDDR3) {
+	if (ram-&gt;base.type == NVKM_RAM_TYPE_GDDR3)
 		ram_nsec(fuc, 31000);
-	} else {
+	else
 		ram_nsec(fuc, 14000);
-	}
 
 	if (ram-&gt;base.type == NVKM_RAM_TYPE_DDR3) {
 		ram_wr32(fuc, 0x100264, 0x1);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------79EB220FA584F2E81902A2A7--

--===============1089384891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1089384891==--
