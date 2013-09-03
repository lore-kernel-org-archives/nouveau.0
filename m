From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Tue, 03 Sep 2013 16:34:56 +0200
Message-ID: <5225F390.3060804@canonical.com>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<20130823202042.GS2924@reaktio.net>
	<20130828062948.GE2924@reaktio.net>
	<521DAA4F.8030503@canonical.com>
	<20130903142006.GH2924@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130903142006.GH2924@reaktio.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>
Cc: nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Op 03-09-13 16:20, Pasi K=E4rkk=E4inen schreef:
> On Wed, Aug 28, 2013 at 09:44:15AM +0200, Maarten Lankhorst wrote:
>> Op 28-08-13 08:29, Pasi K=E4rkk=E4inen schreef:
>>> On Fri, Aug 23, 2013 at 11:20:42PM +0300, Pasi K=E4rkk=E4inen wrote:
>>>> On Thu, Aug 22, 2013 at 09:12:40AM +0200, Maarten Lankhorst wrote:
>>>>> Op 22-08-13 02:10, Ilia Mirkin schreef:
>>>>>> The code expects non-VRAM mem nodes to have a pages list. If that's =
not
>>>>>> set, it will do a null deref down the line. Warn on that condition a=
nd
>>>>>> return an error.
>>>>>>
>>>>>> See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
>>>>>>
>>>>>> Reported-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
>>>>>> Tested-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
>>>>>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>>>>>> Cc: <stable@vger.kernel.org> # 3.8+
>>>>>> ---
>>>>>>
>>>>>> I don't exactly understand what's going on, but this is just a
>>>>>> straightforward way to avoid a null deref that you see happens in the
>>>>>> bug. I haven't figured out the root cause of this, but it's getting
>>>>>> well into the "I have no idea how TTM works" space. However this see=
ms
>>>>>> like a bit of defensive programming -- nouveau_vm_map_sg will pass
>>>>>> node->pages as a list down, which will be dereferenced by
>>>>>> nvc0_vm_map_sg. Perhaps the other arguments should make that
>>>>>> dereferencing not happen, but it definitely was happening here, as y=
ou
>>>>>> can see in the bug.
>>>>>>
>>>>>> Ben/Maarten, I'll let you judge whether this check is appropriate,
>>>>>> since like I hope I was able to convey above, I'm just not really su=
re :)
>>>>> Not it really isn't appropriate..
>>>>>
>>>>> You'd have to call call nouveau_vm_map_sg_table instead, the only pla=
ce that doesn't handle that correctly
>>>>> is where it's not expected to be called.
>>>>>
>>>>> Here, have a completely untested patch to fix things...
>>>>>
>>>> Maarten: I've been testing this stuff with Linux 3.10.x, so I had to m=
odify the patch a bit to make it apply there.. =

>>>> I've attached the modified copy that applies to 3.10.9, hopefully I di=
d the backport correctly.
>>>>
>>>> With Linux 3.10.9 and the patch applied the kernel doesn't crash anymo=
re, and I get this error in dmesg:
>>>>
>>>> [   76.105643] nouveau W[     DRM] Trying to create a fb in vram with =
valid_domains=3D00000004
>>>>
>>>> Does that help? =

>>>>
>>> Any comments? =

>>>
>>> Maarten's patch works for me, I get that warning instead of a kernel cr=
ash,
>>> but it's also a bigger change that doesn't apply to older kernels as-is=
. =

>>>
>>> Ilia's original patch in this thread can be applied to older kernels as=
-is,
>>> and it also prevents the kernel crash from happening.
>>>
>>> Should we get both applied, so Ilia's patch can be CC'd to stable ? =

>>>
>> You haven't understood the root cause then. You're trying to move an IMP=
ORTED dma-buf into VRAM.
>> Doing so would seem to work, but at that point it's no longer a dma-buf =
so changes done by the exporter
>> would not show up in nouveau because they no longer refer to the same pi=
ece of memory.
>>
> Yes, that's true, I don't understand the root cause. =

> That's mostly because I'm not familiar with the nouveau code/internals. =

>
>
>> Failing is the only right option here.
>>
> Sorry but I'm not sure I understand that correctly.. what exactly do you =
suggest? What should fail?
>
>
> Because I'm not familiar with the code (yet) understanding and finding th=
e root cause
> will take time for me.. that's why I was suggesting to meanwhile apply Il=
ia's very simple patch
> from this thread which actually prevents the hard kernel crash from happe=
ning, because it seems =

> like an unharmful fix to have to protect against this kind of bugs (the r=
oot cause) ?
> Or is that unacceptable? =

>
> (To recap: The kernel crash happens very often when trying to use the nou=
veau adapter in Optimus mode, with all kernels at least 3.8+, and it's very=
 annoying that your laptop crashes when trying to enable a nouveau output. =
So Ilia's patch doesn't make the driver working properly, but at least it p=
revents the hard kernel crash from happening. The crash bug is in many kern=
el versions, including the long-term v3.10 tree. I've had the crash happeni=
ng with 3.8.x, 3.9.x and 3.10.x)
The fix probably requires commit fdfb8332651db7a280851dfccfc4f0cff4bcd052 t=
o apply cleanly "drm/nouveau: fix some error-path leaks in fbcon handling c=
ode"

> All comments welcome.
>
> Thanks,
>
> -- Pasi
>
