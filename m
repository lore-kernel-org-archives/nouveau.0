From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 35514] Black screen with nouveau on a GeForce
 8600M GT, either LiveCD or fresh install
Date: Mon, 21 Mar 2011 20:06:33 -0000
Message-ID: <op.vspl47xf7cbmmg@emo>
References: <bug-35514-8800@http.bugs.freedesktop.org/>
	<20110321182844.11F1913000C@annarchy.freedesktop.org>
	<op.vsplm4db7cbmmg@emo>
	<AANLkTinMnzvz8UTparZOeXKQ=4mnC5JShKJJtBUV=vs7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinMnzvz8UTparZOeXKQ=4mnC5JShKJJtBUV=vs7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathieu Marquer <mathieu.marquer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 21 Mar 2011 20:02:01 -0000, Mathieu Marquer <mathieu.marquer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, Mar 21, 2011 at 20:55, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:
>
>> There are a couple of things that should be taken into account
>>
>> 1. In the dmesg log provided nouveau is not loaded (remove nomodeset from
>> the kernel command line)
>>
> I'm not using nomodeset. Here is attached one when I'm using nomodeset (and
> where the system finally choose to use vesa), but the Xorg.log attached to
> the bug report is without nomodeset or any other specific kernel parameter.

Please attach a dmesg log, of a system startup *without* using nomodeset.
to obtain it, you can login into the system using ssh, or ask Ubuntu where
it keeps the old dmesg logs

>
> 2. Please (re)move the nouveau_dri.so file, as 3D is not supported.
>>
> I'll give a try
>
>
>>
>> Most likely the issue is unrelated to point 2, but without a comprehensive
>> log (see point 1), nothing decisive can be said.
>> As a possible "fix" take a look at Forcing Modes [1], and select a
>> lower resolution. (the list can be seen in your Xorg log)
>>
>> [1] http://nouveau.freedesktop.org/wiki/KernelModeSetting
>>
