From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: remove >1 sclass support from
 nouveau_parent_create_
Date: Tue, 9 Oct 2012 10:05:54 +1000
Message-ID: <20121009000554.GB19660@turiel>
References: <1349650171-25045-4-git-send-email-marcin.slusarz@gmail.com>
	<20121008010646.GB4197@turiel.bne.redhat.com>
	<20121008230208.GE3103@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121008230208.GE3103-OI9uyE9O0yo@public.gmane.org>
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

On Tue, Oct 09, 2012 at 01:02:08AM +0200, Marcin Slusarz wrote:
> On Mon, Oct 08, 2012 at 11:06:46AM +1000, Ben Skeggs wrote:
> > On Mon, Oct 08, 2012 at 12:49:30AM +0200, Marcin Slusarz wrote:
> > > It's unused (only one codepath passes sclass at all and it's always one),
> > > broken (overwrites the same field, leaking previous one) and confusing.
> > It's only *currently* unused, I have WIP code in branches that uses it,
> > otherwise it wouldn't still exist :)
> 
> Yeah, like _nouveau_parent_ctor :P
Point taken :P

> 
> > I will take a look today at the claims it's broken, it wasn't at some
> > point but may have got busted along the way somehow.
> 
> Oh, it chains them in list...
> 
> /me hides.
Hehe :)

Ben.

> 
> Marcin
