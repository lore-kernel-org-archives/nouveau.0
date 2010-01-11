From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/nv50: wait for pgraph to idle before
	unloading the context
Date: Mon, 11 Jan 2010 23:21:54 +0100
Message-ID: <6d4bc9fc1001111421i51c05092kce657e94efc84d6a@mail.gmail.com>
References: <1263241133-13499-1-git-send-email-madman2003@gmail.com>
	<6d4bc9fc1001111220q2025bb8h862577a208831a00@mail.gmail.com>
	<6d4bc9fc1001111222t256fe973x64bb8fddd7bc8440@mail.gmail.com>
	<6d4bc9fc1001111312q35bbaae4t2e537bd93abb0b89@mail.gmail.com>
	<1263247891.13028.2.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1263247891.13028.2.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I can't say for sure it's the full solution, i can make nv50 gallium
lock up in an odd (and different) way than before. And during bitscan
runs i did see some "PGRAPH fail to idle status 0x101" and even one or
"AIII, inactive channel 128" (from the top of my head).

Maarten.

On Mon, Jan 11, 2010 at 11:11 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, 2010-01-11 at 22:12 +0100, Maarten Maathuis wrote:
>> A few comments are in order, i noticed that this additional
>> wait_for_idle does cause delays sometimes (obviously). and it seems
>> like an excellent way to do a DOS attack on your gpu. fbcon is visibly
>> lagging sometimes and even unusable (gpu is not locked up, =A0X works
>> fine started from ssh). This seems like something to consider when
>> choosing the preferred solution.
> Yeah, I think the wait_for_idle() is fine. =A0I'm actually interested it
> solved the problem completely for you, as I mentioned to you (maybe?), I
> still seen an *occasional* hang when I tried it. =A0But, it's still a huge
> improvement over now.
>
> Ben.
>>
>> On Mon, Jan 11, 2010 at 9:22 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>> > This patch *is* alone, sorry for the typo.
>> >
>> > On Mon, Jan 11, 2010 at 9:20 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>> >> This patch alone, so ignore the 3/3. I think this fixes the channel
>> >> unload hang issues in a less obscure way. Feedback appreciated as
>> >> usual.
>> >>
>> >> On Mon, Jan 11, 2010 at 9:18 PM, Maarten Maathuis <madman2003@gmail.c=
om> wrote:
>> >>> - This should fix the problem with gpu hangs people have had when cl=
osing
>> >>> channels.
>> >>>
>> >>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >>> ---
>> >>> =A0drivers/gpu/drm/nouveau/nv50_graph.c | =A0 =A01 +
>> >>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/=
nouveau/nv50_graph.c
>> >>> index 444a46b..d6897cf 100644
>> >>> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
>> >>> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
>> >>> @@ -282,6 +282,7 @@ nv50_graph_unload_context(struct drm_device *dev)
>> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> >>> =A0 =A0 =A0 =A0inst &=3D NV50_PGRAPH_CTXCTL_CUR_INSTANCE;
>> >>>
>> >>> + =A0 =A0 =A0 nouveau_wait_for_idle(dev);
>> >>> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400500, fifo & ~1);
>> >>> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400784, inst);
>> >>> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400824, nv_rd32(dev, 0x400824) | 0x20);
>> >>> --
>> >>> 1.6.6
>> >>>
>> >>>
>> >>
>> >
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
>
