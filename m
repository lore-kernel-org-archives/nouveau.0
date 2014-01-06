From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: yuy2 not working in ubuntu 13.10
Date: Mon, 6 Jan 2014 15:36:15 -0500
Message-ID: <CAKb7UvjYX09yhA4EzZHKAQL76gB8EfMp5JAuZp3yM5b1-Mvfwg@mail.gmail.com>
References: <CAPET_G966gHBSNK1991aiRgHY3+eN-4Gadz=SrdKG=GCq1Kkng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPET_G966gHBSNK1991aiRgHY3+eN-4Gadz=SrdKG=GCq1Kkng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jan 6, 2014 at 7:53 AM, fbs 777 <fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> For many years im using the ubuntu with nouveau and the yuy2 scalemode in
> mame. I think the last one was 11.10 or 12.04, not sure.
> Now in the ubuntu 13.10 the yuy2 scalemode dont work in mame, but works fine
> with the intel driver.
>
> Tested with the kernels 3.11 and 3.12 from the ubuntu repository.
>
> I think there's a regression in the nouveau used in ubuntu 13.10 with yuy2.

Could you be more specific as to the issue you're seeing? "Doesn't
work" is awefully generic. Screenshots may be useful.

What version of xf86-video-nouveau are you using (the nouveau DDX)?
What hardware do you have? (A copy of your Xorg.0.log would answer
both of those questions.)

Can you provide steps to reproduce the issue (for someone unfamiliar
with MAME and/or without access to a ROM collection)?

All of that should probably go into a bug so that it can be tracked
better. Take a look at http://nouveau.freedesktop.org/wiki/Bugs/ for
further instructions.

  -ilia
