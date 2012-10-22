From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] dri2: Fix potential race and crash
 for swap at next vblank.
Date: Mon, 22 Oct 2012 13:20:29 +0200
Message-ID: <50852BFD.9070304@canonical.com>
References: <1349766419-2647-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1349766419-2647-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ubuntu-x-bounces-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>
In-Reply-To: <1349766419-2647-2-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/ubuntu-x>,
	<mailto:ubuntu-x-request-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/ubuntu-x>
List-Post: <mailto:ubuntu-x-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>
List-Help: <mailto:ubuntu-x-request-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/ubuntu-x>,
	<mailto:ubuntu-x-request-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org?subject=subscribe>
Sender: ubuntu-x-bounces-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
Errors-To: ubuntu-x-bounces-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: ubuntu-x-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: nouveau.vger.kernel.org

Op 09-10-12 09:06, Mario Kleiner schreef:
> This fixes a potential race + crash that wasn't properly
> handled by commit 248de8cdbd6d0bc062633b49896fa4791148cd3b
> and happened at least on one users machine.
>
> That commit wrongly assumed no special action would be needed
> for swaps at next vblank while triple-buffering is enabled on
> XOrg server 1.12 or later.
>
> Closer inspection of the x-server main dispatch loop shows
> it is possible that the client manages to get the server
> to dispatch a new DRI2GetBuffersWithFormat() call before
> the server calls the vblank event handler and executes
> the nouveau_dri2_finish_swap() routine. Such a race would
> cause a crash, as described in above commit.
>
> This commit handles the "swap at next vblank" case by
> calling nouveau_dri2_finish_swap() immediately without
> the roundtrip (queue vblank_event -> kernel -> deliver event
> -> x-server processes event -> nouveau vblank event handler),
> before control gets returned to the client.
>
> This avoids the race while retaining triple-buffering. As
> a bonus, time-critical swaps at next vblank get processed
> without roundtrip delay, increasing the chance of not
> skipping a frame due to vblank miss while sync to vblank is
> on.
>
> Thanks to Anssi for reporting this problem on the nouveau
> mailing list at 12th July 2012 and for testing this patch.
>
> Reported-by: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
> Tested-by: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
> Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
>
It seems darktama didn't respond so I pushed this fix myself.

~Maarten
