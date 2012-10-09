From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix error handling in core/core
 object creation functions
Date: Tue, 9 Oct 2012 10:05:15 +1000
Message-ID: <20121009000515.GA19660@turiel>
References: <1349650171-25045-5-git-send-email-marcin.slusarz@gmail.com>
	<20121008010533.GA4197@turiel.bne.redhat.com>
	<20121008225059.GD3103@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121008225059.GD3103-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Oct 09, 2012 at 12:50:59AM +0200, Marcin Slusarz wrote:
> On Mon, Oct 08, 2012 at 11:05:33AM +1000, Ben Skeggs wrote:
> > On Mon, Oct 08, 2012 at 12:49:31AM +0200, Marcin Slusarz wrote:
> > > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > > This patch relies on "drm/nouveau: remove >1 sclass support from nouveau_parent_create_".
> > > 
> > > There are *many* *more* code paths without proper error handling -
> > This is *not* a bug.  An object's constructor should be called via
> > nouveau_object_ctor(), which has the semantics that the constructor
> > returns and error *and* a pointer returned via pobject, then the
> > class's destructor will be called to cleanup.
> 
> That's... clever, and crazy, and unlike anything in kernel land...
Yep, I know.  It made sense to me, rather than having two copies of the
destructor code, one of them filled with gotos :)

> 
> Please put a comment near ctor field in nouveau_ofuncs to make this
> information easier to discover, without need to review the whole call chain...
Alright, I'll do something to that effect.  I have been adding comments
as I go to some WIP stuff I have going on too.

Ben.
> 
> Marcin
