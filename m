From: Andreas Radke <a.radke-KvP5wT2u2U0@public.gmane.org>
Subject: Re: Dropping compat from master-compat
Date: Wed, 9 Sep 2009 22:02:13 +0200
Message-ID: <20090909220213.1d5c0378@laptop64.home>
References: <20090909205136.76d6d351@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090909205136.76d6d351-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Wed, 9 Sep 2009 20:51:36 +0300
schrieb Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>:

> Hi,
> 
> the master-compat branch in nouveau/linux-2.6 kernel tree has got a
> little bit out of hand. Distributions are packaging that, and I
> cannot know if they warn their users well enough about the hazards
> of using backported DRM (see:
> http://nouveau.freedesktop.org/wiki/UpstreamKernelIssues ).
> 
> I originally intended master-compat as an easy way of installing
> the Nouveau flavour of DRM modules even on older kernels, because
> I felt I should share my helper scripts and patches. However, I
> never intended to do real kernel bug tracking, that was the users'
> responsiblity. I didn't bring that fact forward well enough and
> I'm sorry about that. Now I know why no-one else has done this
> for any of the other drivers. It's drm.git all over again.
> 
> Also, running the Nouveau DRM with an older kernel is of questionable
> value when it comes to testing. Why support something you do not
> really support?
> 
> Therefore, I will drop compatibility code from master-compat branch,
> and I will add a compile time check for the kernel version. The
> master-compat branch will be just like the master branch, except it
> contains the out-of-tree build scripts. This will force users to
> follow very closely the official RC and release kernels.
> 
> If you want to use the latest Nouveau DRM with an older kernel,
> you get to do the backporting and kernel bug tracking yourself.
> This is the distributions' responsibility in general.
> 
> Couple of things to remember:
> - there still are no releases of any Nouveau code
> - the recommended way to build Nouveau DRM is to build the
> whole kernel from the same tree.
> 
> Sorry for the trouble, but we need to look forward.
> 

Sorry to hear that. 

My distribution does not allow any backports to the main packages
(e.g libdrm and kernel) . We ship almost everything in the latest stable
released version plain vanilla. If you want us to keep shipping nouveau
driver please make sure we can always build against the latest stable
released kernel and libdrm.

I know there's no released nouveau driver out so far but if you want a
wide user range make sure it can be build on top of the latest stable
stuff distributions have in their repos.

-Andreas Radke
Arch Linux package maintainer
