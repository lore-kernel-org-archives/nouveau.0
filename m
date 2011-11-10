From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Option "Rotate" is not used
Date: Thu, 10 Nov 2011 13:36:43 -0800
Message-ID: <CAN0CFw3SNvUcO_u5pdRWmYCCRHW-ShF=iBbi=XBgbShLg7OknA@mail.gmail.com>
References: <CAN0CFw0f7yVR0hXFiNio4JKgce-GTKd3hU22ve1zNH1hDQsakw@mail.gmail.com>
	<1320792334.2188.1.camel@nisroch>
	<CAN0CFw0GOyh-m83vhaRgGOdBVGy21zbQQJG1+SNfjd6xzOLtYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN0CFw0GOyh-m83vhaRgGOdBVGy21zbQQJG1+SNfjd6xzOLtYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

>>> I just switched from nvidia to nouveau and I get the following in Xorg.=
0.log:
>>>
>>> (WW) NOUVEAU(0): Option "Rotate" is not used
>>>
>>> I have the following in xorg.conf because I've rotated the LCD screen
>>> to change its orientation:
>>>
>>> Option "Rotate" "CCW"
>>>
>>> Can this be done with nouveau? =A0BTW, I can't say for sure that nouveau
>>> isn't rotating the screen image because the workstation is remote.
>> Sure it can, nouveau is a randr 1.2 driver - so adding 'Option "Rotate"
>> "Left"' to the monitor section of your xorg.conf will work instead.
>>
>> Ben.
>
> Thanks Ben, that worked great.
>
> - Grant

I spoke too soon.  I don't get the warning in Xorg.0.log anymore, but
someone tried to use the system and told me the screen was not rotated
as it should be.  I tried both of these in xorg.conf with the same
result:

Section "Monitor"
        Identifier "mymonitor"
        Option "Rotate" "Left"
EndSection

Section "Monitor"
        Identifier "mymonitor"
        Option "Rotate" "CCW"
EndSection

Any ideas?

- Grant
