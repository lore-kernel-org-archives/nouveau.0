From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: X freezes with nouveau/G70
Date: Mon, 23 Nov 2009 18:38:32 +0200
Message-ID: <20091123183832.168414bb@daedalus.pq.iki.fi>
References: <201016.4404.qm@web55603.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201016.4404.qm-ioje91k90z+B9c0Qi4KiSg9VFclH1bkmQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bruce Drake <bmdrake919-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 23 Nov 2009 06:05:34 -0800 (PST)
Bruce Drake <bmdrake919-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:

> Greetings,
> 
> Ever since the nouveau driver arrived in the Fedora distribution,
> I have not been able to use (or boot) my system without booting
> in run level 3 and loading nVidia's proprietary drivers first.
> With the shipped drivers in Fedora 10 and 11, regardless of how I
> start X, I get the animated cursor first, then random data spews
> across the screen and I lose the keyboard (but mouse still
> moves), requiring a hard reset to recover.
> 
> Now, with the release of Fedora 12, the proprietary driver won't
> work now (according to RedHat).  However, the only option that
> leaves me is to boot up with no graphics or just the vesa driver.
> 
> I have a G70 [GeForce 7800 GT] (rev a1) card that works fine
> (actually 2 cards that work fine).  Is there something I can do
> to make this card work, or otherwise assist in making it work?
> Is there something odd about this card that requires special
> handling?  Let me know what I can provide to you to help.

I have not heard of any bad reports on that card, I'd assume it
just works. You do have only one GPU in your system, right?
Not two cards plugged in?

And since you are asking, you probably already went through the
Fedora and fd.o bugzillas and the Nouveau FAQ's Troubleshooting,
finding nothing similar.

The first step forward is to submit a bug report with logs. Boot
clean, load Nouveau DRM module, start X - in separate steps. Take
the full kernel log from boot, as much as you can, and X log if
you get that far.

If you have trouble getting logs, try whatever you can:
- remote access via ssh
- mount log partition with sync
- SysRq keys to sync and remount r/o disks
- netconsole
- firescope
- serial terminal
- NMI watchdog with netconsole/firescope/serial terminal

Hope this helps.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
