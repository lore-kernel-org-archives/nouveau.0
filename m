From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/3] drm/nouveau: set DMA mask before
 mapping scratch page
Date: Mon, 17 Oct 2016 08:02:57 +0200
Message-ID: <CAEXux-bASTvWvkShPL3sUMbLLwufWQZW+ZHhzbE8bPeeYBVu6g@mail.gmail.com>
References: <1475768970-32512-1-git-send-email-ard.biesheuvel@linaro.org>
 <CAAVeFuKJ-Qmdnz1kmDtqo+P6m+aGW+DzVDkVTn+9ZLP94zO5dw@mail.gmail.com>
 <CAKv+Gu9UEOCQpU18X-x8z5HeJoxe24uD8R6nHXrAKj9wPyQ7hg@mail.gmail.com>
 <CAEXux-Y-CgRg-G0CrUtSz6A3Ooz0VPKJnzmK-J9DdXs3GaUZqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0112448826=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEXux-Y-CgRg-G0CrUtSz6A3Ooz0VPKJnzmK-J9DdXs3GaUZqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0112448826==
Content-Type: multipart/alternative; boundary=001a113f28b6e11a3e053f09532b

--001a113f28b6e11a3e053f09532b
Content-Type: text/plain; charset=UTF-8

Hi Ard,

the official nouveau tree is here: https://github.com/skeggsb/nouveau

But ben usually takes care of everything if you post the patches on the ML.
No idea what you discussed internally though, but alex also posts his suff
here.

On 16 Oct 2016 22:12, "Ard Biesheuvel" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

On 7 October 2016 at 09:12, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Oct 7, 2016 at 12:49 AM, Ard Biesheuvel
> <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> This v4 is now a 3 piece series (since v4), after Alexandre pointed out
that
>> both GF 100 and NV50 are affected by the same issue, and that a related
issue
>> has been solved already for Tegra in commit 9d0394c6bed5
>> ("drm/nouveau/instmem/gk20a: set DMA mask early").
>>
>> The issue that this series addresses is the fact that the Nouveau driver
>> invokes the DMA API before setting the DMA mask. In both cases addressed
>> here, these are simply static bidirectional mappings of scratch pages
whose
>> purpose is not well understood, and in most cases, it does not matter
that
>> these pages are always allocated below 4 GB even if the hardware can
access
>> memory much higher up.
>>
>> However, on platforms without any RAM below 4 GB, the preliminary DMA
mask
>> of 32 is preventing the nouveau driver from loading on GF100 and NV50
>> hardware with an error like the following one:
>>
>>    nouveau 0000:02:00.0: enabling device (0000 -> 0003)
>>    nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)
>>    nouveau 0000:02:00.0: bios: version 70.18.a6.00.00
>>    nouveau 0000:02:00.0: fb ctor failed, -14
>>    nouveau: probe of 0000:02:00.0 failed with error -14
>>
>> So fix this by setting a preliminary DMA mask based on the MMU device
'dma_bits'
>> property (patch #1), and postpone mapping the scratch pages to the
respective
>> FB .init() hooks. (#2 and #3)
>>
>> v5: move setting of preliminary DMA mask to nvkm_device_pci_new() (#1)
>>     move allocation and DMA mapping of scratch pages to .oneinit hooks
(#2, #3)
>> v4: split and move dma_set_mask to probe hook (Alexander)
>> v3: rework code to get rid of DMA_ERROR_CODE references, which is not
>>     defined on all architectures
>> v2: replace incorrect comparison of dma_addr_t type var against NULL
>>
>> Ard Biesheuvel (3):
>>   drm/nouveau: set streaming DMA mask early
>>   drm/nouveau/fb/gf100: defer DMA mapping of scratch page to oneinit()
>>     hook
>>   drm/nouveau/fb/nv50: defer DMA mapping of scratch page to oneinit()
>>     hook
>
> The series,
>
> Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>

Thank you Alexandre.

So is there a nouveau subtree this should go into? Or is it up to Dave
to pull it into drm?

Regards,
Ard.
_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--001a113f28b6e11a3e053f09532b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Ard,</p>
<p dir=3D"ltr">the official nouveau tree is here: <a href=3D"https://github=
.com/skeggsb/nouveau">https://github.com/skeggsb/nouveau</a></p>
<p dir=3D"ltr">But ben usually takes care of everything if you post the pat=
ches on the ML. No idea what you discussed internally though, but alex also=
 posts his suff here.</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 16 Oct 2016 22=
:12, &quot;Ard Biesheuvel&quot; &lt;<a href=3D"mailto:ard.biesheuvel@linaro=
.org">ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br type=3D"attribution"><blo=
ckquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div class=3D"elided-text">On 7 October 2016 at 09:12,=
 Alexandre Courbot &lt;<a href=3D"mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
</a>&gt; wrote:<br>
&gt; On Fri, Oct 7, 2016 at 12:49 AM, Ard Biesheuvel<br>
&gt; &lt;<a href=3D"mailto:ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">ard.biesheuvel@linaro=
.org</a>&gt; wrote:<br>
&gt;&gt; This v4 is now a 3 piece series (since v4), after Alexandre pointe=
d out that<br>
&gt;&gt; both GF 100 and NV50 are affected by the same issue, and that a re=
lated issue<br>
&gt;&gt; has been solved already for Tegra in commit 9d0394c6bed5<br>
&gt;&gt; (&quot;drm/nouveau/instmem/gk20a: set DMA mask early&quot;).<br>
&gt;&gt;<br>
&gt;&gt; The issue that this series addresses is the fact that the Nouveau =
driver<br>
&gt;&gt; invokes the DMA API before setting the DMA mask. In both cases add=
ressed<br>
&gt;&gt; here, these are simply static bidirectional mappings of scratch pa=
ges whose<br>
&gt;&gt; purpose is not well understood, and in most cases, it does not mat=
ter that<br>
&gt;&gt; these pages are always allocated below 4 GB even if the hardware c=
an access<br>
&gt;&gt; memory much higher up.<br>
&gt;&gt;<br>
&gt;&gt; However, on platforms without any RAM below 4 GB, the preliminary =
DMA mask<br>
&gt;&gt; of 32 is preventing the nouveau driver from loading on GF100 and N=
V50<br>
&gt;&gt; hardware with an error like the following one:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 nouveau 0000:02:00.0: enabling device (0000 -&gt; 000=
3)<br>
&gt;&gt;=C2=A0 =C2=A0 nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)<br>
&gt;&gt;=C2=A0 =C2=A0 nouveau 0000:02:00.0: bios: version 70.18.a6.00.00<br=
>
&gt;&gt;=C2=A0 =C2=A0 nouveau 0000:02:00.0: fb ctor failed, -14<br>
&gt;&gt;=C2=A0 =C2=A0 nouveau: probe of 0000:02:00.0 failed with error -14<=
br>
&gt;&gt;<br>
&gt;&gt; So fix this by setting a preliminary DMA mask based on the MMU dev=
ice &#39;dma_bits&#39;<br>
&gt;&gt; property (patch #1), and postpone mapping the scratch pages to the=
 respective<br>
&gt;&gt; FB .init() hooks. (#2 and #3)<br>
&gt;&gt;<br>
&gt;&gt; v5: move setting of preliminary DMA mask to nvkm_device_pci_new() =
(#1)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0move allocation and DMA mapping of scratch page=
s to .oneinit hooks (#2, #3)<br>
&gt;&gt; v4: split and move dma_set_mask to probe hook (Alexander)<br>
&gt;&gt; v3: rework code to get rid of DMA_ERROR_CODE references, which is =
not<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0defined on all architectures<br>
&gt;&gt; v2: replace incorrect comparison of dma_addr_t type var against NU=
LL<br>
&gt;&gt;<br>
&gt;&gt; Ard Biesheuvel (3):<br>
&gt;&gt;=C2=A0 =C2=A0drm/nouveau: set streaming DMA mask early<br>
&gt;&gt;=C2=A0 =C2=A0drm/nouveau/fb/gf100: defer DMA mapping of scratch pag=
e to oneinit()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0hook<br>
&gt;&gt;=C2=A0 =C2=A0drm/nouveau/fb/nv50: defer DMA mapping of scratch page=
 to oneinit()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0hook<br>
&gt;<br>
&gt; The series,<br>
&gt;<br>
&gt; Reviewed-by: Alexandre Courbot &lt;<a href=3D"mailto:acourbot@nvidia.c=
om">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt;<br>
<br>
</div>Thank you Alexandre.<br>
<br>
So is there a nouveau subtree this should go into? Or is it up to Dave<br>
to pull it into drm?<br>
<br>
Regards,<br>
Ard.<br>
<div class=3D"elided-text">______________________________<wbr>_____________=
____<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</div></blockquote></div><br></div>

--001a113f28b6e11a3e053f09532b--

--===============0112448826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0112448826==--
