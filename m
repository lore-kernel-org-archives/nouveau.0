From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] drm/nv84-: write fence value on exit,
 and restore value on init.
Date: Wed, 04 Sep 2013 14:37:07 +0200
Message-ID: <52272973.9010303@canonical.com>
References: <1378132262-19453-1-git-send-email-maarten.lankhorst@canonical.com>
	<CACAvsv6Aj2abkDV4-HPykMT9gKWw5U8AHkiBzvnOH5UND6nUDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6Aj2abkDV4-HPykMT9gKWw5U8AHkiBzvnOH5UND6nUDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Op 04-09-13 05:21, Ben Skeggs schreef:
> On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
> <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>> This increases the chance slightly that recovery from lockup can happen
>> succesfully.
> I'd *really* love to see proof of this.  When channels die, all
> outstanding fences are marked as signalled.  This should do absolutely
> nothing...
nv84+ heavily rely on fences though, and a race like this is possible:
- channel 0 uses a bo from channel 1, queues a wait somewhere in the command stream for it.
- channel 1 dies cleanly, but userspace creates a new channel in its place, fence counter is reset to 0.
- channel 0 reaches the NV84_SUBCHAN_SEMAPHORE_TRIGGER.ACQUIRE_GEQUAL op, waits on fence in channel 1 to signal forever.

Channel 0 could be the global drm channel used for buffer moves, which would result in a hang. This may seem unlikely, but I believe that parallel piglit runs could trigger it.

If not, simply creating an operation that takes a few seconds in channel 0 and then queuing a command that uses a bo from channel 1 while chan1 is still busy, then deleting/recreating chan1 could trigger it.

~Maarten
