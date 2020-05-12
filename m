From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
Date: Tue, 12 May 2020 10:11:42 +0200
Message-ID: <7a506bb2-1bde-ebde-9bf1-bc115b99e873@gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1815605280.20200511161440@sympatico.ca>
 <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
 <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
 <1266714942.20200511165648@sympatico.ca>
Reply-To: christian.koenig-5C7GfCeVMHo@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1266714942.20200511165648-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Al Dunsmuir <al.dunsmuir-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am 11.05.20 um 22:56 schrieb Al Dunsmuir:
> Hello Dave,
>
> On Monday, May 11, 2020, 4:43:01 PM, Dave Airlie wrote:
>> On Tue, 12 May 2020 at 06:28, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> [SNIP]
>> Maybe we can find some way to compartmentalise AGP further?
>> Dave.
> Significantly   reduced  caching  on memory accesses definitely sounds
> like something that would be noticeable and objectionable.
>
> I would speculate that this would also vary a lot across chipsets,
> depending on the capabilities of the PCI MMU vs the AGP MMU.
>
> In the end, it may be best to leave things as is, or as Dave suggested
> try to keep AGP in the picture.

The problem is that AGP was never really supported/implemented that well 
in the first place.

The fact that the core linux kernel and the DMA API doesn't support 
uncached memory and we had to change the caching attributes of pages 
under the hood has resulted in a huge number of problems over the years.

Keeping it as it is is also not a really doable option because TTM 
already has major problems keeping up with the requirements for modern 
hardware, see my presentation here as well: 
https://fosdem.org/2020/schedule/event/ttm/

Redesigning the old AGP support into something which isn't so ugly and 
doesn't blocks the new requirements has the huge risk of breaking things 
even harder, e.g. black screen instead of just reduced performance.

So removing/disabling AGP by default still sounds like the best option 
to me for end users.

> Nothing is ever simple, is it?

At least not with AGP, no :) It has been a total beast to support and 
keep working.

Do I get this right that I can ping you to test things?

Thanks for the feedback,
Christian.

> Al
>
>
