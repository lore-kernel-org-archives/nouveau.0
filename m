From: Brian DeRocher <brian-TeWftVRA/bxg9hUCZPvPmw@public.gmane.org>
Subject: Re: nv50 mouse cursor disappears hourly
Date: Fri, 12 Mar 2010 09:37:53 -0500
Message-ID: <201003120937.53520.brian@derocher.org>
References: <201003111530.01357.brian@derocher.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201003111530.01357.brian-TeWftVRA/bxg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thursday 11 March 2010 15:30:01 Brian DeRocher wrote:
> Next time it happens, i'll check /var/log/

/var/log/syslog

Mar 11 15:26:38 bregalad kernel: [ 4011.159249] [drm] nouveau 0000:01:00.0: Allocating FIFO number 4
Mar 11 15:26:38 bregalad kernel: [ 4011.172345] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 4
Mar 11 15:26:56 bregalad kernel: [ 4029.528631] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 4
Mar 11 15:30:01 bregalad /USR/SBIN/CRON[4460]: (www-data) CMD ([ -x /usr/lib/cgi-bin/awstats.pl -a -f /etc/awstats/awstats.conf -a -r /var/log/apache/access.log ] && /usr/lib/cgi-bin/awstats.pl -config=awstats -update >/dev/null)
Mar 11 15:40:01 bregalad /USR/SBIN/CRON[4703]: (www-data) CMD ([ -x /usr/lib/cgi-bin/awstats.pl -a -f /etc/awstats/awstats.conf -a -r /var/log/apache/access.log ] && /usr/lib/cgi-bin/awstats.pl -config=awstats -update >/dev/null)
Mar 11 15:50:01 bregalad /USR/SBIN/CRON[5128]: (www-data) CMD ([ -x /usr/lib/cgi-bin/awstats.pl -a -f /etc/awstats/awstats.conf -a -r /var/log/apache/access.log ] && /usr/lib/cgi-bin/awstats.pl -config=awstats -update >/dev/null)
Mar 11 15:59:05 bregalad kernel: [ 5958.643154] [drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400 (0x0002 0x01)
Mar 11 16:00:01 bregalad /USR/SBIN/CRON[5371]: (www-data) CMD ([ -x /usr/lib/cgi-bin/awstats.pl -a -f /etc/awstats/awstats.conf -a -r /var/log/apache/access.log ] && /usr/lib/cgi-bin/awstats.pl -config=awstats -update >/dev/null)


/var/log/dmesg

Mar 11 15:59:05 bregalad kernel: [ 5958.643154] [drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400 (0x0002 0x01)
Mar 11 14:20:53 bregalad kernel: [   65.957641] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 3
Mar 11 14:29:08 bregalad kernel: [  561.104849] [drm] LVDS-7: set mode 1920x1200 3e
Mar 11 14:29:23 bregalad kernel: [  576.013970] [drm] LVDS-7: set mode 1920x1200_60.00 3d
Mar 11 14:29:45 bregalad kernel: [  598.589129] CPUFREQ: Per core ondemand sysfs interface is deprecated - up_threshold
Mar 11 14:47:32 bregalad kernel: [ 1665.713034] CE: hpet increasing min_delta_ns to 15000 nsec
Mar 11 14:50:34 bregalad kernel: [ 1847.552047] CE: hpet increasing min_delta_ns to 22500 nsec
Mar 11 15:26:38 bregalad kernel: [ 4011.159249] [drm] nouveau 0000:01:00.0: Allocating FIFO number 4
Mar 11 15:26:38 bregalad kernel: [ 4011.172345] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 4
Mar 11 15:26:56 bregalad kernel: [ 4029.528631] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 4
Mar 11 15:59:05 bregalad kernel: [ 5958.643154] [drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400 (0x0002 0x01)

Brian

--
http://brian.derocher.org
