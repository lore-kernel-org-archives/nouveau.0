From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau_class.h
Date: Fri, 09 Apr 2010 19:28:26 +1000
Message-ID: <1270805306.2563.1.camel@nisroch>
References: <1270795913.2644.4.camel@nisroch>
	<y2x6a89f9d51004090033n89b7e014y8221761e05657f24@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <y2x6a89f9d51004090033n89b7e014y8221761e05657f24-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2010-04-09 at 00:33 -0700, Stephane Marchesin wrote:
> On Thu, Apr 8, 2010 at 23:51, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > So, with all the nouveau_class.h changes lately it's become rather
> > difficult to keep libdrm synced up with a particular mesa version.
> >
> > This is much like what happens when we break our kernel ABI, but on a
> > far more regular basis so it has a larger impact.
> >
> > I'm proposing we drop nouveau_class.h from libdrm again, and move it
> > back to the ddx and mesa trees where it can be updated at the same time
> > the code that uses it is.
> >
> > Any objections / other suggestions?
> >
> 
> Agreed. We don't need more interfaces, we need less interfaces.
Great, I probably have some time to kill tonight so I'll probably get it
done in the next couple of hours.

Ben.
> 
> Stephane
