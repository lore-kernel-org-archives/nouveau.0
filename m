From: "Emil Velikov" <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>
Subject: Re: Problem setting refresh rate on 8400GS
Date: Wed, 09 Mar 2011 19:27:27 -0000
Message-ID: <op.vr3cb0lntkuz1w@emo>
References: <AANLkTinVNbeYDo_g=4EYVt0BJ=4Cf6SJ02dPmUvw860w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinVNbeYDo_g=4EYVt0BJ=4Cf6SJ02dPmUvw860w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Donald Jenkins <dj.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org


   Hi Donald,
See the comments inline

On Wed, 09 Mar 2011 05:38:55 -0000, Donald Jenkins <dj.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  
wrote:
> Hello.
> Having serious problems with all nvidia boards plugged on my PC, now on
> 8400GS.
> Xorg with 2D-only nouveau driver sets invalid preferred refresh rate  
> 60hz on
> SAMTRON 73v, when 75hz needed.

How old is this monitor ? Did it work correctly using the blob/earlier
  nouveau ?

> output of xrandr:
>
> Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 8192 x 8192
> DVI-I-1 disconnected (normal left inverted right x axis y axis)
> VGA-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis)
> 338mm x 270mm
>    1280x1024      60.0*+   75.0
>    1152x864       75.0
>    1024x768       75.1     70.1     60.0
>    832x624        74.6
>    800x600        72.2     75.0     60.3     56.2
>    640x480        72.8     75.0     66.7     60.0
>    720x400        70.1
>
> I can *manually* set correct refresh rate using xrandr -r 75 command (for
> example, in .xinitrc), but Xorg configuration don't recognize it at all.
> Some full screen software games reset refresh rate back to 60hz.
> How I can "hardcode" it in xorg.conf? I really stuck at this point.

You can find how to "hardcode" the timings/refresh rate, by googling for
  "xorg modeline".

Note 1: The refresh rate change will take place AFTER Xorg is up (i.e.
  currently there is not way to set it at boot time).
Note 2: The generated values may or may not work. What you can try is
  startup "Xorg --verbose 9" using the blob and it should print the refresh
  rate/timings used. Then you can add it to xorg.conf

> Thanks.

P.S. Apologies for any typos

Cheers
