From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: External monitor is blank with nouveau driver
Date: Tue, 23 Jun 2009 22:17:13 -0400
Message-ID: <586c2acd0906231917v58911ad3j11eeff7a2a08af15@mail.gmail.com>
References: <4A3D0D7A.2040105@irbisnet.com>
	<586c2acd0906210856v4af3e719na6ac9f669c7bc47c@mail.gmail.com>
	<4A418844.20900@irbisnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A418844.20900-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andriy Bakay <andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Jun 23, 2009 at 9:58 PM, Andriy Bakay<andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org> wrote:
> Sorry, I am sending configuration and log files.
>
> Younes Manton wrote:
>>
>> On Sat, Jun 20, 2009 at 12:25 PM, Andriy Bakay<andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org> wrote:
>>>
>>> Hi Nouveau Team,
>>>
>>> I have the following hardware/software spec:
>>>
>>> ThinkPad T61
>>> FreeBSD 7.1-RELEASE-p5 amd64
>>> NVIDIA Quadro NVS 140M
>>> X driver nouveau
>>> External monitor NEC MultiSync 90GX2
>>>
>>> I am connecting external monitor through VGA interface. I was able to
>>> detect it using command 'xrandr -q' and even turn it on:
>>>
>>> $ xrandr --output VGA-0 --auto --below LVDS-0
>>>
>>> the geometry of my desktop changed, but monitor remain blank.
>>>
>>> Please, advise.

1) Is that log from an instance where you tried to enable the 2nd
monitor? I don't see anything in there about attempting to output to
the VGA port.

2) Can you try a minimal xorg.conf file? You don't need a lot of those
options for the display portion. Try something like this and let the
driver do the rest:

Section "Device"
        Identifier      "card0"
        Driver          "nouveau"
EndSection

Section "Screen"
        Identifier      "screen0"
        Device         "card0"
EndSection
