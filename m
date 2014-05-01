From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Meaning of MMIO register 100080 on NV28
Date: Thu, 1 May 2014 18:26:08 -0400
Message-ID: <CAKb7UvgxkvBijj2AsfQyPRTax53YRzXvPqWLL8BR1istdP+nbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

There have been some users reporting odd framebuffer and cursor
corruption on GeForce4 Ti 4200 Go cards (yeah, pretty ancient
hardware). These identify as NV28's.

Here is the full bug, with screenshots, descriptions, etc:
https://bugs.freedesktop.org/show_bug.cgi?id=54700

A user has isolated bit 24 of 100080 needing to be set, at which point
all the problems disappear. We don't know very much about this
register -- we write to it at device init time on NV04/NV05 (Riva
TNT/TNT2), toggling bit 4 on and off ("REFRESH_OFF"), but not on any
chips after that.

My main question is this -- when should we be setting bit 24 of
100080, and on what chips? If it's easy, a brief description of what
it means would be great too. And any other advice you may have on this
issue, as always, would be most welcome.

Thanks,

  -ilia

P.S. Thanks for responding to my other questions as well. Hope I'm not
becoming too much of a nuisance :)
