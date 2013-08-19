From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix vblank deadlock
Date: Mon, 19 Aug 2013 22:01:21 +0200
Message-ID: <52127991.3020409@canonical.com>
References: <5208CC15.8080403@canonical.com>
	<5212600D.7000203@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <5212600D.7000203@hurleysoftware.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Hey,

Op 19-08-13 20:12, Peter Hurley schreef:
> On 08/12/2013 07:50 AM, Maarten Lankhorst wrote:
>> This fixes a deadlock inversion when vblank is enabled/disabled by drm.
>> &dev->vblank_time_lock is always taken when the vblank state is toggled,
>> which caused a deadlock when &event->lock was also taken during
>> event_get/put.
>>
>> Solve the race by requiring that lock to change enable/disable state,
>> and always keeping vblank on the event list. Core drm ignores unwanted
>> vblanks, so extra calls to drm_handle_vblank are harmless.
>
> I don't feel this is the appropriate solution to the lock inversion
> between vblank_time_lock and event->lock.
>
> Preferably drm core should correct the interface layer bug; ie., calling
> into a sub-driver holding a lock _and_ requiring the sub-driver to call a
> drm helper function which claims the same lock is bad design. The console
> lock suffers from the same design flaw and is a constant problem.
>
> Alternatively, the event trigger could be lockless; ie., the event list
> could be an RCU list instead. In this way, the event->lock does not need
> to be claimed, and thus no lock inversion is possible. The main drawback
> here is that currently the event->lock enforces non-overlapping lifetimes
> between the event handler and the event. Untangling object lifetimes in
> nouveau is a non-trivial exercise.
If only it was so easy..

nouveau is doing a non-standard thing with core/engine/software, specifically the release method.
The real fix is reverting the commit that changes this to a nouveau_event type of thing, and reinstates
the old locking. This is not going to happen though, so the second best fix is just telling it to lock the
other lock too when changing enable state.

~Maarten
