From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau framebuffer sync polarity
Date: Tue, 17 Jan 2012 00:43:04 -0000
Message-ID: <op.v77dl2ib8t7z9u@arch-laptop>
References: <1RmhwL-0t8a120@fwd23.aul.t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1RmhwL-0t8a120-qIEalq/INzui2rA4ip7KQzlaCuRwF3y+@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org" <schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 16 Jan 2012 08:29:17 -0000, schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org  
<schmidtler-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> wrote:

>
> Hello everyone,
Hi Ralph

> i use the noveau framebuffer device in kernel version 2.6.37.6.
> my graphic adapter is a msi 9500gt, connected to a Barco CRT projector.
> The Barco will only accept RGB signals with a negative sync.
> Is there a kernel command line parameter to force negative sync
> polarity?
AFAIK there is no such parameter, although I may be wrong

> Or is there a user space command to set framebuffer parameters, fbset
> does'nt work with nouveau frame buffers.
Note that if you are interested in userspace (X), a custom Modeline in
your xorg.conf may do the job

fbset does not work with any KMS drivers unfortunately

Regards
Emil

>
> Ralph
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
