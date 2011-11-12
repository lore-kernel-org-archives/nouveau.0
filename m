From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] master-compat: Compile i915 DRM for
 out-of-tree. Optimus laptops need it.
Date: Sat, 12 Nov 2011 10:27:29 +0200
Message-ID: <20111112102729.38dfdb7e@farn.lan>
References: <4EBCF7BF.3080600@gmail.com>
	<4EBCF80D.4050705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4EBCF80D.4050705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Eric Appleman <erappleman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 11 Nov 2011 05:25:17 -0500
Eric Appleman <erappleman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 11/11/2011 05:23 AM, Eric Appleman wrote:
> > Hi, a machine with both an Intel and Nvidia GPU needs both
> > drivers built as modules otherwise the former will not work
> > properly.
> >
> > - Eric
> Sorry, Thunderbird is bad with attachments.

Sorry, I'm not going to apply this.

This way of installing is meant only for nouveau, and building
i915 is for most people useless.

If you want both nouveau and i915, I would recommend building
the whole kernel with both of these from either Nouveau linux tree,
or Linus' tree. Or some other upstream tree.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
