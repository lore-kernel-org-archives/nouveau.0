From: Paolo Milani <paolomilani-ur4TIblo6goN+BqQ9rBEUg@public.gmane.org>
Subject: Re: GeForce FX 5200: no kms
Date: Sun, 14 Nov 2010 10:18:10 +0000 (GMT)
Message-ID: <599238.49669.qm@web28305.mail.ukl.yahoo.com>
References: <20101114001107.GA2771@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101114001107.GA2771-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--- Dom 14/11/10, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> It should work. Please post your kernel logs from a failed
> boot (they are somewhere in /var/log).

when boot fails (and system crashes), it write nothing in /var/log: there are only logs of the previous successful boot (with nomodeset option).

my procedure:
1- boot without nomodeset: system crashes.
2- boot with another linux distribution, then I mount partition of point 1, but in /mnt/var/log there are no logs of failed boot. It wrote nothing.

So, I don't know how get logs from a failed boot. If there is a guide, I'm eager to read it. Many thanks.
