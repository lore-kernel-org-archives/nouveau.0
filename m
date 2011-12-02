From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau driver is not loading
Date: Fri, 2 Dec 2011 20:28:53 +0100
Message-ID: <20111202192853.GC3302@joi.lan>
References: <20111129210404.162990@gmx.net>
	<CAMVNhxQTizDCJ8utXW=Mr=ktu3S_6SozYg2+vqAcbEz8V9PvAg@mail.gmail.com>
	<20111201195400.107610@gmx.net>
	<CAMVNhxQyCsJFxu2gK_uG3wqPfrzqhMCcfw1GryyV+D-mKRYRHw@mail.gmail.com>
	<20111202191846.296410@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202191846.296410-hi6Y0CQ0nG0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lars Callenbach <lars.callenbach-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Dec 02, 2011 at 08:18:46PM +0100, Lars Callenbach wrote:
> I have not tested nouveau before. NVidia driver loads but system freezes after a few seconds.
> 
> Do you think it is related to my old AGP card?

More likely related to quirky AGP bridge.
Maybe you can find "do-not-lockup" switch in BIOS? ;)

Marcin
