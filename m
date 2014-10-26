From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: linux kernel 3.17, freeze on resume
Date: Sat, 25 Oct 2014 21:24:03 -0400
Message-ID: <CAKb7UvhprANm0zP5X1o6nZL=rt1m2iubx0HRq_9_dhc-91sh9A@mail.gmail.com>
References: <1414247146.47116.YahooMailNeo@web162805.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1414247146.47116.YahooMailNeo-g4EYUPmW088Me+d1jY/0H5EhsgyP+Z75VpNB7YpNyf8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: John Mountcastle <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Can you grab a copy of dmesg after resume? Can you try waiting ~2
minutes to see if gdm will restart on its own (due to X dying)? In
general, nouveau is less-than-great at resuming while 3d applications
are running. This used to be rare, but now people have things like
gnome-shell/etc which complicate matters.

On Sat, Oct 25, 2014 at 10:25 AM, John Mountcastle <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> This may not be the proper place to raise this question but I've had little
> luck elsewhere.
> After trying again, unsuccessfully this time, to install the proprietary
> NVIDIA driver, I've decided to focus my efforts on the open source Nouveau
> driver. I've seen video drivers blamed for varying degrees of "freeze on
> resume" but I'm not certain that's what I'm up against. When I resume after
> hibernate, Plymouth fails then I get a completely inert machine. Lights are
> on but keyboard nor mouse will elicit any response. If I go to another
> machine and ssh to a shell and do, #systemctl restart gdm, a clean Xdisplay
> pops up showing the log in screen. Now all is well. I'm running Gnome 3 on
> kernel 3.17.1-302.fc21.x86_64 on an HP Elitebook 8440p with NVIDIA GT218N
> [NVS 3100M] GPU, 8 GIG RAM and SSD. Can you help me help you to help me?
> Do you suppose this is an as yet unreported driver bug or something else. It
> may be interesting to note that about one time in five to seven, the machine
> hangs on a reboot before getting anything at all onto the screen.
> __________________
> Never believe the set of that which you understand rivals the universe of
> that which may go wrong -- mtcstle
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
