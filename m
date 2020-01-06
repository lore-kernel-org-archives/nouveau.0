From: James Jones <jajones@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
Date: Mon, 6 Jan 2020 11:18:14 -0800
Message-ID: <b273ad88-d246-3395-2fd0-8188bc41a127@nvidia.com>
References: <20191217004520.2404-1-jajones@nvidia.com>
 <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 1/5/20 5:30 PM, Ben Skeggs wrote:
> On Tue, 17 Dec 2019 at 10:44, James Jones <jajones@nvidia.com> wrote:
>>
>> This series modifies the NV5x+ nouveau display backends to advertise
>> appropriate format modifiers on their display planes in atomic mode
>> setting blobs.
>>
>> Corresponding modifications to Mesa/userspace are available here:
>>
>> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
>>
>> But those need a bit of cleanup before they're ready to submit.
>>
>> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
>> using various formats and all the exposed format modifiers, plus some
>> negative testing with invalid ones.
>>
>> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
>> Linear DRM format mod" patch submitted to dri-devel.
>>
>> v2: Used Tesla family instead of NV50 chipset compare to avoid treating
>>      oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
>>      of compares with chipset number in the series were audited, deemed
>>      safe, and left as-is for consistency with existing code.
> Hey James,
> 
> These look OK to me, with the minor issue I mentioned on one of the
> patches dealt with.  I'll hold off merging anything until I get the
> go-ahead that the modifier definitions are definitely set in stone /
> userspace is ready for inclusion.

Thanks for having a look.  I'll try to get the userspace changes 
finalized soon.  I think from the NV side, we consider the modifier 
definition itself (the v3 version of the patch) final, so if there's any 
stand-alone feedback from yourself or other drm/nouveau developers on 
that layout, we'd be eager to hear it.  I don't want it rushed in, but 
we do have several projects blocked on getting that approved & committed.

I assume the sequencing should be:

* Fix the minor issue you identified here/complete review of nouveau 
kernel patches
* Complete review of the related TegraDRM new modifier support patch
* Finalize and complete review of userspace/Mesa nouveau modifier 
support patches
* Get drm_fourcc.h updates committed
* Get these patches and TegraDRM patches committed
* Integrate final drm_fourcc.h to Mesa patches and get Mesa patches 
committed

Does that sound right to you?

Thanks,
-James

> Thanks,
> Ben.
> 
>>
>> James Jones (3):
>>    drm/nouveau: Add format mod prop to base/ovly/nvdisp
>>    drm/nouveau: Check framebuffer size against bo
>>    drm/nouveau: Support NVIDIA format modifiers
>>
>>   drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
>>   drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
>>   drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
>>   7 files changed, 272 insertions(+), 8 deletions(-)
>>
>> --
>> 2.17.1
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
