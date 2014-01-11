From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Kernel release or nouveau versions
Date: Fri, 10 Jan 2014 22:49:08 -0500
Message-ID: <CAKb7Uvi0Pk4FUg4cAXYxYYBOFV7kjckGF4Wc1mdUO7fLFGEj3w@mail.gmail.com>
References: <CALZVapmg_NOZuSavZxTwU0XHeCRa2sbDaQrnDg6r0yVhECxgSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CALZVapmg_NOZuSavZxTwU0XHeCRa2sbDaQrnDg6r0yVhECxgSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Javier Domingo Cansino <javierdo1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 10, 2014 at 2:32 PM, Javier Domingo Cansino
<javierdo1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi!
>
> I have just installed Debian in a GTX 650 computer, and found it's not
> working. The problem is that I have no idea which is the minimum kernel
> version required to complete the task.
>
> Wouldn't it be possible that in the listed devices page, also appear the
> nouveau/linux release where that device was added support?
>
> Can someone tell me about minimal nouveau version?

This would be possible if bugs didn't exist. Many times bugs affect
some cards but not others (and things like "GTX 650" is not what's
buggy, it's like "VBIOS containing X" or other hard-to-quantify things
that are specific to a particular vendor's implementation of the
card). Or a bug will affect e.g. hdmi audio or another feature on a
range of cards. So a particular version may work for some people but
not others. Nouveau is very much an active project and things are
constantly changing, so if something doesn't work, just grab the
latest kernel and try again. If it still doesn't work, file a bug.

  -ilia
