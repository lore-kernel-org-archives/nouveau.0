From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Assistance in tracking a kernel/nouveau error
Date: Thu, 10 Apr 2014 23:08:37 -0400
Message-ID: <CAKb7UviftzBgQrkThJwbGMb0KqqN2CpZigBHV_KAFo2uF8ShNw@mail.gmail.com>
References: <5339EB75.1080109@gmail.com> <5341E03C.7020109@gmail.com>
 <CAKb7UvjLr4z50Kvh2FowJ+0_va53r1n+wa5hOC=_LOU_5P7QOg@mail.gmail.com>
 <5345CAE9.1080908@gmail.com> <53471642.8010802@gmail.com>
 <CAKb7UvgG=u9TCCwMC+UJMMmsa3G6qL0KrCzE5n2rxASN14XKfA@mail.gmail.com>
 <53475AAB.9070507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53475AAB.9070507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 10, 2014 at 10:59 PM, ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 04/10/2014 05:14 PM, Ilia Mirkin wrote:
>> You might mention what hardware you have (lspci output for the nvidia
>> card... just need the chip name), and what kernels the various distros
>> are using. (I think that Ubuntu/Fedora tend not to make frankenkernels
>> like RHEL does, so the version has some sort of correlation to actual
>> upstream versions.) That might help identify potential issues that
>> were fixed.
>
> Greetings,
> Here is the lspci info. I will try and grab the kernel versions from the
> discs tomorrow (I left them at work).
> Thanks!
> ~Stack~
>
>> 01:00.0 VGA compatible controller: NVIDIA Corporation GF108GLM [Quadro
>> 1000M] (rev a1) (prog-if 00 [VGA controller])


GF108 (NVC1) had some issues for a kernel release or two (3.11 and
3.12 iirc). The fix was backported to the -stable kernels, but who
knows whether the livecd you're trying has the relevant fixes or not
:(

  -ilia
