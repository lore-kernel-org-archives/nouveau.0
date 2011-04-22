From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Nvidia GT450M
Date: Fri, 22 Apr 2011 21:31:43 +0300
Message-ID: <20110422213143.2957ed15@farn.lan>
References: <BANLkTinPx2y-7YZxg6amLvVsaPgaVY2x5w@mail.gmail.com>
	<1303165988.3453.0.camel@nisroch>
	<BANLkTikgjUfmtAHUqs08cT=G7koGTvW21Q@mail.gmail.com>
	<1303210694.6174.0.camel@nisroch>
	<BANLkTimgbhCdKZB8HdpOTcMaNxxOpOCE-A@mail.gmail.com>
	<BANLkTi=6eP_mF7fg9Xre5FA8WU4ouRjVgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BANLkTi=6eP_mF7fg9Xre5FA8WU4ouRjVgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marc Rios <marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 22 Apr 2011 18:32:51 +0200
Marc Rios <marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
> 
> Here you have:

<snip>

From your paste:
[   11.819386] fb1: nouveaufb frame buffer device

This means nouveaufb is fb1, while fbcon by default is in fb0.
That is, fbcon is not using nouveaufb, but another driver that
was loaded before nouveau. Unfortunately we cannot see what
happened, because you did not include the full dmesg.
Full really means full, from boot, up to and including the
problem, not filtered in any way.

I hope other people will see this reply and really post a full
dmesg when asked to. It is also instructed in
http://nouveau.freedesktop.org/wiki/Bugs

Thanks.

> > On Tue, Apr 19, 2011 at 12:58 PM, Ben Skeggs
> > <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> Not to you having a black screen, no.  Can you post your
> >> *full* dmesg output after you've tried to load nouveau?
> >>
> >> Ben.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
