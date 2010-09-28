From: =?ISO-8859-1?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Tue, 28 Sep 2010 18:17:25 +0200
Message-ID: <4CA21515.4030903@pfu.pl>
References: <4C9E0167.8000507@pfu.pl>	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>	<4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100928170227.00665f76-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I'm completely lost at the moment so let me start from the beginning.
First thing is that everything works fine with Nvidia binary drivers,
which means that hardware is rather OK. After loading of the nouveau.ko
the monitor connected to DVI-I-1 goes to the standby mode. I do not know
if the head is turned of or maybe some kind of rates are too high/low. I
was trying to play with video=DVI-I-1: with different modes and switches
(M/R/D/e) and nothing. At the some time (after loading nouveau.ko) the
monitor connected with the DVI-I-2 starts to blink. And again I was
playing with the video=DVI-I-2:??? and nothing. I thought that maybe
after starting the xorg I will get the proper image at both monitor.
Unfortunately - no success. According to the Xorg log file (Option
"ModeDebug" "true") all the refresh rates are ok. Moreover I was trying
to use different ModeLines and nothing. The X server claims that there
are two monitor connected and working but the first one is in standby
mode and the second is blinking.
Any ideas??
If you need some more information please let me know.
Regards
PS. My mainboard is equiped with the ADM768 chipset and I'm using now
the patch from Francisco Jerez to make the amd_k7_agp to work. Otherwise
I'm forced to switch the nouveau AGP support to off.
