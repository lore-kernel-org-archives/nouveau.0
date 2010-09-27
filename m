From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [drm] failed to open device
Date: Mon, 27 Sep 2010 15:44:22 +1000
Message-ID: <1285566262.2360.0.camel@nisroch>
References: <AANLkTim1Qp9Wd_P=rQEKh3Mp8zukPLwqkrg-nY7u3SU2@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTim1Qp9Wd_P=rQEKh3Mp8zukPLwqkrg-nY7u3SU2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dmitri Sosnik <dimavs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2010-09-27 at 15:35 +1000, Dmitri Sosnik wrote:
> Hi All,
> 
> I am trying to get nouveau working on MacBookPro 4,1. I am using
> kernel from nouveau/linux-2.6 repository, XOrg 1.9, libdrm and
> xf86-video-nouveau from git repositories.
> When drm module is loaded with debug=1 it gives a number of "[drm:
> drm_stub_open]," lines in logs. It looks like idr_find(...) function
> returns 0. /dev/dri/card0 doesn't exist.
> 
> What I am doing wrong?
It's hard to say.  My initial assumption would be you don't have the
kernel module loaded.  Failing that, your dmesg output should give more
clues.

Ben.
> 
> Cheers,
> D
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
