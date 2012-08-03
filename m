From: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problem with GT520 and optimus on Fedora 17
Date: Fri, 3 Aug 2012 23:45:27 +0200
Message-ID: <CAG2kNCyo6QhWwp2czDpOhz3-1WGSnwWaLkfTOeA+fm0EqRXYUQ@mail.gmail.com>
References: <CAG2kNCxHWS2vzLweyuZE2yfMOb1g3mAagTXX9qedz70YDRqV8Q@mail.gmail.com>
	<op.wgaw2ewz8t7z9u@arch-laptop>
	<CAG2kNCztP+NCPC=fzNzYm=zTtLD5pw7GoKiTWv3sUQof=DjEog@mail.gmail.com>
	<op.wg69xsvl8t7z9u@arch-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.wg69xsvl8t7z9u@arch-laptop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 10, 2012 at 12:26 AM, Emil Velikov wrote:
> On Mon, 09 Jul 2012 14:39:54 +0100, Gianluca Cecchi wrote:
>
>> On Fri, Jun 22, 2012 at 1:06 PM, Emil Velikov wrote:
>>
>>> Honestly I do no believe you have is not caused by nouveau, moreover it's
>>> an underlying ACPI problem causing nouveau to fail - note the ACPI errors
>>> appear even before we're loading. That taken aside I would recommend if
>>> you can bisect the problem as it would ease and fasten the resolution
>>> Adding [bisected] to the bug [1] and CC the author of the patch would be
>>> encouraged

Hi,
unfortunately I didn't have time to analyze and bisect with Fedora
kernels, but I did try all the new kernel released.
And I can say that finally today the 3.5.0-2.fc17.x86_64 is the first
kernel after
kernel-3.3.7-1.fc17.x86_64 where I can use my Nvidia again and run the command
sudo optirun glxgears
without errors.
Also, the discrete card is correctly disabled after optirun exits.
More tests to come

Thanks (possibly due to upstream changes in 3.5...)

Gianluca
