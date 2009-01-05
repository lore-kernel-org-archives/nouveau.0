From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: some patches and remarks for ng
Date: Mon, 05 Jan 2009 16:27:25 +0100
Message-ID: <496226DD.5020403@gmail.com>
References: <6d4bc9fc0901030853q7f341c16l231ebf42c4643ede@mail.gmail.com>
	<1231115075.14351.23.camel@keine.ath.cx>
	<49622226.6070705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49622226.6070705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 01/05/2009 04:07 PM, Maarten Maathuis wrote:
> On 01/05/2009 01:24 AM, Ben Skeggs wrote:
>> On Sat, 2009-01-03 at 17:53 +0100, Maarten Maathuis wrote:
>>> 1 patch for libnouveau_drm, 4 for drm and one work in progress patch
>>> for the ddx.
>>>
>>> Getting nv50 to run proved to be more difficult than i thought (at
>>> some point i stopped because it would require significant changes), i
>>> just have a few remarks.
>>>
>>> - Buffer object access is not guarded by fences at all, which is a
>>> major issue. You worked around that by using M2MF I suppose, but this
>>> needs a structural fix.
>> I have no idea where you got that idea from...
>
> So where is buffer object mapping waiting for any pending gpu activity?

I should add that I originally had drm_bo_move_memcpy in mind, which 
just maps and memcpy's as far as i can see. Sorry if i didn't mention 
that I had this example in mind.

>
>>> - Comments are scarce, please be more verbose. I know it's all very
>>> obvious to the people that write the code, but for others it's less
>>> obvious.
>>
>>> - I think buffer object untiling should happen in userspace, which
>>> will also allow some nice optimizations that EXA does (using damage to
>>> selectively copy and such).
>> Sure, I agree.  The drm is still going to need to know a bit more info
>> on the buffer layout than it currently does regardless.
>>
>>> - The WIP patch contains sysmem pixmaps, i fixed this for git xserver
>>> (and nominated it for 1.6), but expect older versions to blow up due
>>> to NULL'ing of devPrivate.ptr.
>>> (http://cgit.freedesktop.org/xorg/xserver/commit/?id=3534a5e5d9c5af85149c799f324257f89507fa23) 
>>>
>>>
>>> Consider the patches hints, and don't blindly apply them.
>> libnouveau_drm 0001: I'll apply it, harmless changes
>> drm 0001: Oops, missed that from an earlier change.  Will apply.
>> drm 0002: I won't apply, we'll need to do a lot more extensive cleanup
>> if we fail there.  What exactly is needed I'm not sure, haven't looked
>> into it properly yet - hence the XXX
>> drm 0003: NACK on the PRAMIN changes.  PRAMIN doesn't work *anything*
>> like previously.  The current code is fine, no channel has access to the
>> parts of VRAM mapped into PRAMIN.  On the VRAM size, thanks, that's
>> left-over from when the code was supporting both the old mm and ttm at
>> the same time.
>> drm 0004: It doesn't hurt I guess.
>>
>>> Maarten.
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>
