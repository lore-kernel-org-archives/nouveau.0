From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new
Date: Mon, 1 Jun 2020 13:37:20 +1000
Message-ID: <CACAvsv5kcUC_kOfMPxqY-irSAexmhm=WKO8Vk=wTZWdsbaartw@mail.gmail.com>
References: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
 <CACAvsv73wZK_pKk4TDHaTeBUqxYHvK0KhLQBgPC8Be_VviY2jg@mail.gmail.com>
 <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kjlu-OJFnDUYgAso@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Markus.Elfring-S0/GAf8tV78@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, 1 Jun 2020 at 13:27, <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org> wrote:
>
>
> Hi Ben,
>
> > > When gk20a_clk_ctor() returns an error code, pointer "clk"
> > > should be released. It's the same when gm20b_clk_new()
> > > returns from elsewhere following this call.
> > This shouldn't be necessary.  If a subdev constructor fails, and
> > returns a pointer, the core will call the destructor to clean things
> > up.
> >
>
> I'm not familiar with the behavior of the caller of gm20b_clk_new().
> If the subdev constructor fails, the core will check the pointer
> (here is "pclk"), then it's ok and there is no bug (Do you mean
> this?). If the core executes error handling code only according to
> the error code, there may be a memory leak bug (the caller cannot
> know if -ENOMEM comes from the failure of kzalloc or gk20a_clk_ctor).
> If the core always calls the destructor as long as the constructor
> fails (even if the kzalloc fails), we may have a double free bug.
>
> Would you like to give a more detailed explanation about the behavior
> of the core?
If there's *any* error, it'll check the pointer, if it's non-NULL,
it'll call the destructor.  If kzalloc() fails, the pointer will be
NULL, there's no double-free bug.  *every* subdev is written this way
to avoid duplicating cleanup logic.

Ben.
>
> Regards,
> Dinghao
