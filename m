From: Richi Plana <richip-phGNbu20FqI6LPSSItiycw@public.gmane.org>
Subject: Re: Driver Problem with 7150M
Date: Thu, 03 Apr 2008 23:20:22 -0600
Message-ID: <1207286422.6962.18.camel@localhost6.localdomain6>
References: <1207277680.6962.6.camel@localhost6.localdomain6>
	<6a89f9d50804032001u1862c4dby9e90fe0591f65cd6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <6a89f9d50804032001u1862c4dby9e90fe0591f65cd6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2008-04-04 at 05:01 +0200, Stephane Marchesin wrote:
> On 4/4/08, Richi Plana <richip-phGNbu20FqI6LPSSItiycw@public.gmane.org> wrote:
> > Hi,
> >
> >  I tried using the nouveau driver that comes latest with Fedora Rawhide
> >  (xorg-x11-drv-nouveau-0.0.10-1.20080311git460cb26) on my HP Pavilion
> >  dv2000 laptop with a GeForce 7150M (PCI 10de:0531) but couldn't even get
> >  the server up. The server spit out the following log. Could someone tell
> >  me how to get things working?
> 
> Sure, by using git instead of an old snapshot.

That did the trick!

I've a question (that's actually more of a git question). I've used svn
and cvs before and git not at all. In nouveau git, what is "460bc26" and
how can I list other valid "tree-ish" options to pass to git-archive?
--

Richi Plana
