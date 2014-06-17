From: Thomas Glanzmann <thomas-U3NvvseaQwJn68oJJulU0Q@public.gmane.org>
Subject: Re: REGRESSION: Kernel PANIC
 8777c5c11764d8336d8270f96778158c34c92108 - drm/nouveau/dp: probe dpcd to
 determine connectedness
Date: Tue, 17 Jun 2014 07:46:54 +0200
Message-ID: <20140617054654.GB9117@glanzmann.de>
References: <20140613095820.GA21162@glanzmann.de>
 <CACAvsv5dVMKcF67SO1qT=Foh4F0DkHeWNUztf8sQf++8GF-eMw@mail.gmail.com>
 <20140617053332.GA9117@glanzmann.de>
 <CACAvsv6nyu4cw6Yc1r5L8XNbS_Dyrka7o1JH=2Kc6URUWVcxjA@mail.gmail.com>
 <CACAvsv7WVPVE_axXU9MS07DVRsn9DaZ+NF5A+9yYr5XxKWYe3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv7WVPVE_axXU9MS07DVRsn9DaZ+NF5A+9yYr5XxKWYe3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello Ben,

> > 8777c5c11764d8336d8270f96778158c34c92108 (which is mentioned as the
> > first bad commit above...) is a tiny commit, so I have no idea what
> > you mean by "too large for your taste".

for example I would not export a symbol and do something else in the
same commit, but would split them up in two. I do the minimum work per
commit without breaking compilation or functionality. That way it is
easier to identify issues later on.

> In any case, I encountered the oops myself earlier (absolutely nothing
> to do with that commit) and fixed it here.  I've sent it onto Dave for
> the next -fixes merge, so hopefully it'll help your case too.

Can you please send me your fix. I can reboot my machine remotely, but
only once. That way I can tell you if your fix works, or not.

> I have no idea why gmail doesn't auto-add you to the Cc list on reply
> all.. But.. Done :)

thanks.

Cheers,
        Thomas
