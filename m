From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing text and icons with NV25
Date: Sun, 3 Jan 2010 16:34:57 +0100
Message-ID: <91752841001030734l5ae68781qf4ca5281bc38d3a1@mail.gmail.com>
References: <1262204506.8519.0@ffortso4> <1262275256.24950.0@ffortso4>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262275256.24950.0@ffortso4>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 31, 2009 at 5:00 PM, Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> wrote:
> On 2009.12.30 15:21, Jack wrote:
>>
>> On 2009.12.24 04:12, Xavier wrote:
>>>
>>> On Thu, Dec 24, 2009 at 12:29 AM, Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> wrote:
>
> .....
>>
>> It looks like some updates just hit arch, so I now have xf86-video-nouve=
au
>> 0.0.10_git20091221-1 and nouveau-drm 0.0.15_20091220-1 with kernel26
>> 2.6.32.2-2 and xorg-server 1.7.3.902-1. =A0Missing icons and fonts, and =
some
>> apparent screen corruption as I'm exiting X.
>>
>> I still have to enable getting newer packages from testing, but these
>> still give the same problem. =A0I suppose I could also set up to compile=
 from
>> git, if necessary to test bleeding edge or specific patches.
>>
>>>> X starts (with no apparent errors) but it's essentially unusable, since
>>>> it's missing all the icons on all the panels and toolbars, and no text=
 shows
>>>> up at all. =A0For example, I can start an xterm, since I know where th=
e icon
>>>> is on the panel, and I can type commands, which by the cursor movement=
 seem
>>>> to be working correctly, but there is no visible text in the term. =A0=
Popups
>>>> (such as right-clicking on the main window) have some clutter/video no=
ise -
>>>> but no text or icons. =A0I see no obvious error messages in the log or=
 dmesg.
>>
>> >> ....
>
> I've attached dmesg and Xorg.log. =A0However, I just noticed these two li=
nes
> in dmesg:
> =A0 X:1411 conflicting memory types d8000000-d8010000
> uncached-minus<->write-combining
> =A0 reserve_memtype failed 0xd8000000-0xd8010000, track uncached-minus, r=
eq
> uncached-minus
> and I see this error was mentioned in posts here on 11 and 13 December. =
=A0I
> don't know if it's relevant, but I point it out to save time, just in cas=
e.
>
> xorg.conf is just
> =A0Section "Device"
> =A0 =A0 =A0 =A0Identifier =A0"nvidia"
> =A0 =A0 =A0 =A0Driver =A0 =A0 =A0"nouveau"
> =A0EndSection
>
> I'll be glad to file as a new bug, but I want to be sure first that I'm n=
ot
> simply missing something obvious.
>

There are many people who know much more than me here, but I do not
see anything suspicious in your logs, and I don't think I heard of
similar issues before.
It might be better to report a new bug, it probably has less chances
to be forgotten than just a mail.
