From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] RFC: gallium-msaa branch merge
Date: Fri, 21 May 2010 23:40:23 +0200
Message-ID: <AANLkTilG7aGderzZS5KtfLPFBvKDUrFCRrdq89cNAY4m@mail.gmail.com>
References: <4BF2C897.8090008@vmware.com>
	<AANLkTilp8IaazHhOaTMTjeGc8kVnaKhKZXM60pyNrn1l@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTilp8IaazHhOaTMTjeGc8kVnaKhKZXM60pyNrn1l-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ok, after looking at how some other drivers were updated, I thought
nouveau needed bigger changes than that.
Jakob just pushed a simple build fix, and now nv50 builds and runs (almost ;)).

I just noticed 5 piglit regressions :
fbo/fbo-copypix
fbo/fbo-copyteximage
general/scissor-copypixels
texturing/depth-level-clamp
texturing/texredefine


And I am not sure how important is the TODO mentioned in the commit log below.

commit b59b23a51dc17da59ccff0b3f8a73009056746e5
Author: Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Date:   Mon May 17 21:28:14 2010 +0200

    nouveau: adapt to interface changes

    this probably needs further cleanup (just getting a surface for the resource
    seems quite nonoptimal and potentially cause unnecessary copies I think)
