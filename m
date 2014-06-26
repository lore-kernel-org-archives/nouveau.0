From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] drm/nouveau: support for probing
 platform devices
Date: Thu, 26 Jun 2014 17:10:53 +0200
Message-ID: <53AC37FD.4070007@free.fr>
References: <1403760814-26148-1-git-send-email-acourbot@nvidia.com>
 <1403760814-26148-2-git-send-email-acourbot@nvidia.com>
 <53ABE819.7000506@nimrod-online.com>
 <CAAVeFuJesHEpNyqtMq+4HmRWNaW72bfrR_ODXD3=DtMKxx_PKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJesHEpNyqtMq+4HmRWNaW72bfrR_ODXD3=DtMKxx_PKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 26/06/2014 16:58, Alexandre Courbot a =E9crit :
> On Thu, Jun 26, 2014 at 6:30 PM, Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org> wro=
te:
>> op 26-06-14 07:33, Alexandre Courbot schreef:
>>
>>> Add a platform driver for Nouveau devices declared using the device tree
>>> or platform data. This driver currently supports GK20A on Tegra
>>> platforms and is only compiled for these platforms if Nouveau is
>>> enabled.
>>>
>>> Nouveau will probe the chip type itself using the BOOT0 register, so all
>>> this driver really needs to do is to make sure the module is powered and
>>> its clocks active before calling nouveau_drm_platform_probe().
>>>
>>> Heavily based on work done by Thierry Reding.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>    drivers/gpu/drm/nouveau/Kconfig            |   8 ++
>>>    drivers/gpu/drm/nouveau/Makefile           |   3 +
>>>    drivers/gpu/drm/nouveau/nouveau_drm.c      |  53 ++++++---
>>>    drivers/gpu/drm/nouveau/nouveau_drm.h      |   8 ++
>>>    drivers/gpu/drm/nouveau/nouveau_platform.c | 182
>>> +++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/nouveau/nouveau_platform.h |  49 ++++++++
>>>    6 files changed, 289 insertions(+), 14 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c
>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.h
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/Kconfig
>>> b/drivers/gpu/drm/nouveau/Kconfig
>>> index 637c29a33127..d4abaebfc35b 100644
>>> --- a/drivers/gpu/drm/nouveau/Kconfig
>>> +++ b/drivers/gpu/drm/nouveau/Kconfig
>>> @@ -25,6 +25,14 @@ config DRM_NOUVEAU
>>>          help
>>>            Choose this option for open-source nVidia support.
>>>    +config NOUVEAU_PLATFORM_DRIVER
>>> +       tristate "Nouveau (nVidia) integrated GPUs"
>>
>> Maybe a little nit, but isn't the recommended capitalisation nowadays NV=
IDIA
>> instead of nVidia?
>
> That's correct, I just copied that text from another Kconfig entry.
> This capitalization is also used elsewhere in Nouveau, so please allow
> me to fix this one in a separate patch. ;)
>
>> Also, integrated GPUs sounds like this is required for
>> the ION IGPs as well, although I reckon the dependencies on the next line
>> will hide it from the reader on x86.
>
> I don't know what word could better describe GK20A - we need to make
> the distinction because you can also use discrete GPUs on Tegra. Any
> better suggestion?

SoCs?
