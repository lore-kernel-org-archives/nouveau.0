From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence implementation for
 fences
Date: Tue, 22 Jul 2014 13:51:59 +0200
Message-ID: <53CE505F.9070101@canonical.com>
References: <20140709093124.11354.3774.stgit@patser>	<20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: Dave Airlie <airlied@gmail.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "Deucher, Alexander" <alexander.deucher@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>
List-Id: nouveau.vger.kernel.org

Hey,

op 22-07-14 06:05, Dave Airlie schreef:
> On 9 July 2014 22:29, Maarten Lankhorst <maarten.lankhorst@canonical.com> wrote:
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>> ---
>>  drivers/gpu/drm/radeon/radeon.h        |   15 +-
>>  drivers/gpu/drm/radeon/radeon_device.c |   60 ++++++++-
>>  drivers/gpu/drm/radeon/radeon_fence.c  |  223 ++++++++++++++++++++++++++------
>>  3 files changed, 248 insertions(+), 50 deletions(-)
>>
> From what I can see this is still suffering from the problem that we
> need to find a proper solution to,
>
> My summary of the issues after talking to Jerome and Ben and
> re-reading things is:
>
> We really need to work out a better interface into the drivers to be
> able to avoid random atomic entrypoints,
> I'm sure you have some ideas and I think you really need to
> investigate them to move this thing forward,
> even it if means some issues with android sync pts.
>
> but none of the two major drivers seem to want the interface as-is so
> something needs to give
wait_queue_t (which radeon uses for fence_queue) uses atomic entrypoints too, the most common
one being autoremove_wake_function, which wakes up the thread it was initialized from, and removes
itself from the wait_queue_t list, in atomic fashion. It's used by __wait_event_interruptible_locked,
if something internally wants to add some arbitrary callback it could already happen...

> My major question is why we need an atomic callback here at all, what
> scenario does it cover?
A atomic callback could do something like schedule_work(&work) (like nouveau_fence_work already does right now!!!!).

I've also added some more experimental things in my unsubmitted branch, in a codepath that's taken when synchronization is used with multiple GPU's:

Nouveau: I write the new seqno to the GART fence, which I added a GPU wait for using SEMAPHORE_TRIGGER.ACQUIRE_GE.
radeon: I write to a memory location to unblock the execution ring, this will probably be replaced by a call to the GPU scheduler.
i915: write to the EXCC (condition code) register to unblock the ring operation when it's waiting for the condition code.

But I want to emphasize that this is a hack, and driver maintainers will probably NACK it, I think I will only submit the one for nouveau, which is sane there because it schedules contexts in hardware.
Even so that part is not final and will probably go through a few iterations before submission.


> Surely we can use a workqueue based callback to ask a driver to check
> its signalling, is it really
> that urgent?
Nothing prevents a driver from using that approach, even with those changes.

Driver maintainers can still NACK the use of fence_add_callback if they want to,
or choose not to export fences to outside the driver. Because fences are still
not exporting, nothing will change for them compared to the current situation.

~Maarten
