From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nv84-: write fence value on exit, and restore value
	on init.
Date: Mon, 9 Sep 2013 15:43:21 +1000
Message-ID: <CACAvsv5H9pwuyeCXt+fRDZ_HEYbT-tu2Lp0q-dxw=f+1eLzC2g@mail.gmail.com>
References: <1378132262-19453-1-git-send-email-maarten.lankhorst@canonical.com>
	<CACAvsv6Aj2abkDV4-HPykMT9gKWw5U8AHkiBzvnOH5UND6nUDQ@mail.gmail.com>
	<52272973.9010303@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <52272973.9010303@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 4, 2013 at 10:37 PM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Op 04-09-13 05:21, Ben Skeggs schreef:
>> On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
>> <maarten.lankhorst@canonical.com> wrote:
>>> This increases the chance slightly that recovery from lockup can happen
>>> succesfully.
>> I'd *really* love to see proof of this.  When channels die, all
>> outstanding fences are marked as signalled.  This should do absolutely
>> nothing...
> nv84+ heavily rely on fences though, and a race like this is possible:
> - channel 0 uses a bo from channel 1, queues a wait somewhere in the command stream for it.
> - channel 1 dies cleanly, but userspace creates a new channel in its place, fence counter is reset to 0.
> - channel 0 reaches the NV84_SUBCHAN_SEMAPHORE_TRIGGER.ACQUIRE_GEQUAL op, waits on fence in channel 1 to signal forever.
Ok, this isn't exactly the issue you implied in the commit message.
But yes, this could possibly be an issue for sure.  I don't think this
is the right way to fix it however.  I'll have a bit of a think on the
problem and see what I can come up with.

Thanks,
Ben.

>
> Channel 0 could be the global drm channel used for buffer moves, which would result in a hang. This may seem unlikely, but I believe that parallel piglit runs could trigger it.
>
> If not, simply creating an operation that takes a few seconds in channel 0 and then queuing a command that uses a bo from channel 1 while chan1 is still busy, then deleting/recreating chan1 could trigger it.
>
> ~Maarten
>
