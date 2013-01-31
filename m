From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kernel driver prevents supend to disk since 3.7 series
Date: Thu, 31 Jan 2013 19:12:41 +0100
Message-ID: <20130131181241.GA3831@joi.lan>
References: <20130130082517.GG18606@lemon.iwr.uni-heidelberg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130130082517.GG18606-/wZ4IcVS6hAdmw7VdWMmteH3J2bgQ+4lG9Ur7JDdleE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Hermann Lauer <Hermann.Lauer-hEciA7+sKtudPOQpRHQ53DeJuz7u0hKX@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Jan 30, 2013 at 09:25:17AM +0100, Hermann Lauer wrote:
> Hello,
> 3.7.x kernels prevent my laptop with Optimus VGA from suspend to disk
> with an PFIFO write fault in PCOPY0, see kernel log below.
> 
> During the 3.6.x upto 3.6.11 suspend worked without problems.
> lspci -v info of the VGAs is attached.
> 
> What may I do to debug this further ?

You can try the latest 3.8-rc kernel and if you still won't be able to suspend,
bisecting is the most useful thing you can do (google "git bisect" if you
don't know how).

Marcin
