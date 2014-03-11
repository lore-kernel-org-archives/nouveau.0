From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: nouveau_device_wrap
Date: Tue, 11 Mar 2014 11:00:08 -0400
Message-ID: <CAKb7UvhgP6emATM9Uoa2b4QWsFSgbUodLRKu8u3D87cqGeJ+DA@mail.gmail.com>
References: <CANbfre7fA3WtwujWTXuq27UoqfbAC9zQBQfMcc93uGnSc6mQ6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANbfre7fA3WtwujWTXuq27UoqfbAC9zQBQfMcc93uGnSc6mQ6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Melo Jorge da Cunha <dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 11, 2014 at 10:46 AM, Daniel Melo Jorge da Cunha
<dmjcunha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Sorry for the lame question, but is nouveau_device_wrap (...) implemented
> outside Mesa source code? (like libdrm, I don't know...)
>
> Because I searched the whole Mesa-10.0.3 source and found no
> implementation for this function.

Well, assuming that mesa compiles, it would stand to reason that the
implementation is elsewhere.

drm $ git grep nouveau_device_wrap
nouveau/nouveau.c:/* this is the old libdrm's version of
nouveau_device_wrap(), the symbol
nouveau/nouveau.c:nouveau_device_wrap(int fd, int close, struct
nouveau_device **pdev)
nouveau/nouveau.c:              ret = nouveau_device_wrap(fd, 1, pdev);
nouveau/nouveau.h:int  nouveau_device_wrap(int fd, int close, struct
nouveau_device **);

And so it is... http://cgit.freedesktop.org/mesa/drm/tree/nouveau/nouveau.c#n73

Cheers,

  -ilia
