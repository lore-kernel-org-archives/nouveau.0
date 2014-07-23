From: Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 08:37:59 -0700
Message-ID: <20140723083759.6b730d67@jbarnes-desktop>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
 <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>
 <53CE56ED.4040109@vodafone.de> <53CE6FB0.90500@canonical.com>
 <53CE7410.3090603@amd.com> <53CE74B5.3000201@canonical.com>
 <53CE77B4.6020801@amd.com>
 <CAKMK7uESXrDtCov8whOTsffg6eZdibF4qaTFaCubM=mnhN=gNQ@mail.gmail.com>
 <CADnq5_Moy78A5JfDM0LME6_-48PW72DJpYYvEthQ5b=_amU8KQ@mail.gmail.com>
 <CAKMK7uGtfUTU=VwSnF07jncJsH1Ckie2m1FCjct60Yz88uE3cg@mail.gmail.com>
 <20140722121435.6bd093d0@jbarnes-desktop>
 <CAKMK7uG-zX2ZDSoQ+XmXOvUeAZzvbdsv02+fX47uJUt=21cRaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uG-zX2ZDSoQ+XmXOvUeAZzvbdsv02+fX47uJUt=21cRaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 23 Jul 2014 11:47:15 +0200
Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:

> On Tue, Jul 22, 2014 at 9:14 PM, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org> wrote:
> >> We don't have the code yet ready, but that's the direction i915 will
> >> move towards for the near future. Jesse is working on some patches
> >> already.
> >
> > Yeah I'd like to get some feedback from Maarten on my bits so I can get
> > them ready for upstream.  I still need to add documentation and tests,
> > but I'd like to make sure the interfaces and internals get acked first.
> 
> Review works better if you supply a pointer to the patches ;-) I asked
> Maarten whether he looked at it and he said he didn't know where ...

Oh I provided it in IRC earlier, figured Maarten was just busy. :)

Tree is android-dma-buf-i915-fences in my fdo linux repo.

-- 
Jesse Barnes, Intel Open Source Technology Center
