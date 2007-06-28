From: "Jaap Stolk" <jwstolk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kmmio dump log format
Date: Thu, 28 Jun 2007 22:58:15 +0200
Message-ID: <95c320f10706281358o40e5fe41pf8c1c97325f5f5ad@mail.gmail.com>
References: <62cc563b0706200723k117433d2w9a28e35aa3bc2f16@mail.gmail.com>
	<20070621001759.765a79a4@daedalus.pq.iki.fi>
	<62cc563b0706201847l593f86acyde83b1aab74727d2@mail.gmail.com>
	<20070621155428.67c98e98@daedalus.pq.iki.fi>
	<62cc563b0706271125j148a30f9mc2eba11cba14f1b3@mail.gmail.com>
	<20070628171027.16a619bc@daedalus.pq.iki.fi>
	<62cc563b0706281045w474580f6v8f9f8685ee415cab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <62cc563b0706281045w474580f6v8f9f8685ee415cab-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
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

> > > In your redesign of the binary dump format, could you add the ability
> > > to store multiple PCs per sample? (ie, so that I can do backtraces (4
> > > frames deep?) ) rather than just a single PC?

In the current proposal for the new packet based format, we have a single PC
(which we don't use right now). we could define a read/write packet
as: address + value + r/w mode + (optionally) any number of PC's.  the
number of PC's is indicated by the packet length in the packet header.
This we save a bit when we don't need the PC and support any number of
PC's at the same time.

Tools that don't make use of the PC's can simply skip them.

(there are also pending issues, like whether we need to support 64 bit values)

jaap.
