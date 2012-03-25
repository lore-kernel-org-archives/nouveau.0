From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: disable EDID for arcade monitor?
Date: Sun, 25 Mar 2012 20:09:54 +0100
Message-ID: <op.wbqp6smp8t7z9u@arch-laptop>
References: <CAPET_G_qFDahfUmoK5hhiNvZBcnRntP_r0s4-pmHjE72h6J-yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPET_G_qFDahfUmoK5hhiNvZBcnRntP_r0s4-pmHjE72h6J-yQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 25 Mar 2012 19:54:20 +0100, fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I cant make the nouveau work with an arcade monitor, problably because  
> the
> EDID.
> I can make modeline work fine to reduce the horizontal to 15khz, tested  
> in
> a normal pc monitor (with ugly visual because the 15khz in horizontal).
> But when i try in the arcade monitor, dont show any image after xorg  
> start.
As far as I'm aware there is no option to ignore the EDID
If you have provided a comprehensive Modeline, nouveau should use it

In either case you should consider
* trying the xorg-edgers packages
* submit a bug-report, attaching Xorg.0.log & dmesg

Cheers
Emil
