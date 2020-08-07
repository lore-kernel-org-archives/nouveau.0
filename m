From: "Vivi, Rodrigo" <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: missing cases of rename
 ttm_mem_reg to ttm_resource.
Date: Fri, 7 Aug 2020 12:28:33 +0000
Message-ID: <816C5382-21E4-4E7A-9ADB-4D18F19E85B4@intel.com>
References: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
 <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w@mail.gmail.com>
 <CAPM=9txoPFXo=+sRV1UanY9iBUkCcuTu62Hz4X0C1iEG=qZCuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9txoPFXo=+sRV1UanY9iBUkCcuTu62Hz4X0C1iEG=qZCuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Content-ID: <582C618166D9614E922242CCF3152AD5-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org



> On Aug 6, 2020, at 9:30 PM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> On Fri, 7 Aug 2020 at 14:03, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> 
>> On Fri, 7 Aug 2020 at 11:13, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
>>> 
>>> From: Rodrigo Vivi <rodrigo.vivi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> 
>>> These are missed cases that I just identified with allyesconfig build.
>>> 
>> 
>> Is this against drm-tip? it's a merge problem, that I thought I'd
>> already addressed, but tip seems to have lost it.
> 
> I think I've fixed drm-tip rebuilds now.

perfect, thanks!

> 
> Dave.
