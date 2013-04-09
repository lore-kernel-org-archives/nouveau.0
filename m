From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH] drm/nouveau: idle all channels before suspending
Date: Tue, 09 Apr 2013 08:44:09 +0200
Message-ID: <5163B8B9.9000409@canonical.com>
References: <5162B231.2060900@canonical.com>
	<CACAvsv6hY9u_8FNNwbEXYCMLRPnBivup3W_O4v8tqC3q2AAYhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CACAvsv6hY9u_8FNNwbEXYCMLRPnBivup3W_O4v8tqC3q2AAYhg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Op 09-04-13 01:14, Ben Skeggs schreef:
> On Mon, Apr 8, 2013 at 10:04 PM, Maarten Lankhorst <
> maarten.lankhorst@canonical.com> wrote:
>
>> Seems to make suspend slightly more reliable on my system.
>>
> NACK.
>
> "Seems to", and "slightly" don't make a very good argument for this.
>  Likely all you've done is change the timing of certain things happening.
>
> The PFIFO and engine (PGRAPH etc) modules already take care of idling and
> unloading active channels.  If something is broken there, that's where it
> needs fixing, not this hack that "maybe" "possibly" "slightly" works.
The channel idle was not for PFIFO or PGRAPH, it's for nouveau_fence suspend.
If you want to save the fence seqnos, you have to be sure that all channels are idle first,
or move the saving of fence seqnos until after you're done with unloading all the fifo engines.

~Maarten
