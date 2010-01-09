From: Luca Barbieri <luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Discussion] User controls for PowerManagement
Date: Sun, 10 Jan 2010 00:21:43 +0100
Message-ID: <ff13bc9a1001091521gc66a76bn74d4b1e910eb230b@mail.gmail.com>
References: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262900664.4b4655b8c25cc-pgG6AW4N3dxm8DR3ycg935PKb1KSXcyV@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

How about taking inspiration from the cpufreq sysfs interface?

There are sysfs objects for drm cards at /sys/class/drm/card<number>.
Mine, for instance, is at /sys/class/drm/card0, which links to
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0.

A simple scaling approach could just look at the time of the last
pushbuffer submission on any non-Xserver channel (adding a flag for
the DDX, or possibly direct rendered desktop applications to specify
on channel creation). If it's more than N milliseconds ago, turn on
power saving, otherwise disable it, possibly with several time
thresholds for several modes. Of course, it shoud not be implemented
literally this way, but rather by using timers appropriately.
