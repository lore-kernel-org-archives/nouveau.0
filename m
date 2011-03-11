From: Donald Jenkins <dj.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problem setting refresh rate on 8400GS
Date: Fri, 11 Mar 2011 23:37:24 +0700
Message-ID: <AANLkTimKVcOoJayrPo71k7XM34z85XVaDauo=ew6KQ_Y@mail.gmail.com>
References: <AANLkTinVNbeYDo_g=4EYVt0BJ=4Cf6SJ02dPmUvw860w@mail.gmail.com>
	<op.vr3cb0lntkuz1w@emo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1025946305=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.vr3cb0lntkuz1w@emo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1025946305==
Content-Type: multipart/alternative; boundary=000e0cd2e0b8a7c189049e3793f5

--000e0cd2e0b8a7c189049e3793f5
Content-Type: text/plain; charset=ISO-8859-1

I start Xorg manually by typing "startx" at the terminal. I use this rarely,
because I put the computer in sleep state often.
Modeline did not helped. I'm correct if I try to use a sample modeline given
in Xorg.*.log for 75hz refresh?
I got the board recently, I never used blob and never will be. I also do not
rely on Gallium 3D today, so I use safe environ now. I had some tests with
newer nvidia board, with same result. All works OK except this terrible
behaviour.
The monitor is capable to use 80Ghz/75Hz refresh rate, I use(d) ati before,
before it goes mad sometimes. The refresh rate picked up correctly on ati, I
used this for years.
I can boot up into framebuffer console with 75hz normally via video= kernel
command line parameter. When startx, all drops down to 60hz, and can be only
manually set up with xrandr.
Sorry for incorrect English and thanks alot for your answer.

On Thu, Mar 10, 2011 at 2:27 AM, Emil Velikov <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>wrote:

>
>  Hi Donald,
> See the comments inline
>
>
> On Wed, 09 Mar 2011 05:38:55 -0000, Donald Jenkins <dj.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>
>> Hello.
>> Having serious problems with all nvidia boards plugged on my PC, now on
>> 8400GS.
>> Xorg with 2D-only nouveau driver sets invalid preferred refresh rate 60hz
>> on
>> SAMTRON 73v, when 75hz needed.
>>
>
> How old is this monitor ? Did it work correctly using the blob/earlier
>  nouveau ?
>
>
>  output of xrandr:
>>
>> Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 8192 x 8192
>> DVI-I-1 disconnected (normal left inverted right x axis y axis)
>> VGA-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis)
>> 338mm x 270mm
>>   1280x1024      60.0*+   75.0
>>   1152x864       75.0
>>   1024x768       75.1     70.1     60.0
>>   832x624        74.6
>>   800x600        72.2     75.0     60.3     56.2
>>   640x480        72.8     75.0     66.7     60.0
>>   720x400        70.1
>>
>> I can *manually* set correct refresh rate using xrandr -r 75 command (for
>> example, in .xinitrc), but Xorg configuration don't recognize it at all.
>> Some full screen software games reset refresh rate back to 60hz.
>> How I can "hardcode" it in xorg.conf? I really stuck at this point.
>>
>
> You can find how to "hardcode" the timings/refresh rate, by googling for
>  "xorg modeline".
>
> Note 1: The refresh rate change will take place AFTER Xorg is up (i.e.
>  currently there is not way to set it at boot time).
> Note 2: The generated values may or may not work. What you can try is
>  startup "Xorg --verbose 9" using the blob and it should print the refresh
>  rate/timings used. Then you can add it to xorg.conf
>
>  Thanks.
>>
>
> P.S. Apologies for any typos
>
> Cheers
>

--000e0cd2e0b8a7c189049e3793f5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I start Xorg manually by typing &quot;startx&quot; at the terminal. I use t=
his rarely, because I put the computer in sleep state often.<br>Modeline di=
d not helped. I&#39;m correct if I try to use a sample modeline given in Xo=
rg.*.log for 75hz refresh?<br>
I got the board recently, I never used blob and never will be. I also do no=
t rely on Gallium 3D today, so I use safe environ now. I had some tests wit=
h newer nvidia board, with same result. All works OK except this terrible b=
ehaviour.<br>
The monitor is capable to use 80Ghz/75Hz refresh rate, I use(d) ati before,=
 before it goes mad sometimes. The refresh rate picked up correctly on ati,=
 I used this for years.<br>I can boot up into framebuffer console with 75hz=
 normally via video=3D kernel command line parameter. When startx, all drop=
s down to 60hz, and can be only manually set up with xrandr.<br>
Sorry for incorrect English and thanks alot for your answer.<br><br><div cl=
ass=3D"gmail_quote">On Thu, Mar 10, 2011 at 2:27 AM, Emil Velikov <span dir=
=3D"ltr">&lt;<a href=3D"mailto:emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org">emil.velikov@yahoo=
.co.uk</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>
 =A0Hi Donald,<br>
See the comments inline<div class=3D"im"><br>
<br>
On Wed, 09 Mar 2011 05:38:55 -0000, Donald Jenkins &lt;<a href=3D"mailto:dj=
.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">dj.jankins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Hello.<br>
Having serious problems with all nvidia boards plugged on my PC, now on<br>
8400GS.<br>
Xorg with 2D-only nouveau driver sets invalid preferred refresh rate 60hz o=
n<br>
SAMTRON 73v, when 75hz needed.<br>
</blockquote>
<br></div>
How old is this monitor ? Did it work correctly using the blob/earlier<br>
=A0nouveau ?<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
output of xrandr:<br>
<br>
Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 8192 x 8192<br>
DVI-I-1 disconnected (normal left inverted right x axis y axis)<br>
VGA-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis)<br=
>
338mm x 270mm<br>
 =A0 1280x1024 =A0 =A0 =A060.0*+ =A0 75.0<br>
 =A0 1152x864 =A0 =A0 =A0 75.0<br>
 =A0 1024x768 =A0 =A0 =A0 75.1 =A0 =A0 70.1 =A0 =A0 60.0<br>
 =A0 832x624 =A0 =A0 =A0 =A074.6<br>
 =A0 800x600 =A0 =A0 =A0 =A072.2 =A0 =A0 75.0 =A0 =A0 60.3 =A0 =A0 56.2<br>
 =A0 640x480 =A0 =A0 =A0 =A072.8 =A0 =A0 75.0 =A0 =A0 66.7 =A0 =A0 60.0<br>
 =A0 720x400 =A0 =A0 =A0 =A070.1<br>
<br>
I can *manually* set correct refresh rate using xrandr -r 75 command (for<b=
r>
example, in .xinitrc), but Xorg configuration don&#39;t recognize it at all=
.<br>
Some full screen software games reset refresh rate back to 60hz.<br>
How I can &quot;hardcode&quot; it in xorg.conf? I really stuck at this poin=
t.<br>
</blockquote>
<br></div>
You can find how to &quot;hardcode&quot; the timings/refresh rate, by googl=
ing for<br>
=A0&quot;xorg modeline&quot;.<br>
<br>
Note 1: The refresh rate change will take place AFTER Xorg is up (i.e.<br>
=A0currently there is not way to set it at boot time).<br>
Note 2: The generated values may or may not work. What you can try is<br>
=A0startup &quot;Xorg --verbose 9&quot; using the blob and it should print =
the refresh<br>
=A0rate/timings used. Then you can add it to xorg.conf<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Thanks.<br>
</blockquote>
<br>
P.S. Apologies for any typos<br>
<br>
Cheers<br>
</blockquote></div><br>

--000e0cd2e0b8a7c189049e3793f5--

--===============1025946305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1025946305==--
