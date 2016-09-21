From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/5] GPU-DRM-nouveau: Fine-tuning for five
 function implementations
Date: Wed, 21 Sep 2016 09:09:50 +0100
Message-ID: <1094e314-f465-43ba-65d0-32ec5ed55d67@spliet.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0440391143=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
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
--===============0440391143==
Content-Type: multipart/alternative;
 boundary="------------49D91AEAD1D8C44776084311"

This is a multi-part message in MIME format.
--------------49D91AEAD1D8C44776084311
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for these style fixes. Patches 1 and 2 seem good at first sight. 
Not acking because I haven't tested the patches and the implementation 
of kmalloc_array() appears to slightly differ from kmalloc(). This 
difference *should* only affect allocations larger than the ones in 
patch 1 and 2, but I'd like to see these changes tested before I can 
sleep soundly!

Patches 4 and 5 are:

Reviewed-by: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>


Op 21-09-16 om 08:23 schreef SF Markus Elfring:
> From: Markus Elfring<elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Date: Wed, 21 Sep 2016 09:09:09 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (5):
>    Use kmalloc_array() in nvbios_iccsense_parse()
>    Use kmalloc_array() in gt215_link_train()
>    Delete unnecessary braces
>    Adjust a kzalloc() call in gt215_ram_new()
>    Add space after an "if"
>
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c |  4 +++-
>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c   | 21 +++++++++------------
>   2 files changed, 12 insertions(+), 13 deletions(-)
>


--------------49D91AEAD1D8C44776084311
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font size="-1">Thanks for these style fixes. Patches 1 and 2
        seem good at first sight. Not acking because I haven't tested
        the patches and the implementation of kmalloc_array() appears to
        slightly differ from kmalloc(). This difference *should* only
        affect allocations larger than the ones in patch 1 and 2, but
        I'd like to see these changes tested before I can sleep soundly!</font></p>
    <p><font size="-1">Patches 4 and 5 are:</font></p>
    <p><font size="-1">Reviewed-by: Roy Spliet <a
          class="moz-txt-link-rfc2396E" href="mailto:nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org">&lt;nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org&gt;</a></font></p>
    <br>
    <div class="moz-cite-prefix">Op 21-09-16 om 08:23 schreef SF Markus
      Elfring:<br>
    </div>
    <blockquote
      cite="mid:5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org"
      type="cite">
      <pre wrap="">From: Markus Elfring <a class="moz-txt-link-rfc2396E" href="mailto:elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org">&lt;elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org&gt;</a>
Date: Wed, 21 Sep 2016 09:09:09 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in nvbios_iccsense_parse()
  Use kmalloc_array() in gt215_link_train()
  Delete unnecessary braces
  Adjust a kzalloc() call in gt215_ram_new()
  Add space after an "if"

 drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c |  4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c   | 21 +++++++++------------
 2 files changed, 12 insertions(+), 13 deletions(-)

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------49D91AEAD1D8C44776084311--

--===============0440391143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0440391143==--
