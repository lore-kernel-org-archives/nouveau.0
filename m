From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Text sometimes missing on NV18 based laptop
Date: Wed, 23 Jul 2014 10:41:03 -0400
Message-ID: <CAKb7UvikcZeVUiq13HkzVk9HxtammVd+_EaS=5gSagBt3w-bDg@mail.gmail.com>
References: <CAFvQSYQr3Bk=eFPW5V3NUMptDhU9Q36tvu8_1zXh0oQtibQ83A@mail.gmail.com>
 <CAFvQSYQ4QXW=0NqXj=fWAzTTQtmLoJpA1GmrK3QuKforVRprjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAFvQSYQ4QXW=0NqXj=fWAzTTQtmLoJpA1GmrK3QuKforVRprjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 23, 2014 at 10:32 AM, Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi again,
>
>> On my NV18 based laptop I experience artifacts related to text
>> (however, 2D performance is really great these days):
>> - With grayscale AA text is sometimes missing, often visible on the XFCE desktop
>> - With subpixel (rgb) AA, even non-text related occur (icons are
>> misrendered, ...)
>>
>> I've reported the issues here:
>> https://bugs.freedesktop.org/show_bug.cgi?id=81283
>
> I know NV1x isn't anything spectacular or exciting to work on,

The problem isn't that the hardware is old. The problem is reproducing
the issue. Unfortunately my NV18 died (currently looking to replace
it), but with a very plain WindowMaker + no weird anything setup, my
recollection is that everything worked fine. And I wasn't willing to
take the plunge and install/use gnome... perhaps I should do that next
time with a throw-away account so that I don't mess up my stuff. I
guess XFCE isn't as heavy though.

> however
> on that notebook I don't have any choice.
> Therefore I would be really grateful for advice how to narrow the
> issues reported down.
>
> Even finding a way to selectively turn off the accel-paths which cause
> the issue would be a big win, as with noaccel the system is barely
> useable.

I thought I provided some advice in the bug on how to do just that.

Cheers,

  -ilia
