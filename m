From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: rendering problems with latest ddx driver (nv50)
Date: Wed, 25 Apr 2012 10:38:52 +1000
Message-ID: <1335314332.1821.7.camel@nisroch>
References: <CAGZ4FETeOjfQD5DV1+=sx4NCk9xuMrvQhH1fS-TrmoVRiMc7mQ@mail.gmail.com>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FETeOjfQD5DV1+=sx4NCk9xuMrvQhH1fS-TrmoVRiMc7mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2012-04-24 at 20:14 +0200, Maarten Maathuis wrote:
> Do you get rendering errors also when using a nv50 class gpu? I seem
> to get them in firefox.
Hmm, I haven't noticed anything on my NVA8 laptop.

> 
> I also noticed a huge amount of failures when running rendercheck -t
> gradients, which i find odd, because they are not supposed to be
> accelerated.
I think either pixman or the rendercheck test is broken.  It doesn't
pass with software rendering, or the Intel driver's accelerated version.

The detected/expected colours are very close when I looked at this, so
it may just be a question of precision.

Ben.

> 
