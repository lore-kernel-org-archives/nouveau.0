From: Christ-Jan Wijtmans <cj.wijtmans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Selecting supported chipsets in the driver?
Date: Fri, 29 Nov 2013 14:17:37 +0100
Message-ID: <CAMjv+TSscEmtCzW+oJ9oQ5hOewmZDWQwJ-FRb3cg==bkY=Bm1A@mail.gmail.com>
References: <CAMjv+TQLp4dCfa0FHmfUOYZR3H_RMwiev=59Ocr3WN=drky=YQ@mail.gmail.com>
	<51F83EA7.8050704@gmail.com>
	<CAKb7UvgNmvcuUD4T0+0MdK_Drk3vp9CgLGGtANJC_up04otvvA@mail.gmail.com>
	<51F922E7.1050100@free.fr>
	<CAKb7UvhyvHXN5dXdfp_By6K3fdr_17S87ptgLP-EHLpw_G=V6g@mail.gmail.com>
	<51F9306B.1020602@free.fr>
	<CAMjv+TTjz40ry-i7XaVTS488_iFrT0rj-K2LHiDEhxZmW69Law@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0544907603=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMjv+TTjz40ry-i7XaVTS488_iFrT0rj-K2LHiDEhxZmW69Law-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0544907603==
Content-Type: multipart/alternative; boundary=089e01182da868d86b04ec50a738

--089e01182da868d86b04ec50a738
Content-Type: text/plain; charset=UTF-8

so uhm, as far as i know in ATI drivers this is possible, why no nouveau?


Live long and prosper,

Christ-Jan Wijtmans
https://github.com/cjwijtmans
http://facebook.com/cj.wijtmans
http://twitter.com/cjwijtmans


On Thu, Aug 1, 2013 at 2:15 AM, Christ-Jan Wijtmans
<cj.wijtmans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:

> Sorry but 1.7 and 6.3 MB are huge...
>
>
> Live long and prosper,
>
> Christ-Jan Wijtmans
> http://facebook.com/cj.wijtmans
> http://twitter.com/cjwijtmans
>
>
> On Wed, Jul 31, 2013 at 5:42 PM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>wrote:
>
>> On 31/07/2013 11:03, Ilia Mirkin wrote:
>>
>>> On Wed, Jul 31, 2013 at 10:44 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
>>> wrote:
>>>
>>>> On 30/07/2013 18:43, Ilia Mirkin wrote:
>>>>
>>>>> On Tue, Jul 30, 2013 at 6:31 PM, Emil Velikov <
>>>>> emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> wrote:
>>>>>
>>>>>> On 30/07/13 21:39, Christ-Jan Wijtmans wrote:
>>>>>>
>>>>>>> Hi, my apologies if this is the wrong place to post this.
>>>>>>> I had the desire to turn on or off support for certain chipsets.
>>>>>>> Because i felt like the nouveau drivers are (relatively) quite large
>>>>>>> and
>>>>>>> depends on some kernel code that would only be used for certain
>>>>>>> chipsets.
>>>>>>> I will take some time this week to see how this is coded and if its
>>>>>>> possible but i just wanted a head sup opinion on you guys before i
>>>>>>> start
>>>>>>> wasting my time.
>>>>>>>
>>>>>>>  I'm not entirely sure if you're talking about the kernel module, ddx
>>>>>> (xf86-video-nouveau) or mesa.
>>>>>>
>>>>>> In either case, all three should be relatively easy to do, as normally
>>>>>> the generation specific code is divided. Not too sure if it's worth
>>>>>> the
>>>>>> effort though
>>>>>>
>>>>>> * kernel module - 1.7 MiB, ~400KiB gzip
>>>>>> * ddx - ~200KiB
>>>>>> * mesa - 6.3 MiB (nouveau/gallium only)
>>>>>>
>>>>>> As you can see the sizes are not that big, and I'm not sure if the
>>>>>> maintainers would be up-to the idea
>>>>>>
>>>>>> Not a maintainer myself so take the last statement if a healthy pinch
>>>>>> of
>>>>>> salt :)
>>>>>>
>>>>> I'm not a maintainer either, but to provide an opposing opinion, I
>>>>> strongly support the notion of being able to select card generations
>>>>> to build support for. 1.7M of kernel code is huge. I don't even think
>>>>> it'd be that hard (at least for the kernel module and mesa, and I
>>>>> think there's a lot less value in doing it for the DDX). I think it
>>>>> might be as easy as some Makefile changes + a couple of ifdefs in the
>>>>> init code to do Y/N selects. Making it so that the additional
>>>>> functionality can be loaded on demand (i.e. Y/M/N) may be much
>>>>> trickier, to the point of it not being worth it for the additional
>>>>> complexity.
>>>>>
>>>>>     -ilia
>>>>>
>>>>
>>>> In mesa, it is possible to build the driver you want (nouveau_vieux,
>>>> nv30,
>>>> nv50 or nvc0) so the feature is already there.
>>>>
>>> Really? How do you compile only nv50? (Hint: you can't. nv30/nv50/nvc0
>>> are all linked together in the nouveau driver, no way to split them
>>> out, largely because of the nouveau_drm_screen_create function.)
>>>
>> Hmm, as I need to specify which driver I want in configure, I thought
>> they were separated. My bad
>>
>>
>>>  There is no point for the ddx.
>>>>
>>>> As for drm, I sure would use this feature as this would cut down
>>>> compilation
>>>> time a lot when doing out of the tree builds. With the core arch, in
>>>> theory,
>>>> it shouldn't be that hard if you want plan on using old cards only.
>>>> However,
>>>> if you plan on doing the opposite (drop old cards support), it is harder
>>>> as newer cards still use code written for the old ones. If you like,
>>>> you can draw a dependency map quite easily by looking into the device
>>>> directory that will contain all the dependencies for every chipset.
>>>>
>>>> One more thing, maintaining these dependencies will be done poorly and
>>>> eat development time. So I'm not in huge favour of this unless you
>>>> introduce a system that only compiles code for chipsets up to a certain
>>>> point (which is useless IMO).
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>>
>>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>
>

--089e01182da868d86b04ec50a738
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">so uhm, as far as i know in ATI drivers this is possible, =
why no nouveau?</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div=
 dir=3D"ltr"><br>Live long and prosper,<br><br>Christ-Jan Wijtmans<br><a hr=
ef=3D"https://github.com/cjwijtmans" target=3D"_blank">https://github.com/c=
jwijtmans</a><br>
<a href=3D"http://facebook.com/cj.wijtmans" target=3D"_blank">http://facebo=
ok.com/cj.wijtmans</a><br><a href=3D"http://twitter.com/cjwijtmans" target=
=3D"_blank">http://twitter.com/cjwijtmans</a></div></div>
<br><br><div class=3D"gmail_quote">On Thu, Aug 1, 2013 at 2:15 AM, Christ-J=
an Wijtmans <span dir=3D"ltr">&lt;<a href=3D"mailto:cj.wijtmans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
target=3D"_blank">cj.wijtmans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<div dir=3D"ltr">Sorry but 1.7 and 6.3 MB are huge...<div class=3D"gmail_ex=
tra"><br clear=3D"all"><div><div dir=3D"ltr"><div class=3D"im"><br>Live lon=
g and prosper,<br><br>Christ-Jan Wijtmans<br></div><a href=3D"http://facebo=
ok.com/cj.wijtmans" target=3D"_blank">http://facebook.com/cj.wijtmans</a><b=
r>

<a href=3D"http://twitter.com/cjwijtmans" target=3D"_blank">http://twitter.=
com/cjwijtmans</a></div></div><div><div class=3D"h5">
<br><br><div class=3D"gmail_quote">On Wed, Jul 31, 2013 at 5:42 PM, Martin =
Peres <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.peres-GANU6spQydw@public.gmane.org" target=
=3D"_blank">martin.peres-GANU6spQydw@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div><div>On 31/07/2013 11:03, Ilia Mirkin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Jul 31, 2013 at 10:44 AM, Martin Peres &lt;<a href=3D"mailto:martin=
.peres-GANU6spQydw@public.gmane.org" target=3D"_blank">martin.peres-GANU6spQydw@public.gmane.org</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 30/07/2013 18:43, Ilia Mirkin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, Jul 30, 2013 at 6:31 PM, Emil Velikov &lt;<a href=3D"mailto:emil.l.=
velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 30/07/13 21:39, Christ-Jan Wijtmans wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi, my apologies if this is the wrong place to post this.<br>
I had the desire to turn on or off support for certain chipsets.<br>
Because i felt like the nouveau drivers are (relatively) quite large and<br=
>
depends on some kernel code that would only be used for certain<br>
chipsets.<br>
I will take some time this week to see how this is coded and if its<br>
possible but i just wanted a head sup opinion on you guys before i start<br=
>
wasting my time.<br>
<br>
</blockquote>
I&#39;m not entirely sure if you&#39;re talking about the kernel module, dd=
x<br>
(xf86-video-nouveau) or mesa.<br>
<br>
In either case, all three should be relatively easy to do, as normally<br>
the generation specific code is divided. Not too sure if it&#39;s worth the=
<br>
effort though<br>
<br>
* kernel module - 1.7 MiB, ~400KiB gzip<br>
* ddx - ~200KiB<br>
* mesa - 6.3 MiB (nouveau/gallium only)<br>
<br>
As you can see the sizes are not that big, and I&#39;m not sure if the<br>
maintainers would be up-to the idea<br>
<br>
Not a maintainer myself so take the last statement if a healthy pinch of<br=
>
salt :)<br>
</blockquote>
I&#39;m not a maintainer either, but to provide an opposing opinion, I<br>
strongly support the notion of being able to select card generations<br>
to build support for. 1.7M of kernel code is huge. I don&#39;t even think<b=
r>
it&#39;d be that hard (at least for the kernel module and mesa, and I<br>
think there&#39;s a lot less value in doing it for the DDX). I think it<br>
might be as easy as some Makefile changes + a couple of ifdefs in the<br>
init code to do Y/N selects. Making it so that the additional<br>
functionality can be loaded on demand (i.e. Y/M/N) may be much<br>
trickier, to the point of it not being worth it for the additional<br>
complexity.<br>
<br>
=C2=A0 =C2=A0 -ilia<br>
</blockquote>
<br>
In mesa, it is possible to build the driver you want (nouveau_vieux, nv30,<=
br>
nv50 or nvc0) so the feature is already there.<br>
</blockquote>
Really? How do you compile only nv50? (Hint: you can&#39;t. nv30/nv50/nvc0<=
br>
are all linked together in the nouveau driver, no way to split them<br>
out, largely because of the nouveau_drm_screen_create function.)<br>
</blockquote></div></div>
Hmm, as I need to specify which driver I want in configure, I thought<br>
they were separated. My bad<div><div><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
There is no point for the ddx.<br>
<br>
As for drm, I sure would use this feature as this would cut down compilatio=
n<br>
time a lot when doing out of the tree builds. With the core arch, in theory=
,<br>
it shouldn&#39;t be that hard if you want plan on using old cards only. How=
ever,<br>
if you plan on doing the opposite (drop old cards support), it is harder<br=
>
as newer cards still use code written for the old ones. If you like,<br>
you can draw a dependency map quite easily by looking into the device<br>
directory that will contain all the dependencies for every chipset.<br>
<br>
One more thing, maintaining these dependencies will be done poorly and<br>
eat development time. So I&#39;m not in huge favour of this unless you<br>
introduce a system that only compiles code for chipsets up to a certain<br>
point (which is useless IMO).<br>
<br>
<br>
<br>
______________________________<u></u>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/<u></u>mailman/listinfo/nouveau</a><b=
r>
</blockquote></blockquote>
<br>
______________________________<u></u>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/<u></u>mailman/listinfo/nouveau</a><b=
r>
</div></div></blockquote></div><br></div></div></div></div>
</blockquote></div><br></div>

--089e01182da868d86b04ec50a738--

--===============0544907603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0544907603==--
