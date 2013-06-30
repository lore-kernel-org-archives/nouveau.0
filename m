From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH] nv50: H.264/MPEG2 decoding support
 via VP2, available on NV84-NV96, NVA0
Date: Sat, 29 Jun 2013 21:02:51 -0400
Message-ID: <CAKb7UvjW4F6wCi3dtcYOZYtF+Lap4SVCt+OQUn7O6uH+wyvYKg@mail.gmail.com>
References: <1372332404-16547-1-git-send-email-imirkin@alum.mit.edu>
	<51CF2256.1050205@gmail.com>
	<CAKb7Uvg6Dr5Uz0Bc3m0sbu5+8wrfYD7CFq+dc6ETfUpdBnFQ=g@mail.gmail.com>
	<51CF7CF2.9070906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <51CF7CF2.9070906@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: mesa-dev@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sat, Jun 29, 2013 at 8:33 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> On 29/06/13 21:21, Ilia Mirkin wrote:
>> On Sat, Jun 29, 2013 at 2:07 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>>> I believe the hardware is capable of accelerating IDCT for VC1. Do you
>>> have any plans for it ?
>>
>> Nope. With MPEG, there's XvMC, which sends the macroblocks directly.
>> And there's an existing MPEG parser in gallium which can be used for
>> VDPAU. With VC-1, no such thing as XvMC. Which means that I'd have to
>> implement a bitstream parser in gallium. The spec is closed, and I'm
>> not at all familiar with the concepts used in VC-1.
> I thought that gallium already has a vc1 bitstream parser. Anyway if
> anyone is interested the libavcodec project can be useful in that regard

libavcodec is LGPL (incompatible with the mesa license for copying
code) and doesn't have a nice API to extract the macroblock data.

>>> As far as I know mesa in general is keen on keeping trailing statements
>>> on the next line, as well as 78(80) characters line length.
>>
>> I tried to do that... in the places where I violate that I felt that
>> it enhanced readability. Feel free to point out places where you
>> disagree. Also if it's a hard policy (e.g. as in the linux kernel), I
>> can go through and reformat.
> There is a document describing the Mesa Coding Style[1], although
> enforcing it is another question
>
> My main point was statements such as
>
>    if (ret) return NULL
>
> which are rather hard to see when surrounded by compact code.
>
> [1] http://www.mesa3d.org/devinfo.html

Oh, I see what you mean by "trailing statements" now. [I guess that's
really the only interpretation, not sure why it didn't click before.]
I'll go through and clean that up. I actually usually prefer that same
policy too, except for super-short trailing statements.

>>>> +   if (is_h264) {
>>>> +      /* Zero out some parts of mbring/vpring. there's gotta be some cleaner way
>>>> +       * of doing this... perhaps makes sense to just copy the relevant logic
>>>> +       * here. */
>>>> +      color.f[0] = color.f[1] = color.f[2] = color.f[3] = 0;
>>>> +      surf.offset = dec->frame_size;
>>>> +      surf.width = 64;
>>>> +      surf.height = (max_references + 1) * dec->frame_mbs / 4;
>>>> +      surf.depth = 1;
>>>> +      surf.base.format = PIPE_FORMAT_B8G8R8A8_UNORM;
>>>> +      surf.base.u.tex.level = 0;
>>>> +      surf.base.texture = &mip.base.base;
>>>> +      mip.level[0].tile_mode = 0;
>>>> +      mip.level[0].pitch = surf.width * 4;
>>>> +      mip.base.domain = NOUVEAU_BO_VRAM;
>>>> +      mip.base.bo = dec->mbring;
>>>> +      context->clear_render_target(context, (struct pipe_surface *)&surf, &color, 0, 0, 64, 4760);
> You can drop the typecast here
> s/(struct pipe_surface *)&surf/&surf.base/
>
>>>> +      surf.offset = dec->vpring->size / 2 - 0x1000;
>>>> +      surf.width = 1024;
>>>> +      surf.height = 1;
>>>> +      mip.level[0].pitch = surf.width * 4;
>>>> +      mip.base.bo = dec->vpring;
>>>> +      context->clear_render_target(context, (struct pipe_surface *)&surf, &color, 0, 0, 1024, 1);
> Ditto
>
>>>> +      surf.offset = dec->vpring->size - 0x1000;
>>>> +      context->clear_render_target(context, (struct pipe_surface *)&surf, &color, 0, 0, 1024, 1);
> Ditto

Nice catches. I hate this code... all this setup effort just to zero
some stuff out. =/

>>> Looking at the params associated with each video engine, I was wondering
>>> about compacting it into a struct (names chosen are the first thing that
>>> came to mind)
>>>
>>> struct nv84_decoder_eng {
>>>    struct nouveau_object *obj;
>>>    struct nouveau_object *channel;
>>>    struct nouveau_pushbuf *pushbuf;
>>>    struct nouveau_bufctx *bufctx;
>>>
>>>    struct nouveau_bo *fw;
>>>    struct nouveau_bo *data;
>>> }
>>>
>>> and then having an enum for the different engine types
>>>
>>> enum nv84_decoder_eng_type
>>> {
>>>    BSP = 0,
>>>    VP
>>> };
>>>
>>> #define NV84_DECODER_ENG_NUM VP + 1
>>
>> Hmmm.... it's a point... the downside is that things become a little
>> more confusing. I think there's some clarity to just having variable
>> names like "bsp_foo" and "vp_foo" instead of "engines[VP].foo". And
>> there are only 2 engines.
> When I came up with this I was looking at the nvc0 code, which was less
> intuitive
>
>    struct nouveau_object *channel[3], *bsp, *vp, *ppp;
>    struct nouveau_pushbuf *pushbuf[3];
>

Next try to work out how those are populated :) For pre-kepler all the
pushbufs are the same, for kepler they are different. It was suggested
to me that it would be advantageous to keep BSP and VP on separate
channels, and also the blob does it, so I did it that way. I don't
fully understand how the hardware interprets these things, so...
whatever.

>>>> +#ifdef __SSE4_2__
>>> IMHO this may produce non portable binaries in case of aggressive
>>> mtune/march flags. I'm not objecting against it just pointing out
>>
>> mtune shouldn't cause it to be defined. if you're specifying it on
>> march, then that's the target arch, so... the compiler is free to use
>> corei7 instructions anyways. Although distros will (likely) never use
>> this, but people on, say, gentoo, will get the benefits. A much better
>> approach would be to build the code anyways, and then select the best
>> version at runtime.
> Ouch you got me there, I was not too sure which one was the correct gcc
> flag. AFAIK mesa does have code detecting runtime cpu capabilities, but
> that can follow on if anyone is interested

Well, as luck would have it, I've redone it as SSE2 and it's faster
(more instructions, but fewer cycles). So I'm just going to replace it
with SSE2, which is on by default for x86_64. I didn't see any runtime
feature detection logic in gallium, only compile-time (e.g. in
pipe/p_config.h and util/u_sse.h) but I'm very new to the mesa
codebase, so I could have missed it. And sadly __builtin_cpu_supports
is probably too new to use.

Thanks for all the feedback!

  -ilia
