From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "userspace nouveau" on NV15
Date: Tue, 17 Sep 2013 10:21:18 +1000
Message-ID: <CACAvsv7ezdGcZTE0LBEz248_ARKKUDQ1TcXOz6vNUumghKU5oQ@mail.gmail.com>
References: <CALT56yNy42EHtpQK3Whk0tMAVyB-9B-4KNOJu+Sfsxu8V5rbBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CALT56yNy42EHtpQK3Whk0tMAVyB-9B-4KNOJu+Sfsxu8V5rbBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 17, 2013 at 10:04 AM, Dmitry Eremin-Solenikov
<dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> I'm trying to get "userspace" nouveau to work on the NV15 card
> (GeForce2 GTS - ASUS v7700 TVR).
> Whilte kernel nouveau driver works, userspace nv_init programs hangs
> during CONFIGURE_MEM.
Does this help?
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0c283c96aa58fa50d036662159d489dcba91d0bb

>
> I have produced a trace log (in attach) in the hope that it will help.
> Card is installed as a primary (the only) card in a box and is
> correctly booted by VBIOS.
>
> --
> With best wishes
> Dmitry
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
