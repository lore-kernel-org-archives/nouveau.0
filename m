From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [Mesa3d-dev] [PATCH] glsl: put varyings in texcoord
	slots
Date: Mon, 18 Jan 2010 17:27:22 +0100
Message-ID: <ff13bc9a1001180827y3e7b1edanc4e94577f08f4aa4@mail.gmail.com>
References: <1263755124-4627-1-git-send-email-luca@luca-barbieri.com>
	<5d1e685e1001171906i685d1dd7xe0c1f7c589967b9f@mail.gmail.com>
	<ff13bc9a1001180622u7c9cd0f3x5315bd42a2eb3847@mail.gmail.com>
	<5d1e685e1001180752j2de0d211s64f8dd64ab12a4ae@mail.gmail.com>
	<a728f9f91001180759m5764c286l836bfb97ceb5b338@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <a728f9f91001180759m5764c286l836bfb97ceb5b338-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

So, basically, you allocate the rasterizer units according to the
vertex shader, and when the fragment shader comes up, you say "write
rasterizer output 4 to fragment input 1000000"?

The current nouveau drivers can't do this.
There are "routing" registers in hardware, but I think the nVidia
proprietary driver (at least without GLSL) leaves them unaltered after
initialization and I don't think we really know how they would work.
They are also very likely limited to at most 256 values (maybe even
less, such as 16), even if they can actually be made to work.

The way the current pre-nv50 driver works is that there are 8 slots,
each of which has an interpolator and a fixed associated vertex shader
output and fixed fragment input. This seems a rather obvious way to
design hardware, and so shouldn't be uncommon.

Thus, the inputs/outputs can't be packed, because that will break if
the fragment shader doesn't use a vertex output.
And there is no way to correct that when the fragment program comes
up, other than recompiling the vertex shader, which would be very
desirable to avoid having to do.

Non-GLSL programs can only use the 8 texcoords, so there is no problem
there since hardware supports 8 slots.

Thus, I think my proposed solution is the simplest and most efficient approach.
Any other solution would require much more, and slower, code in the
Gallium drivers for nv30, nv40, and maybe Intel too.
