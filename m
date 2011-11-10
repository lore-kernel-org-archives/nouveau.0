From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Option "Rotate" is not used
Date: Thu, 10 Nov 2011 14:27:27 -0800
Message-ID: <CAN0CFw27xAYb4BVPuhkinKrPjb6zPPUbA2-AdqcN-n+-1gWL=Q@mail.gmail.com>
References: <CAN0CFw0f7yVR0hXFiNio4JKgce-GTKd3hU22ve1zNH1hDQsakw@mail.gmail.com>
	<1320792334.2188.1.camel@nisroch>
	<CAN0CFw0GOyh-m83vhaRgGOdBVGy21zbQQJG1+SNfjd6xzOLtYA@mail.gmail.com>
	<CAN0CFw3SNvUcO_u5pdRWmYCCRHW-ShF=iBbi=XBgbShLg7OknA@mail.gmail.com>
	<CAGZ4FET_4XAFp6uNow+_WvVO0KogyEeNYbv-gHMnaHiUVgXUmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FET_4XAFp6uNow+_WvVO0KogyEeNYbv-gHMnaHiUVgXUmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

>>>>> I just switched from nvidia to nouveau and I get the following in Xor=
g.0.log:
>>>>>
>>>>> (WW) NOUVEAU(0): Option "Rotate" is not used
>>>>>
>>>>> I have the following in xorg.conf because I've rotated the LCD screen
>>>>> to change its orientation:
>>>>>
>>>>> Option "Rotate" "CCW"
>>>>>
>>>>> Can this be done with nouveau? =A0BTW, I can't say for sure that nouv=
eau
>>>>> isn't rotating the screen image because the workstation is remote.
>>>> Sure it can, nouveau is a randr 1.2 driver - so adding 'Option "Rotate"
>>>> "Left"' to the monitor section of your xorg.conf will work instead.
>>>>
>>>> Ben.
>>>
>>> Thanks Ben, that worked great.
>>>
>>> - Grant
>>
>> I spoke too soon. =A0I don't get the warning in Xorg.0.log anymore, but
>> someone tried to use the system and told me the screen was not rotated
>> as it should be. =A0I tried both of these in xorg.conf with the same
>> result:
>>
>> Section "Monitor"
>> =A0 =A0 =A0 =A0Identifier "mymonitor"
>> =A0 =A0 =A0 =A0Option "Rotate" "Left"
>> EndSection
>>
>> Section "Monitor"
>> =A0 =A0 =A0 =A0Identifier "mymonitor"
>> =A0 =A0 =A0 =A0Option "Rotate" "CCW"
>> EndSection
>>
>> Any ideas?
>>
>> - Grant
>
> You might need to add something like:
>
> Option "DVI-I-1" "mymonitor"
>
> To your device section, ofcource choose the right connector/output.
> Grep the xorg log for output and you should be able to find it.

I added it like this:

Section "Device"
        Identifier "mydevice"
        Driver "nouveau"
        Option "VGA-1" "mymonitor"
EndSection

But I get this from Xorg.0.log:

Option "VGA-1" is not used

I also tried VGA-I-1 to match your example with the same result.  I
have this in Xorg.0.log so I think VGA-1 is correct:

(II) NOUVEAU(0): Output VGA-1 has no monitor section
...
(II) NOUVEAU(0): Output VGA-1 connected

Is my syntax off somehow?

- Grant
