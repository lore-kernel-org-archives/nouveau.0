From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] g3dvl: disable iDCT for now
Date: Thu, 28 Jul 2011 08:54:53 +1000
Message-ID: <1311807296.8504.20.camel@nisroch>
References: <n> <1311187717-3621-2-git-send-email-bryancain3@gmail.com>
	<1311752531.2296.0.camel@nisroch> <4E306234.5040502@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E306234.5040502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2011-07-27 at 14:08 -0500, Bryan Cain wrote:
> On 07/27/2011 02:42 AM, Ben Skeggs wrote:
> > On Wed, 2011-07-20 at 13:48 -0500, Bryan Cain wrote:
> >> ---
> >>  src/vl_hwmc.c |    4 ++--
> >>  1 files changed, 2 insertions(+), 2 deletions(-)
> > The obvious question I have for this is, why?
> >
> > Ben
> 
> At least at the time I wrote these patches (in April), the iDCT stage
> didn't work correctly with nv50.  If it's fixed now, this patch can be
> ignored.
Then it should be fixed in mesa if that's the case, not disabled in the
DDX, that helps nothing.

Some time down the track, when it *does* work, we'll re-enable it, and
someone will update just the DDX and see the breakage because they
haven't updated mesa yet too..

Ben.

> 
> Bryan
> 
> 
> >> diff --git a/src/vl_hwmc.c b/src/vl_hwmc.c
> >> index 6e9e0c7..8e24786 100644
> >> --- a/src/vl_hwmc.c
> >> +++ b/src/vl_hwmc.c
> >> @@ -55,7 +55,7 @@ static XF86MCSurfaceInfoRec yv12_mpeg2_surface =
> >>  	2048,
> >>  	2048,
> >>  	2048,
> >> -	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
> >> +	/*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,
> >>  	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
> >>  	&subpicture_list
> >>  };
> >> @@ -69,7 +69,7 @@ static XF86MCSurfaceInfoRec uyvy_mpeg2_surface =
> >>  	2048,
> >>  	2048,
> >>  	2048,
> >> -	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
> >> +	/*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,
> >>  	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
> >>  	&subpicture_list
> >>  };
> >
> >
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
