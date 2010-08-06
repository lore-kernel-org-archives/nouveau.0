From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Optimus and Nvidia
Date: Thu, 5 Aug 2010 23:46:32 -0400
Message-ID: <AANLkTim-Q09qTB1ijTctsftBb_Ww0FVe2vKMq40pWWre@mail.gmail.com>
References: <AANLkTimkvu_ic_B1KW9mW_6-DE2tiXxv4S+Jwwmkpm4c@mail.gmail.com>
	<AANLkTimB8Abtq4+zLq8Pa6gQbTcn5PQA1w9jOdF6XNjL@mail.gmail.com>
	<AANLkTi=OM2oeiLbWCVYQCjp8-c0ZM83SpFCXMc2n6Z9T@mail.gmail.com>
	<AANLkTimm1Joko5OwhNj=owkmJHgMrrfwGSb7JwR4A277@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimm1Joko5OwhNj=owkmJHgMrrfwGSb7JwR4A277-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jason Long <mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

(Use reply-all if you want people on the list to see your emails, your
last two were only to me.)

Google "nvidia optimus linux" and you'll find some info on the matter.
The Nvidia driver does not support Optimus. As far as I know this
means that it will not work with the 330M in an Optimus chipset
because the 330M is hooked up to the Intel chip, it doesn't matter
that the Nvidia driver supports regular 330Ms, this is not a regular
330M. Nouveau doesn't support it either until someone figures out how
it works.

As far as the Intel chip is concerned I don't know if the Intel driver
will support it and just ignore the Optimus-related stuff. Maybe you
should ask that on the Intel list.

What the sales guy told you about turning it off doesn't matter.

On Thu, Aug 5, 2010 at 11:24 PM, Jason Long
<mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org> wrote:
> The=A0NVIDIA GeForce GT 330M is supported by the=A0propriety=A0driver, bu=
t I do
> not know how is will work with the integrated Intel.
>
> On Thu, Aug 5, 2010 at 10:22 PM, Jason Long <mailing.lists@octgsoftware.c=
om>
> wrote:
>>
>> It is a http://www.pctorque.com/sager-5125-gaming-computers.php
>> with=A0NVIDIA GeForce GT 330M with=A0integrated Intel 4500 GMA.
>> I am not really concerned about if Optimus works. =A0I am mainly concern=
ed
>> about using the latest Fedora release. =A0I do not even care if I have t=
o use
>> either the Intel of Nvidia card. =A0I just want 1080p under Linux.
>> Does anyone know what the options are? =A0The sales guys said there was a
>> switch to turn Optimus off.
>> On Thu, Aug 5, 2010 at 10:08 PM, Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>>
>>> On Thu, Aug 5, 2010 at 4:38 PM, Jason Long
>>> <mailing.lists-Osa7cVegawUi8rCdYzckzA@public.gmane.org> wrote:
>>> > I need to buy a Sager 5125 laptop=A0immediately=A0and I am concerned =
about
>>> > the
>>> > Optimus setup in this model.
>>> > It comes with a Nvidia 330M/Intel Hybrid.
>>> > I want to use this with Fedora 13. =A0I do not care if I can switch. =
=A0I
>>> > just
>>> > want it to work. =A0I can also deal with only the onboard graphics
>>> > working in
>>> > linux.
>>> > Do you think the HDMI output will work or I will need the 330M driver
>>> > for
>>> > that?
>>> > I see nvidia has support for the 330M in their driver? =A0Will this w=
ork?
>>> > _______________________________________________
>>> > Nouveau mailing list
>>> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> > http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>>>
>>> Last I heard I don't think Nvidia will support Optimus on Linux with
>>> their driver. As far as Nouveau and DRM playing nice with Optimus I
>>> think Dave Airlie had some interest in that but no access to hardware?
>>> I don't remember the details myself, maybe someone else can tell you
>>> more.
>>
>
>
