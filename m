From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence implementation for
 fences
Date: Tue, 22 Jul 2014 16:47:16 +0200
Message-ID: <53CE7974.2010209@canonical.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com> <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local> <53CE56ED.4040109@vodafone.de>
 <53CE6FB0.90500@canonical.com> <53CE7410.3090603@amd.com>
 <53CE74B5.3000201@canonical.com> <53CE77B4.6020801@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CE77B4.6020801@amd.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>, Dave Airlie <airlied@gmail.com>, Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "Deucher, Alexander" <alexander.deucher@amd.com>
List-Id: nouveau.vger.kernel.org

op 22-07-14 16:39, Christian K=F6nig schreef:
> Am 22.07.2014 16:27, schrieb Maarten Lankhorst:
>> op 22-07-14 16:24, Christian K=F6nig schreef:
>>>> No, you really shouldn't be doing much in the check anyway, it's meant=
 to be a lightweight check. If you're not ready yet because of a lockup sim=
ply return not signaled yet.
>>> It's not only the lockup case from radeon I have in mind here. For user=
space queues it might be necessary to call copy_from_user to figure out if =
a fence is signaled or not.
>>>
>>> Returning false all the time is probably not a good idea either.
>> Having userspace implement a fence sounds like an awful idea, why would =
you want to do that?
>
> Marketing moves in mysterious ways. Don't ask me, but that the direction =
it currently moves with userspace queues and IOMMU etc...
>
>> A fence could be exported to userspace, but that would only mean it can =
wait for it to be signaled with an interface like poll..
>
> Yeah agree totally, but the point for the fence interface is that I can't=
 predict what's necessary to check if a fence is signaled or not on future =
hardware.
>
> For the currently available radeon hardware I can say that reading a valu=
e from a kernel page is pretty much all you need. But for older hardware th=
at was reading from a register which might become very tricky if the hardwa=
re is power off or currently inside a reset cycle.
>
> Because off this I would avoid any such interface if it's not absolutely =
required by some use case, and currently I don't see this requirement becau=
se the functionality you want to archive could be implemented without this.
Oh? I've already done that in radeon_fence, there is no way enable_signalin=
g will fiddle with hardware registers during a reset cycle.
I've also made sure that __radeon_fence_is_signaled grabs exclusive_lock in=
 read mode before touching any hw state.

Older hardware also doesn't implement optimus, so I think power off is not =
much of a worry for them, if you could point me at the checking done for th=
at I could make sure that this is the case.

~Maarten
