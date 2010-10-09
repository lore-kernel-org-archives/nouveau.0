From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [Nouveau] nouveau/ttm: BUG in ttm_bo_release_list
Date: Sat, 9 Oct 2010 15:58:41 +0200
Message-ID: <20101009135841.GA3628@joi.lan>
References: <20100917174352.GA2770@joi.lan> <1284766761.14299.1.camel@araqiel>
	<20100918111848.GA2953@joi.lan>
	<4CB073F6.4050407@tragetaschen.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <4CB073F6.4050407@tragetaschen.dyndns.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Kai Ruhnau <kai@tragetaschen.dyndns.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sat, Oct 09, 2010 at 03:53:58PM +0200, Kai Ruhnau wrote:
>  On 09/18/2010 01:18 PM, Marcin Slusarz wrote:
> > On Sat, Sep 18, 2010 at 09:39:21AM +1000, Ben Skeggs wrote:
> >> On Fri, 2010-09-17 at 19:43 +0200, Marcin Slusarz wrote:
> >>> Hi
> >>> Since upgrade from 2.6.35 to 2.6.36-rc3 (nouveau tree) I'm hitting this bug a couple of times a day:
> [oops]
> >>> this is BUG_ON(atomic_read(&bo->cpu_writers));
> >>>
> >>> I'm on b642f07208988270ac402d2548d42dab1d5fec92 "drm/nv50: fix 100c90 write on nva3".
> >>> If you have any patches / ideas how to debug this, let me know.
> >> I've actually seen this a couple of times.  It appears I was incorrectly
> >> blaming some patches I have in progress for it, the problem appeared to
> >> go away when I reverted them.  Perhaps it's more random.  I have no
> >> current ideas however.
> >>
> > Heh, Francisco provided the patch on IRC, which seem to fix this bug.
> >
> > http://annarchy.freedesktop.org/~currojerez/nouveau_cpu_prep_validate.patch
> >
> > I'm still testing it.
> >
> >
> 
> Hi
> 
> How is this fix working out?

The fix is in Linus' tree, commit 0fbecd400dd0a82d465b3086f209681e8c54cb0f:
"drm/ttm: Clear the ghost cpu_writers flag on ttm_buffer_object_transfer"

Marcin
