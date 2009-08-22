From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: rewrite nouveau_dma_wait()
Date: Sat, 22 Aug 2009 14:27:05 +0200
Message-ID: <6d4bc9fc0908220527p44949e06kd04735f3848386a6@mail.gmail.com>
References: <1250848611-21642-1-git-send-email-skeggsb@gmail.com>
	<20090822132559.7e404f88@daedalus.pq.iki.fi>
	<6d4bc9fc0908220330l32803ce0qea995c59aa7f894c@mail.gmail.com>
	<20090822152021.45e535a5@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090822152021.45e535a5-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Aug 22, 2009 at 2:20 PM, Pekka Paalanen<pq-X3B1VOXEql0@public.gmane.org> wrote:
> On Sat, 22 Aug 2009 12:30:03 +0200
> Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> dma.max is adjusted to always have space for the jump.
>
> Ah, then that should be documented somewhere.
>
> But if that is the case, why:
>>>> chan->dma.free = get - chan->dma.cur - 1;
>
> The extra space is not needed in this branch, since the available space
> is limited by GET. If it is not locked up, GET will move forward and give
> space. Otherwise, we would be in the get <= dma.cur branch.
>
> Assuming the jump command is at index dma.max, isn't dma.max the maximum
> possible value for GET inside the ring? Therefore
>>>> chan->dma.free = get - chan->dma.cur - 1;
> should become equivalent to
>>>> chan->dma.free = chan->dma.max - chan->dma.cur;
> but there is the -1.
>
> Or do we observe GET == dma.max + 1 just before it actually jumps?

I guess it's just a safety, i do not think our get is ever read as
dma.max + 1, because we read get before jumping.

>
> Or do we simply not know how it behaves and want to be safe?
>
> --
> Pekka Paalanen
> http://www.iki.fi/pq/
>
