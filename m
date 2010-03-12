From: Michael D Labriola <mlabriol@gdeb.com>
Subject: Re: Re: [Patch RFC] ttm: nouveau accelerated on Xen pv-ops
	kernel
Date: Fri, 12 Mar 2010 08:20:15 -0500
Message-ID: <OF64B65C67.3FAEC766-ON852576E4.0048C450-852576E4.004943F6@gdeb.com>
References: <d799c4761003120445h57ab1373m31eb0add242ef74c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <xen-devel-bounces@lists.xensource.com>
In-Reply-To: <d799c4761003120445h57ab1373m31eb0add242ef74c@mail.gmail.com>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Arvind R <arvino55@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.sourceforge.net, xen-devel@lists.xensource.com, xen-devel-bounces@lists.xensource.com
List-Id: nouveau.vger.kernel.org

xen-devel-bounces@lists.xensource.com wrote on 03/12/2010 07:45:57 AM:

> On Thu, Mar 11, 2010 at 4:32 PM, Pekka Paalanen <pq@iki.fi> wrote:
*snip*
> Efficacy of patch:
> successful flightgear run on dom0 AND bareboot!
> 
> Arvind R.
> 

If you boot your system up w/out a monitor plugged in, then plug one in, 
do you ever get signal?  I've been playing with nouveau (just bare-metal 
up until now!) for a few weeks as well, and my biggest problem with it is 
that if you have a bunch of PCs on a cheap KVM, they all have to have the 
monitor/keyboard/mouse at boot or you never get any TTY or X logins... 
Maybe I'm just doing something wrong?

-Mike

---
Michael D Labriola
Electric Boat
mlabriol@gdeb.com
401-848-8871 (desk)
401-848-8513 (lab)
401-316-9844 (cell)
