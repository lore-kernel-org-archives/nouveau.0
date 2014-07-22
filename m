From: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence implementation for
 fences
Date: Tue, 22 Jul 2014 16:39:48 +0200
Message-ID: <53CE77B4.6020801@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com> <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local> <53CE56ED.4040109@vodafone.de>
 <53CE6FB0.90500@canonical.com> <53CE7410.3090603@amd.com>
 <53CE74B5.3000201@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CE74B5.3000201@canonical.com>
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

Am 22.07.2014 16:27, schrieb Maarten Lankhorst:
> op 22-07-14 16:24, Christian K=F6nig schreef:
>>> No, you really shouldn't be doing much in the check anyway, it's meant =
to be a lightweight check. If you're not ready yet because of a lockup simp=
ly return not signaled yet.
>> It's not only the lockup case from radeon I have in mind here. For users=
pace queues it might be necessary to call copy_from_user to figure out if a=
 fence is signaled or not.
>>
>> Returning false all the time is probably not a good idea either.
> Having userspace implement a fence sounds like an awful idea, why would y=
ou want to do that?

Marketing moves in mysterious ways. Don't ask me, but that the direction =

it currently moves with userspace queues and IOMMU etc...

> A fence could be exported to userspace, but that would only mean it can w=
ait for it to be signaled with an interface like poll..

Yeah agree totally, but the point for the fence interface is that I =

can't predict what's necessary to check if a fence is signaled or not on =

future hardware.

For the currently available radeon hardware I can say that reading a =

value from a kernel page is pretty much all you need. But for older =

hardware that was reading from a register which might become very tricky =

if the hardware is power off or currently inside a reset cycle.

Because off this I would avoid any such interface if it's not absolutely =

required by some use case, and currently I don't see this requirement =

because the functionality you want to archive could be implemented =

without this.

Christian.

>
> ~Maarten
>
