From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: launching Firefox causes system crash
Date: Wed, 15 Jan 2014 16:26:50 -0800
Message-ID: <CAN0CFw254UGHan-CW3m1rpLkKVuLjQeO8CtB1c+yXeUWGURCuQ@mail.gmail.com>
References: <CAN0CFw2E4Om9r7FB+BFSTHHnxVsaMob-Zyq+qLNJuHZtq=OVkQ@mail.gmail.com>
	<CAKb7UvhazyL4-u3th96k4zjpNa46Qr7JQWoEafkoz8J5DuWn+w@mail.gmail.com>
	<CAN0CFw22=Qvrx_TCFbGZx_yMHeZ2-gEE4OMBMwnPF2cZjnnvvg@mail.gmail.com>
	<CAN0CFw33un9r52v5iNNDMDOSL5RFYL4vNn+kBshaBt5ytOhuLA@mail.gmail.com>
	<CAKb7UvjVnZVMKg=RPXdujXkK+WHWs6XLatLW9hqx4riXPZWAew@mail.gmail.com>
	<CAN0CFw09ZBVq7DbFqjFn81JapboCKe-3UuqCNzU3X2eppfehDA@mail.gmail.com>
	<CAN0CFw3WaX2TYdmTuEPW+j74aj9cat3dfc1KuzPkCkFVj7OYeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN0CFw3WaX2TYdmTuEPW+j74aj9cat3dfc1KuzPkCkFVj7OYeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

>>>>>>> Launching firefox is causing a system crash with a black or white
>>>>>>> screen and diagonal lines across it.  I've tried the latest nouveau
>>>>>>> from git and the latest kernel.  I can't find anything in the logs
>>>>>>> unfortunately.  Any ideas?

I can prevent this crash with the following in xorg.conf:

Option "NoAccel" "on"

- Grant


>>>>>>> 00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce
>>>>>>> 6150SE nForce 430] (rev a2) (prog-if 00 [VGA controller])
>>>>>>>     Subsystem: Micro-Star International Co., Ltd. Device 7309
>>>>>>>     Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 40
>>>>>>>     Memory at de000000 (32-bit, non-prefetchable) [size=16M]
>>>>>>>     Memory at c0000000 (64-bit, prefetchable) [size=256M]
>>>>>>>     Memory at dd000000 (64-bit, non-prefetchable) [size=16M]
>>>>>>>     Expansion ROM at dfd40000 [disabled] [size=128K]
>>>>>>>     Capabilities: [48] Power Management version 2
>>>>>>>     Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>>>>>     Kernel driver in use: nouveau
>>>>>>
>>>>>> Someone just opened a bug about NV4E. You have NV4C, but one could
>>>>>> imagine that there would be similarities. See
>>>>>> https://bugs.freedesktop.org/show_bug.cgi?id=73445 and feel free to
>>>>>> add yourself to it if that matches your symptoms (esp if it's a 3.13
>>>>>> regression). Otherwise, more information would be nice. See
>>>>>> http://nouveau.freedesktop.org/wiki/Bugs/ for the sort of information
>>>>>> that's generally useful.
>>>>>
>>>>> I should also mention that rebooting allows firefox to open.  It seems
>>>>> to crash if it is opened after the system has been running for awhile.
>>>>>
>>>>> I tried nouveau.config=NvMSI=0 but it didn't help.
>>>>>
>>>>> - Grant
>>>>
>>>> Can anyone help me out here?  This has been really disruptive to my
>>>> organization.  Unchecking "Use hardware acceleration when available"
>>>> in firefox also doesn't seem to fix it.  Anything else I could try?
>>>
>>> Launch firefox with LIBGL_ALWAYS_SOFTWARE=1 -- that should avoid using
>>> nouveau for any sort of 3d.
>>>
>>> Is this a new thing, or has it always been the case? If it's new, any
>>> idea what changed?
>>
>> Thank you, I will try that ASAP.  I was trying to use the epiphany and
>> midori browsers for a long time but eventually had to give up and
>> switch to firefox and this problem popped up right away.
>>
>> - Grant
>
> Is there anything I could put in xorg.conf for this?  The system
> that's having trouble is being used in a remote office and I'm not
> sure its users are up to the task of LIBGL_ALWAYS_SOFTWARE=1.
>
> - Grant
