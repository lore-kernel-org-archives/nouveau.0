From: Corbin Simpson <mostawesomedude@gmail.com>
Subject: Re: [PATCH] glsl: put varyings in texcoord slots
Date: Mon, 18 Jan 2010 11:41:58 -0800
Message-ID: <e7bd23c31001181141s3a3434fdkd85050eea7948164@mail.gmail.com>
References: <1263755124-4627-1-git-send-email-luca@luca-barbieri.com>
	<5d1e685e1001171906i685d1dd7xe0c1f7c589967b9f@mail.gmail.com>
	<ff13bc9a1001180622u7c9cd0f3x5315bd42a2eb3847@mail.gmail.com>
	<5d1e685e1001180752j2de0d211s64f8dd64ab12a4ae@mail.gmail.com>
	<a728f9f91001180759m5764c286l836bfb97ceb5b338@mail.gmail.com>
	<ff13bc9a1001180827y3e7b1edanc4e94577f08f4aa4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
In-Reply-To: <ff13bc9a1001180827y3e7b1edanc4e94577f08f4aa4@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=mesa3d-dev>
List-Post: <mailto:mesa3d-dev@lists.sourceforge.net>
List-Help: <mailto:mesa3d-dev-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=subscribe>
Errors-To: mesa3d-dev-bounces@lists.sourceforge.net
To: Luca Barbieri <luca@luca-barbieri.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, nouveau@lists.freedesktop.org, mesa3d-dev@lists.sourceforge.net
List-Id: nouveau.vger.kernel.org

Actually, we don't even bother worrying about the rasterizer's routing
table until we've bound a pair of shaders and start drawing. Right
before the draw call, we re-generate, among other things, routing
tables for the vert shader and the rasterizer.

This is *incredibly* powerful, because it means we only have to
compile the shaders once, and load the rasterizer tables based on
those shaders. I even baked up a CSO to cache the tables, but it
turned out to be an overall slowdown.

If you get this patch in, then you'll still have to fight with every
other state tracker that doesn't prettify their TGSI. It would be a
much better approach to attempt to RE the routing tables.

Also FYI the r300-r500 rasterizer can only handle, off the top of my
head, 16 sets of vectors total (8 colors, 8 texcoords) so you're not
the only ones with this kind of limitation. The situation gets better
for r600 and nv50.

~ C.

On Mon, Jan 18, 2010 at 8:27 AM, Luca Barbieri <luca@luca-barbieri.com> wrote:
> So, basically, you allocate the rasterizer units according to the
> vertex shader, and when the fragment shader comes up, you say "write
> rasterizer output 4 to fragment input 1000000"?
>
> The current nouveau drivers can't do this.
> There are "routing" registers in hardware, but I think the nVidia
> proprietary driver (at least without GLSL) leaves them unaltered after
> initialization and I don't think we really know how they would work.
> They are also very likely limited to at most 256 values (maybe even
> less, such as 16), even if they can actually be made to work.
>
> The way the current pre-nv50 driver works is that there are 8 slots,
> each of which has an interpolator and a fixed associated vertex shader
> output and fixed fragment input. This seems a rather obvious way to
> design hardware, and so shouldn't be uncommon.
>
> Thus, the inputs/outputs can't be packed, because that will break if
> the fragment shader doesn't use a vertex output.
> And there is no way to correct that when the fragment program comes
> up, other than recompiling the vertex shader, which would be very
> desirable to avoid having to do.
>
> Non-GLSL programs can only use the 8 texcoords, so there is no problem
> there since hardware supports 8 slots.
>
> Thus, I think my proposed solution is the simplest and most efficient approach.
> Any other solution would require much more, and slower, code in the
> Gallium drivers for nv30, nv40, and maybe Intel too.
>
> ------------------------------------------------------------------------------
> Throughout its 18-year history, RSA Conference consistently attracts the
> world's best and brightest in the field, creating opportunities for Conference
> attendees to learn about information security's most important issues through
> interactions with peers, luminaries and emerging and established companies.
> http://p.sf.net/sfu/rsaconf-dev2dev
> _______________________________________________
> Mesa3d-dev mailing list
> Mesa3d-dev@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/mesa3d-dev
>



-- 
Only fools are easily impressed by what is only
barely beyond their reach. ~ Unknown

Corbin Simpson
<MostAwesomeDude@gmail.com>

------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
