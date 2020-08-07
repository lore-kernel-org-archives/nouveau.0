From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: missing cases of rename
 ttm_mem_reg to ttm_resource.
Date: Fri, 7 Aug 2020 14:30:25 +1000
Message-ID: <CAPM=9txoPFXo=+sRV1UanY9iBUkCcuTu62Hz4X0C1iEG=qZCuA@mail.gmail.com>
References: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
 <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, 7 Aug 2020 at 14:03, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Fri, 7 Aug 2020 at 11:13, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> >
> > From: Rodrigo Vivi <rodrigo.vivi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > These are missed cases that I just identified with allyesconfig build.
> >
>
> Is this against drm-tip? it's a merge problem, that I thought I'd
> already addressed, but tip seems to have lost it.

I think I've fixed drm-tip rebuilds now.

Dave.
