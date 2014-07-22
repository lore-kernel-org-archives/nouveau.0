From: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence implementation for
 fences
Date: Tue, 22 Jul 2014 10:43:13 +0200
Message-ID: <53CE2421.5040906@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "Deucher, Alexander" <alexander.deucher@amd.com>
List-Id: nouveau.vger.kernel.org

Am 22.07.2014 06:05, schrieb Dave Airlie:
> On 9 July 2014 22:29, Maarten Lankhorst <maarten.lankhorst@canonical.com> wrote:
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>> ---
>>   drivers/gpu/drm/radeon/radeon.h        |   15 +-
>>   drivers/gpu/drm/radeon/radeon_device.c |   60 ++++++++-
>>   drivers/gpu/drm/radeon/radeon_fence.c  |  223 ++++++++++++++++++++++++++------
>>   3 files changed, 248 insertions(+), 50 deletions(-)
>>
>  From what I can see this is still suffering from the problem that we
> need to find a proper solution to,
>
> My summary of the issues after talking to Jerome and Ben and
> re-reading things is:
>
> We really need to work out a better interface into the drivers to be
> able to avoid random atomic entrypoints,

Which is exactly what I criticized from the very first beginning. Good 
to know that I'm not the only one thinking that this isn't such a good idea.

> I'm sure you have some ideas and I think you really need to
> investigate them to move this thing forward,
> even it if means some issues with android sync pts.

Actually I think that TTMs fence interface already gave quite a good 
hint how it might look like. I can only guess that this won't fit with 
the Android stuff, otherwise I can't see a good reason why we didn't 
stick with that.

> but none of the two major drivers seem to want the interface as-is so
> something needs to give
>
> My major question is why we need an atomic callback here at all, what
> scenario does it cover?

Agree totally. As far as I can see all current uses of the interface are 
of the kind of waiting for a fence to signal.

No need for any callback from one driver into another, especially not in 
atomic context. If a driver needs such a functionality it should just 
start up a kernel thread and do it's waiting there.

This obviously shouldn't be an obstacle for pure hardware 
implementations where one driver signals a semaphore another driver is 
waiting for, or a high signal on an interrupt line directly wired 
between two chips. And I think this is a completely different topic and 
not necessarily part of the common fence interface we should currently 
focus on.

Christian.

> Surely we can use a workqueue based callback to ask a driver to check
> its signalling, is it really
> that urgent?
>
> Dave.
