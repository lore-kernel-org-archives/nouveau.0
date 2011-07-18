From: Pekka Paalanen <pq@iki.fi>
Subject: Re: RFC: ctx->Driver.Map/UnmapTextureImage() hooks
Date: Mon, 18 Jul 2011 22:00:22 +0300
Message-ID: <20110718220022.4231f6ac@farn>
References: <4E03E3A3.8060903@vmware.com>
	<CAEUUzO-6YH3YmtzWxfM=Sn3YT+ndDHJxy1bjff0+f_qd8yj_jA@mail.gmail.com>
	<CAPM=9twbNrhH+5CFO38UvVOTgMHzMHEfBfRosPGo0=NCN-HaOg@mail.gmail.com>
	<4E208571.90805@vmware.com> <20110715235911.6d2ff4f0@farn.lan>
	<4E243E8D.2030605@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <4E243E8D.2030605@vmware.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Brian Paul <brianp@vmware.com>
Cc: mesa-dev <mesa-dev@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, 18 Jul 2011 08:09:17 -0600
Brian Paul <brianp@vmware.com> wrote:

> On 07/15/2011 02:59 PM, Pekka Paalanen wrote:
> > On Fri, 15 Jul 2011 12:22:41 -0600
> > Brian Paul<brianp@vmware.com>  wrote:
> >
> >> On 07/15/2011 10:07 AM, Dave Airlie wrote:
> >>> On Fri, Jul 15, 2011 at 4:10 AM, Brian
> >>> Paul<brian.e.paul@gmail.com>   wrote:
> >>>>
> >>>>
> >>>> The map-texture-image-v4 branch that I just pushed implements
> >>>> this change.  It really cleaned things up for the better and
> >>>> will lead to a few more follow-on improvements.
> >>>>
> >>>> There's no obvious regressions with swrast or the gallium
> >>>> drivers.  I updated the intel driver code and tested i915 and
> >>>> it seems OK too, but I didn't do a full piglit run on it.  I
> >>>> also updated the legacy r600 driver in case anyone cares but
> >>>> didn't do any testing of it.
> >>>>
> >>>> I didn't update any of the other legacy DRI drivers.  Would
> >>>> anyone object if we simply stop building mach64, r128,
> >>>> unichrome, sis, etc? I'd be happy to remove those drivers
> >>>> altogether for that matter.
> >>>
> >>> we could EOL those in 7.11, and if anyone wants to ship them,
> >>> they can just build 7.11 for them.
> >>
> >> Sounds good to me.  I think we'd only keep the swrast, intel
> >> and maybe r300/r600 drivers.  Opinions?
> >
> > Um, don't kill nouveau_vieux, please.
> 
> Does the old nouveau driver support some GPUs that the gallium 
> nv50/nvc0 drivers don't support?

Yes. Like Corbin said, 'nouveau_vieux' is for NV04-NV2x, while
the gallium driver 'nouveau' supports NV30 and later.
http://nouveau.freedesktop.org/wiki/MesaDrivers

> If we want to keep the older driver someone will need to
> volunteer to update the code to support the new driver hooks.

Sorry, I cannot promise that.
Nouveau_vieux seems to have been missing a maintainer for
some time now.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
