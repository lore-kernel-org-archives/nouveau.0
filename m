From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [Mesa3d-dev] [PATCH] glsl: put varyings in texcoord
	slots
Date: Mon, 18 Jan 2010 21:06:01 +0100
Message-ID: <ff13bc9a1001181206s6f0d2f51q4cbffe0baad46015@mail.gmail.com>
References: <1263755124-4627-1-git-send-email-luca@luca-barbieri.com>
	<5d1e685e1001171906i685d1dd7xe0c1f7c589967b9f@mail.gmail.com>
	<ff13bc9a1001180622u7c9cd0f3x5315bd42a2eb3847@mail.gmail.com>
	<5d1e685e1001180752j2de0d211s64f8dd64ab12a4ae@mail.gmail.com>
	<a728f9f91001180759m5764c286l836bfb97ceb5b338@mail.gmail.com>
	<ff13bc9a1001180827y3e7b1edanc4e94577f08f4aa4@mail.gmail.com>
	<e7bd23c31001181141s3a3434fdkd85050eea7948164@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <e7bd23c31001181141s3a3434fdkd85050eea7948164-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Corbin Simpson <mostawesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

> If you get this patch in, then you'll still have to fight with every
> other state tracker that doesn't prettify their TGSI. It would be a
> much better approach to attempt to RE the routing tables.

I don't think there any users of the Gallium interface that need more
than 8 vertex outputs/fragment inputs and don't use sequential values
starting at 0, except the GLSL linker without this patch.

ARB_fragment_program and ARB_vertex_program is limited to texcoord
slots, and Mesa should advertise only 8 of them.
Also users of this interface will likely only use as many as they
need, sequentially.

Vega, xorg seem to only use up to 2 slots.
g3dvl up to 8 (starting from 0, of course).

Cards with less than 8 slots may sometimes still have problems, but
such cards will probably be DX8 cards that don't work anyway.

Furthermore, even if you can route things, usings vertex outputs and
fragment inputs with lower indices may be more efficient anyway.

As for REing the tables, it may not be possible.
This is the code that apparently sets them up right now:
	/* vtxprog output routing */
	so_method(so, screen->curie, 0x1fc4, 1);
	so_data  (so, 0x06144321);
	so_method(so, screen->curie, 0x1fc8, 2);
	so_data  (so, 0xedcba987);
	so_data  (so, 0x00000021);
	so_method(so, screen->curie, 0x1fd0, 1);
	so_data  (so, 0x00171615);
	so_method(so, screen->curie, 0x1fd4, 1);
	so_data  (so, 0x001b1a19);

This makes me think that only 4 bits might be used for the values
(look at the arithmetic progressions of 4-bit values), so that there
is a limit of 16 vertex output/fragment inputs.
If GLSL starts at index 10, we are still in trouble because less than
8 varyings will be available.

Also leaving vertex outputs/fragment inputs unused by starting at high
values may be bad for performance even if supported, as it may lead to
a bigger register file and thus less simultaneous GPU threads running.

In other words, having GLSL start at index 10 is easily avoided, and
causes problems nothing else causes, so why not just stop doing that?
