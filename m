From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nvfx: restore BEGIN_RING usage
Date: Mon, 20 Dec 2010 22:58:10 +0100
Message-ID: <AANLkTik97Sy93pMQN4c6LZtHQ-pJ16r13zw9jrYH0Sg=@mail.gmail.com>
References: <1292845814-23623-1-git-send-email-chantry.xavier@gmail.com>
	<AANLkTimdVTJ6PLxOFqGM1qF-2x454EY1if93TumSu9Cv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimdVTJ6PLxOFqGM1qF-2x454EY1if93TumSu9Cv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 20, 2010 at 10:46 PM, Michel Hermier
<michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Just for my personnal information, how did you benchmarked ? By juging the fps ?
>

These 3 games have built-in benchmark/demo system so I just used it.

20 dec : no patch
840 frames 6.6 seconds 126.4 fps 3.0/7.9/60.0/2.7 ms
931 frames 15.2444695 seconds 61.0713283 fps, one-second fps
min/avg/max: 34 71 135 (44 seconds)
9.655401 / 29.729643 / 113.846779 fps -- Score = 29.773331
rand[1490382222]

20 dec : begin ring patch
840 frames 6.7 seconds 126.2 fps 4.0/7.9/59.0/2.7 ms
931 frames 15.4498180 seconds 60.2596096 fps, one-second fps
min/avg/max: 33 70 133 (44 seconds)
9.668166 / 29.757431 / 117.643478 fps -- Score = 29.799963
rand[1490382222]

I usually see a variation of 0.5 - 1 fps between consecutive runs.

I don't know if nvfx is more performant on nv40 / pci express, so
anyone with the hardware is also welcome to test.

> If you have the binaries could you also comparbinary size (for
> reference/culture)
>

I cannot see a difference, but I don't usually look at binary size so
feel free to check.
