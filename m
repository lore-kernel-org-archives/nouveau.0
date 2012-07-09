From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problem with GT520 and optimus on Fedora 17
Date: Mon, 09 Jul 2012 23:26:06 +0100
Message-ID: <op.wg69xsvl8t7z9u@arch-laptop>
References: <CAG2kNCxHWS2vzLweyuZE2yfMOb1g3mAagTXX9qedz70YDRqV8Q@mail.gmail.com>
	<op.wgaw2ewz8t7z9u@arch-laptop>
	<CAG2kNCztP+NCPC=fzNzYm=zTtLD5pw7GoKiTWv3sUQof=DjEog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAG2kNCztP+NCPC=fzNzYm=zTtLD5pw7GoKiTWv3sUQof=DjEog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, 09 Jul 2012 14:39:54 +0100, Gianluca Cecchi wrote:

> On Fri, Jun 22, 2012 at 1:06 PM, Emil Velikov wrote:
>
>> Honestly I do no believe you have is not caused by nouveau, moreover  
>> it's
>> an underlying ACPI problem causing nouveau to fail - note the ACPI  
>> errors
>> appear even before we're loading. That taken aside I would recommend if
>> you can bisect the problem as it would ease and fasten the resolution
>> Adding [bisected] to the bug [1] and CC the author of the patch would be
>> encouraged
>
> Sorry for the delay.
> I would like to help, but any link helping me to understand what to do
> to "bisect"...?
> I'm using a fedora kernel. I know that if I boot with
> kernel-3.3.7-1.fc17.x86_64 it works, while any other following kernel
> released not
> (right today I tried with kernel-3.4.4-5.fc17.x86_64).
>
> Thanks,
> Gianluca

  "Code Bisection is a method used in software development to identify  
change
  sets that result in a specific behavior change. It is mostly employed for
  finding the patch that introduced a bug. Another application area is  
finding
  the patch that indirectly fixed a bug." [1]

In other words in order to get it up and working it is encouraged to dig  
deep
into the issue and recompile the kernel a few times. Refer to
"Building a custom kernel" [2] or "koji bisecting kernel builds" [3]
for more information

Regards
Emil


[1] http://en.wikipedia.org/wiki/Code_Bisection
[2] http://fedoraproject.org/wiki/Building_a_custom_kernel
[3] http://jwboyer.livejournal.com/43007.html
