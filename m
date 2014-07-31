From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Are the instructions on freedesktop.org still OK?
Date: Wed, 30 Jul 2014 22:48:54 -0400
Message-ID: <CAKb7Uvhnu8z=KCcVeUEWC-qtf0DvC_ET0gNEk43xaZhnJM=32Q@mail.gmail.com>
References: <CAEk2St=FD4ms_n-WYDQV+75Fv08Az3ooGDgM6-FMhWpUqyOKqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEk2St=FD4ms_n-WYDQV+75Fv08Az3ooGDgM6-FMhWpUqyOKqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

You probably want the drm-nouveau-next branch. Unfortunately master
does not appear to get updated anymore.

You can also attempt to build the very latest and greatest, which is
at http://cgit.freedesktop.org/~darktama/nouveau, although it will
only build against the latest kernels (usually).

On Wed, Jul 30, 2014 at 9:57 PM, Patrick Baggett
<baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I've been following the nouveau git, but it seems now that when I follow the
> instructions on it [1], I end up with a kernel v3.12 rather than 3.16rc7
> (though that is a branch in my repo). I guess I don't yet grok how git works
> with remote masters. I want to update to the latest Linus git kernel +
> latest nouveau. Is it really just `git remote update` followed by `git reset
> --hard nouveau/master` as the page shows?
>
> [1] http://nouveau.freedesktop.org/wiki/InstallDRM/
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
