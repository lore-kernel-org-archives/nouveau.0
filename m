From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad
	arguments to nouveau_vma_getmap
Date: Wed, 28 Aug 2013 09:44:15 +0200
Message-ID: <521DAA4F.8030503@canonical.com>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<20130823202042.GS2924@reaktio.net>
	<20130828062948.GE2924@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130828062948.GE2924-GxtO3QLqHcLR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Op 28-08-13 08:29, Pasi K=E4rkk=E4inen schreef:
> On Fri, Aug 23, 2013 at 11:20:42PM +0300, Pasi K=E4rkk=E4inen wrote:
>> On Thu, Aug 22, 2013 at 09:12:40AM +0200, Maarten Lankhorst wrote:
>>> Op 22-08-13 02:10, Ilia Mirkin schreef:
>>>> The code expects non-VRAM mem nodes to have a pages list. If that's not
>>>> set, it will do a null deref down the line. Warn on that condition and
>>>> return an error.
>>>>
>>>> See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
>>>>
>>>> Reported-by: Pasi K=E4rkk=E4inen <pasik-X3B1VOXEql0@public.gmane.org>
>>>> Tested-by: Pasi K=E4rkk=E4inen <pasik-X3B1VOXEql0@public.gmane.org>
>>>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>>>> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.8+
>>>> ---
>>>>
>>>> I don't exactly understand what's going on, but this is just a
>>>> straightforward way to avoid a null deref that you see happens in the
>>>> bug. I haven't figured out the root cause of this, but it's getting
>>>> well into the "I have no idea how TTM works" space. However this seems
>>>> like a bit of defensive programming -- nouveau_vm_map_sg will pass
>>>> node->pages as a list down, which will be dereferenced by
>>>> nvc0_vm_map_sg. Perhaps the other arguments should make that
>>>> dereferencing not happen, but it definitely was happening here, as you
>>>> can see in the bug.
>>>>
>>>> Ben/Maarten, I'll let you judge whether this check is appropriate,
>>>> since like I hope I was able to convey above, I'm just not really sure=
 :)
>>> Not it really isn't appropriate..
>>>
>>> You'd have to call call nouveau_vm_map_sg_table instead, the only place=
 that doesn't handle that correctly
>>> is where it's not expected to be called.
>>>
>>> Here, have a completely untested patch to fix things...
>>>
>> Maarten: I've been testing this stuff with Linux 3.10.x, so I had to mod=
ify the patch a bit to make it apply there.. =

>> I've attached the modified copy that applies to 3.10.9, hopefully I did =
the backport correctly.
>>
>> With Linux 3.10.9 and the patch applied the kernel doesn't crash anymore=
, and I get this error in dmesg:
>>
>> [   76.105643] nouveau W[     DRM] Trying to create a fb in vram with va=
lid_domains=3D00000004
>>
>> Does that help? =

>>
> Any comments? =

>
> Maarten's patch works for me, I get that warning instead of a kernel cras=
h,
> but it's also a bigger change that doesn't apply to older kernels as-is. =

>
> Ilia's original patch in this thread can be applied to older kernels as-i=
s,
> and it also prevents the kernel crash from happening.
>
> Should we get both applied, so Ilia's patch can be CC'd to stable ? =

>
You haven't understood the root cause then. You're trying to move an IMPORT=
ED dma-buf into VRAM.
Doing so would seem to work, but at that point it's no longer a dma-buf so =
changes done by the exporter
would not show up in nouveau because they no longer refer to the same piece=
 of memory.

Failing is the only right option here.

~Maarten
