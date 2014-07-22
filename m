From: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Tue, 22 Jul 2014 17:02:30 +0200
Message-ID: <53CE7D06.2010109@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com> <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local> <53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local> <53CE6AFA.1060807@vodafone.de>
 <53CE78C0.9030408@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CE78C0.9030408@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>, =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>, Dave Airlie <airlied@gmail.com>, Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "Deucher, Alexander" <alexander.deucher@amd.com>
List-Id: nouveau.vger.kernel.org

Am 22.07.2014 16:44, schrieb Maarten Lankhorst:
> op 22-07-14 15:45, Christian K=F6nig schreef:
>> Am 22.07.2014 15:26, schrieb Daniel Vetter:
>>> On Tue, Jul 22, 2014 at 02:19:57PM +0200, Christian K=F6nig wrote:
>>>> Am 22.07.2014 13:57, schrieb Daniel Vetter:
>>>>> On Tue, Jul 22, 2014 at 01:46:07PM +0200, Daniel Vetter wrote:
>>>>>> On Tue, Jul 22, 2014 at 10:43:13AM +0200, Christian K=F6nig wrote:
>>>>>>> Am 22.07.2014 06:05, schrieb Dave Airlie:
>>>>>>>> On 9 July 2014 22:29, Maarten Lankhorst <maarten.lankhorst@canonic=
al.com> wrote:
>>>>>>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/gpu/drm/radeon/radeon.h        |   15 +-
>>>>>>>>>    drivers/gpu/drm/radeon/radeon_device.c |   60 ++++++++-
>>>>>>>>>    drivers/gpu/drm/radeon/radeon_fence.c  |  223 ++++++++++++++++=
++++++++++------
>>>>>>>>>    3 files changed, 248 insertions(+), 50 deletions(-)
>>>>>>>>>
>>>>>>>>   From what I can see this is still suffering from the problem tha=
t we
>>>>>>>> need to find a proper solution to,
>>>>>>>>
>>>>>>>> My summary of the issues after talking to Jerome and Ben and
>>>>>>>> re-reading things is:
>>>>>>>>
>>>>>>>> We really need to work out a better interface into the drivers to =
be
>>>>>>>> able to avoid random atomic entrypoints,
>>>>>>> Which is exactly what I criticized from the very first beginning. G=
ood to
>>>>>>> know that I'm not the only one thinking that this isn't such a good=
 idea.
>>>>>> I guess I've lost context a bit, but which atomic entry point are we
>>>>>> talking about? Afaics the only one that's mandatory is the is
>>>>>> fence->signaled callback to check whether a fence really has been
>>>>>> signalled. It's used internally by the fence code to avoid spurious
>>>>>> wakeups. Afaik that should be doable already on any hardware. If tha=
t's
>>>>>> not the case then we can always track the signalled state in softwar=
e and
>>>>>> double-check in a worker thread before updating the sw state. And wr=
ap
>>>>>> this all up into a special fence class if there's more than one driv=
er
>>>>>> needing this.
>>>>> One thing I've forgotten: The i915 scheduler that's floating around r=
uns
>>>>> its bottom half from irq context. So I really want to be able to check
>>>>> fence state from irq context and I also want to make it possible
>>>>> (possible! not mandatory) to register callbacks which are run from any
>>>>> context asap after the fence is signalled.
>>>> NAK, that's just the bad design I've talked about. Checking fence state
>>>> inside the same driver from interrupt context is OK, because it's the
>>>> drivers interrupt that we are talking about here.
>>>>
>>>> Checking fence status from another drivers interrupt context is what r=
eally
>>>> concerns me here, cause your driver doesn't have the slightest idea if=
 the
>>>> called driver is really capable of checking the fence right now.
>>> I guess my mail hasn't been clear then. If you don't like it we could a=
dd
>>> a bit of glue to insulate the madness and bad design i915 might do from
>>> radeon. That imo doesn't invalidate the overall fence interfaces.
>>>
>>> So what about the following:
>>> - fence->enabling_signaling is restricted to be called from process
>>>     context. We don't use any different yet, so would boild down to add=
ing a
>>>     WARN_ON(in_interrupt) or so to fence_enable_sw_signalling.
>>>
>>> - Make fence->signaled optional (already the case) and don't implement =
it
>>>     in readon (i.e. reduce this patch here). Only downside is that rade=
on
>>>     needs to correctly (i.e. without races or so) call fence_signal. An=
d the
>>>     cross-driver synchronization might be a bit less efficient. Note th=
at
>>>     you can call fence_signal from wherever you want to, so hopefully t=
hat
>>>     doesn't restrict your implementation.
>>>
>>> End result: No one calls into radeon from interrupt context, and this is
>>> guaranteed.
>>>
>>> Would that be something you can agree to?
>> No, the whole enable_signaling stuff should go away. No callback from th=
e driver into the fence code, only the other way around.
>>
>> fence->signaled as well as fence->wait should become mandatory and only =
called from process context without holding any locks, neither atomic nor a=
ny mutex/semaphore (rcu might be ok).
> fence->wait is mandatory, and already requires sleeping.
>
> If .signaled is not implemented there is no guarantee the fence will be
> signaled sometime soon, this is also why enable_signaling exists, to
> allow the driver to flush. I get it that it doesn't apply to radeon and n=
ouveau,
> but for other drivers that could be necessary, like vmwgfx.
>
> Ironically that is also a part of the ttm fence, except it was called flu=
sh there.

Then call it flush again and make it optional like in TTM.

> I would also like to note that ttm_bo_wait currently is also a function t=
hat currently uses is_signaled from atomic_context...

I know, but TTM is only called from inside a single driver, no inter =

driver needs here. We currently even call the internal fence =

implementation from interrupt context as well and at more than one =

occasion assume that TTM only uses radeon fences.

Christian.

> For the more complicated locking worries: Lockdep is your friend, use PRO=
VE_LOCKING and find bugs before they trigger. ;-)
>
>>> Like I've said I think restricting the insanity other people are willing
>>> to live with just because you don't like it isn't right. But it is
>>> certainly right for you to insist on not being forced into any such
>>> design. I think the above would achieve this.
>> I don't think so. If it's just me I would say that I'm just to cautious =
and the idea is still save to apply to the whole kernel.
>>
>> But since Dave, Jerome and Ben seems to have similar concerns I think we=
 need to agree to a minimum and save interface for all drivers.
>>
>> Christian.
>>
