From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] master-compat: Compile i915 DRM for
 out-of-tree. Optimus laptops need it.
Date: Sat, 12 Nov 2011 18:51:27 +0200
Message-ID: <20111112185127.66224ec1@farn.lan>
References: <4EBCF7BF.3080600@gmail.com> <4EBCF80D.4050705@gmail.com>
	<20111112102729.38dfdb7e@farn.lan> <4EBE4817.7030605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4EBE4817.7030605-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sat, 12 Nov 2011 05:19:03 -0500
Eric Appleman <erappleman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I agree with your rationale, but consider the following case that
> has become increasingly important. Let's say a user wants to test
> bleeding-edge Nouveau DRM on a Sandy Bridge laptop with Optimus
> but doesn't have the knowledge or patience to roll an entire
> kernel or wait for a packaged one. Building nouveau and i915 at
> the same time would make for a convenient alternative and would
> permit faster testing as Optimus solutions such as windump,
> dma_buf, and Bumblebee continue to mature. The Makefile certainly
> allows for it. Would a wiki comment be an acceptable alternative
> to inclusion of this patch?

Yeah, sure, documenting it in the wiki would be nice.
But please do check all the i915 dependencies in the Kconfig files
to make sure that i915 gets what it needs. The Makefile probably
overrides many sanity checks in the kernel config system.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
