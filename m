From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau xorg.conf documentation
Date: Fri, 6 Feb 2009 06:29:36 +1000
Message-ID: <5584F87C-FEB8-448F-AC59-660FCADBBB60@gmail.com>
References: <4989A970.2010503@seiner.com>
	<6d4bc9fc0902040716x3a956eacwf59330f4b4bd03d4@mail.gmail.com>
	<21d7e9970902050426y1f32b4bdi311dc0fc2dad730e@mail.gmail.com>
	<6d4bc9fc0902050638x5b4e606fx76d6d5107cfddfe0@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 5G77)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0902050638x5b4e606fx76d6d5107cfddfe0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org



On 06/02/2009, at 0:38, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Thu, Feb 5, 2009 at 1:26 PM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thu, Feb 5, 2009 at 1:16 AM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 
>> > wrote:
>>> On Wed, Feb 4, 2009 at 3:42 PM, Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
>>>> I'm trying to get started with nouveau.  I have it compiled, I  
>>>> have it
>>>> installed, but I'm having trouble working out the xorg.conf file.
>>>>
>>>> My system has 3 video cards; one is a single DVI out, two are  
>>>> dual DVI
>>>> out. From the messages in the xorg log files, nouveau expects  
>>>> config for
>>>> DVI-I-0 and DVI-I-1, and so on.  Going from the nvidia blob is  
>>>> not as
>>>> easy as changing nvidia to nouveau; all of the options are  
>>>> different and
>>>> the structure of the file is different.
>>>>
>>>> Can someone who has a working nouveau xorg.conf with multiple  
>>>> cards and
>>>> dual DVI cards please put this on on the wiki?  The wiki is  
>>>> really short
>>>> of info for casual user/developers like me.  My time and  
>>>> knowledge are
>>>> limited so any help I get is greatly appreciated.
>>>>
>>>> Thanks,
>>>>
>>>> --Yan
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>>
>>>
>>> All randr-1.2+ drivers are incapable of doing the xinerama style
>>> multihead, until someone writes the needed xorg code.
>>
>> Thats not true, radeon runs fine in Xinerama with other radeons, X
>> when pciaccess happened
>> lost the ability to int10 post secondary cards, however if you have a
>> driver that can post without int10
>> it should be okay.
>>
>> you can disable randr have have working Xinerama Intel are just  
>> being lazy.
>>
>> I'm not sure nouveau cares enough to bother implementing zaphod, but
>> single head might be possible.
>>
>> Dave.
>>
>>>
>>> If you want a protocol screen per card, then that should be  
>>> possible,
>>> minus possible nouveau bugs. Few people actually have a multi card
>>> setup, so a standard config isn't really available.
>>>
>>> You can try using this howto
>>> "http://wiki.debian.org/XStrikeForce/HowToRandR12" and expand it to
>>> two (protocol) screens in your xorg.conf
>>>
>>> Maarten.
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>>
>
> I did say randr-1.2 drivers, which implies using randr-1.2, zaphod is
> something else altogether, which nouveau doesn't support

Wierd because radeon in zaphod supports randr 1.2 protocol on both  
protocol screens it only exposes a single crtc and output but all the  
modeset bits are fine. It's only when you introduce xinerama that  
randr needs to turn off and that has 0 to do with randr 1.2 it's  
always been true.

Dave.

>
>
> Maarten.
