From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: launching Firefox causes system crash
Date: Mon, 13 Jan 2014 09:51:32 -0800
Message-ID: <CAN0CFw33un9r52v5iNNDMDOSL5RFYL4vNn+kBshaBt5ytOhuLA@mail.gmail.com>
References: <CAN0CFw2E4Om9r7FB+BFSTHHnxVsaMob-Zyq+qLNJuHZtq=OVkQ@mail.gmail.com>
	<CAKb7UvhazyL4-u3th96k4zjpNa46Qr7JQWoEafkoz8J5DuWn+w@mail.gmail.com>
	<CAN0CFw22=Qvrx_TCFbGZx_yMHeZ2-gEE4OMBMwnPF2cZjnnvvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN0CFw22=Qvrx_TCFbGZx_yMHeZ2-gEE4OMBMwnPF2cZjnnvvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

>>> Launching firefox is causing a system crash with a black or white
>>> screen and diagonal lines across it.  I've tried the latest nouveau
>>> from git and the latest kernel.  I can't find anything in the logs
>>> unfortunately.  Any ideas?
>>>
>>> 00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce
>>> 6150SE nForce 430] (rev a2) (prog-if 00 [VGA controller])
>>>     Subsystem: Micro-Star International Co., Ltd. Device 7309
>>>     Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 40
>>>     Memory at de000000 (32-bit, non-prefetchable) [size=16M]
>>>     Memory at c0000000 (64-bit, prefetchable) [size=256M]
>>>     Memory at dd000000 (64-bit, non-prefetchable) [size=16M]
>>>     Expansion ROM at dfd40000 [disabled] [size=128K]
>>>     Capabilities: [48] Power Management version 2
>>>     Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>     Kernel driver in use: nouveau
>>
>> Someone just opened a bug about NV4E. You have NV4C, but one could
>> imagine that there would be similarities. See
>> https://bugs.freedesktop.org/show_bug.cgi?id=73445 and feel free to
>> add yourself to it if that matches your symptoms (esp if it's a 3.13
>> regression). Otherwise, more information would be nice. See
>> http://nouveau.freedesktop.org/wiki/Bugs/ for the sort of information
>> that's generally useful.
>
> I should also mention that rebooting allows firefox to open.  It seems
> to crash if it is opened after the system has been running for awhile.
>
> I tried nouveau.config=NvMSI=0 but it didn't help.
>
> - Grant

Can anyone help me out here?  This has been really disruptive to my
organization.  Unchecking "Use hardware acceleration when available"
in firefox also doesn't seem to fix it.  Anything else I could try?

- Grant
