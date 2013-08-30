From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/9] drm/nouveau: Cleanup event/handler design
Date: Thu, 29 Aug 2013 21:23:28 -0400
Message-ID: <521FF410.10003@hurleysoftware.com>
References: <1377634382-13872-1-git-send-email-peter@hurleysoftware.com>
	<CACAvsv6atUc=QO2gHEbHK4-+uCh=GUtCqtVKVkZxmS-S8EQppg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6atUc=QO2gHEbHK4-+uCh=GUtCqtVKVkZxmS-S8EQppg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 08/28/2013 03:15 AM, Ben Skeggs wrote:
> On Wed, Aug 28, 2013 at 6:12 AM, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
>> This series was originally motivated by a deadlock, introduced in
>> commit 1d7c71a3e2f77336df536855b0efd2dc5bdeb41b
>> 'drm/nouveau/disp: port vblank handling to event interface',
>> due to inverted lock order between nouveau_drm_vblank_enable()
>> and nouveau_drm_vblank_handler() (the complete
>> lockdep report is included in the patch 4/5 changelog).
> Hey Peter,
>
> Thanks for the patch series.  I've only taken a cursory glance through
> the patches thus far, as they're definitely too intrusive for -fixes
> at this point.  I will take a proper look through the series within
> the next week or so, I have some work pending which may possibly make
> some of these changes unnecessary, though from what I can tell,
> there's other good bits here we'll want.
>
> In a previous mail on the locking issue, you mentioned the drm core
> doing the "wrong thing" here too, did you have any further thoughts on
> correcting that issue too?

I'm working on the premise that drm_handle_vblank() can be lockless;
that would minimize the api disruption. I still have a fair bit of
analysis to do, but some early observations:

1) The vbl_time_lock spinlock is unnecessary -- drm_handle_vblank()
    could be protected with vbl_lock, since everywhere else
    vbl_time_lock is held, vbl_lock is already held.

2) The _vblank_count[crtc] doesn't need to be atomic. All the code
    paths that update _vblank_count[] are already spinlocked. Even
    if the code weren't spinlocked, the atomic_inc/_adds aren't
    necessary; only the memory barriers and read/write order of
    the vblank count/timestamp tuple is relevant.

3) Careful enabling of drm_handle_vblank() is sufficient to
    solve the concurrency between drm_handle_vblank() and
    drm_vblank_get() without needing a spinlock for exclusion.
    drm_handle_vblank() would need to account for the possibility of
    having missed a vblank interrupt between the reading of the
    hw vblank counter and the enabling drm_handle_vblank().

4) I'm still thinking about how/whether to exclude
    drm_handle_vblank() and vblank_disable_and_save(). One thought
    is to replace the timeout timer with delayed work instead so
    that vblank_disable_and_save() could wait for
    drm_handle_vblank() to finish after disabling it.
    [I'd also need to verify that the drm drivers other than
    intel which use drm_vblank_off() do so from non-atomic context.]

I realize that I'm mostly referring to the hw counter/timestamp
flavor of vblank handling; that's primarily because it requires a
more rigorous handling and has race conditions that don't apply
to the software-only counter.

Regards,
Peter Hurley
