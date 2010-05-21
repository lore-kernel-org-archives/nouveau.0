From: Xavier Chantry <chantry.xavier@gmail.com>
Subject: Re: RFC: gallium-msaa branch merge
Date: Fri, 21 May 2010 21:41:31 +0200
Message-ID: <AANLkTilp8IaazHhOaTMTjeGc8kVnaKhKZXM60pyNrn1l@mail.gmail.com>
References: <4BF2C897.8090008@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <4BF2C897.8090008@vmware.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Roland Scheidegger <sroland@vmware.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Tue, May 18, 2010 at 7:04 PM, Roland Scheidegger <sroland@vmware.com> wrote:
> Hi,
>
> I plan to merge the gallium-msaa branch to master soon.
> It's actually a bit of a misnomer since the conceptually more important
> changes in there are about blits...
>
> Here's a short summary what this is about:
> blits now operate on resources, not surfaces (surface_copy/fill ->
> resource_copy/fill_region). Note that overlapping blits are no longer
> permitted (half the code always assumed this wasn't the case), and these
> functions are now mandatory (most of the code using these just checked
> for their presence and if not used util_surface_copy instead, hence it
> seems cleaner if drivers plug that in themselves, which some already did).
> Also, there's an assumption that resource_copy_region works regardless
> of bind flags (at least for texture targets, actually might also need to
> work for buffers for "modern" drivers in the future not sure yet), hence
> there are no longer any PIPE_BIND_BLIT flags (which were quite magic to
> begin with, since a lot of the code could end up with a quad blit which
> really wants RENDER_TARGET/SAMPLER_VIEW bind flags instead).
> It is possible some of the drivers implementation are a bit suboptimal
> now, as they still use surfaces internally for easier migration (svga,
> r300g, nouveau might particularly benefit from some cleanup).
> If a driver implements this just with util_resource_copy_region, it is
> possible there are performance regressions, since some (certainly not
> all) state trackers used a quad blitter instead if this wasn't available.
> The u_blit code still uses a pipe_surface as destination, which should
> probably be changed at some point too but the change was already big
> enough imho.
>
> Historically, blits had to operate on surfaces IIRC since there actually
> were surfaces in gallium not backed by a pipe_resource (then
> pipe_texture) but those are gone. So get_tex_surface() should actually
> be viewed as the analogous function to create_sampler_view() (and yes it
> will migrate to context too and probably renamed to something else), it
> creates a view of a resource (the pipe_surface) to be used as a render
> target (color or depth/stencil).
>
> The msaa changes are fairly minimal, there's a new context function to
> set the sample mask (all drivers have dummy implementations), plus some
> bits for sample to coverage etc. And a explicit resource_resolve
> function which is defined as the only way to resolve a multisampled
> resource, but so far no driver implements multisampling (and the mesa
> state tracker won't use it neither).
>

Just including nouveau ML in CC in case someone missed that merge, as
I think there is some work to be done in nouveau driver.
