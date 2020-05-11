From: Al Dunsmuir <al.dunsmuir-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
Date: Mon, 11 May 2020 16:56:48 -0400
Message-ID: <1266714942.20200511165648@sympatico.ca>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1815605280.20200511161440@sympatico.ca>
 <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
 <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello Dave,

On Monday, May 11, 2020, 4:43:01 PM, Dave Airlie wrote:
> On Tue, 12 May 2020 at 06:28, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> On Mon, May 11, 2020 at 4:22 PM Al Dunsmuir <al.dunsmuir-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org> wrote:
>> Note there is no loss of functionality here, at least on radeon
>> hardware.  It just comes down to which MMU gets used for access to
>> system memory, the AGP MMU on the chipset or the MMU built into the
>> GPU.  On powerpc hardware, AGP has been particularly unstable, and AGP
>> has been disabled by default on radeon on powerpc for years now.  In
>> fact, this will probably make older hardware more reliable as it takes
>> AGP out of the equation.
>>

> From memory there is quite a loss in speed though, like pretty severe.

> The radeon PCI GART has a single slot TLB, if memory serves.

> I think this is going to be a hard sell at this stage, I'm guessing
> users will crawl out of the woodwork, I'm sure with 2 hours after I'm
> able to access the office, I can boot the 865 AGP box with an rv350 in
> it on a modern distro.

> Maybe we can find some way to compartmentalise AGP further?

> Dave.

Significantly   reduced  caching  on memory accesses definitely sounds
like something that would be noticeable and objectionable.

I would speculate that this would also vary a lot across chipsets,
depending on the capabilities of the PCI MMU vs the AGP MMU.

In the end, it may be best to leave things as is, or as Dave suggested
try to keep AGP in the picture.  

Nothing is ever simple, is it?
Al
