From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: Remove debug info from nouveau driver
Date: Wed, 24 Jun 2020 11:53:24 +0200
Message-ID: <CA+7wUsxhEz_xdVo2S33Ozf-wQ7Z5PDLk6sq0kbaJC0Oy-K-XJA@mail.gmail.com>
References: <CA+7wUswEqHJmmLx+bD4qeLnOEWdhxAK2mt-OXL37-e9NKCuBmQ@mail.gmail.com>
 <CAKb7UvhzgbjGjKzCETzLGJFR_H4+CUak88ZuNKK=dKqMoker4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhzgbjGjKzCETzLGJFR_H4+CUak88ZuNKK=dKqMoker4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Much better now. thanks !

On Tue, Jun 23, 2020 at 5:11 PM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>
> You probably have drm.debug set to something.
>
> On Tue, Jun 23, 2020 at 4:42 AM Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> >
> > Hi there,
> >
> > I am gettings tons of messages in dmesg output such as:
> >
> > [...]
> > [ 2419.238990] [drm:drm_mode_addfb2 [drm]] [FB:65]
> > [ 2419.243388] 00a0 2 base507c_ntfy_set
> > [ 2419.243391] 00000060
> > [ 2419.243391] f0000000
> > [ 2419.243393] 0084 1 base827c_image_set
> > [ 2419.243394] 00000010
> > [ 2419.243395] 00c0 1 base827c_image_set
> > [ 2419.243395] fb00007a
> > [ 2419.243396] 0110 2 base827c_image_set
> > [ 2419.243397] 00000000
> > [ 2419.243398] 00000000
> > [ 2419.243399] 0800 5 base827c_image_set
> > [ 2419.243399] 0007ce00
> > [ 2419.243400] 00000000
> > [ 2419.243400] 04380780
> > [ 2419.243401] 00007804
> > [ 2419.243402] 0000cf00
> > [ 2419.243408] 0080 1 base507c_update
> > [ 2419.243409] 00000000
> > [...]
> >
> > Does anyone know how to remove those extra debug info from nouveau driver ?
> >
> > For reference:
> >
> > # cat /sys/module/nouveau/parameters/debug
> > (null)
> >
> > Thanks much
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
