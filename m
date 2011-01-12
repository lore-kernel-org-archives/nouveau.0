From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [kernel PATCH] drm/nouveau: add NOUVEAU_GEM_RELOC_HILO
Date: Wed, 12 Jan 2011 22:41:24 +0100
Message-ID: <20110112214124.GA22901@joi.lan>
References: <1294865031-22457-1-git-send-email-marcin.slusarz@gmail.com>
	<87d3o1j0d4.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87d3o1j0d4.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Jan 12, 2011 at 10:08:55PM +0100, Francisco Jerez wrote:
> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > add new relocation flag which allows to halving number of relocation
> > entries on >= nv50 cards
> >
> I suspect that this change is unnecessary. If you're actually seeing a
> performance improvement (I guess you are?), it's very likely to be

I did it for performance reasons, but actual improvement is very small (0.3%).
I sent these patches, because it's just better to do less and use less memory.

> masking the actual root of the problem -- last time I checked the nv50
> gallium pipe driver was rather careless about reloc re-submission (it
> re-submits the whole reloc chain once for every draw call instead of
> once for every pushbuf flush), and nouveau_reloc_emit() and friends are
> very unoptimized.
> 
> I'm betting that using HILO or not will make pretty much no difference
> once those two places are fixed :).

It looks they are already fixed :).

Well, you can treat these patches as data (relocations are not a bottleneck)
and forget about them.

Marcin
