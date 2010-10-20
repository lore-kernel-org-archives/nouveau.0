From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: PFIFO_CACHE_ERROR
Date: Wed, 20 Oct 2010 10:04:26 +0200
Message-ID: <4CBEA28A.2060400@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi there!

I'm using GeForce FX5200 and today I installed
Mesa-dri-driver-nouveau-7.9-3.i686. Now when I shut down the Xserver I 
get lots of PFIFO_CACHE_ERROR. Is it something serious or a kind of a 
versions problem? I'm using very recent nouveau kernel and
xorg-driver-video-nouveau-0.0.16-0.20100921.1.i686.

This is the dmesg

[  778.944749] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/2 
Mthd 0x0000 Data 0x88000001
[  778.944828] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/2 
Mthd 0x0180 Data 0x88000000
[  778.944877] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/3 
Mthd 0x0000 Data 0x88000002
[  778.944909] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/3 
Mthd 0x0184 Data 0xbeef0201
[  778.944933] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/3 
Mthd 0x0188 Data 0xbeef0201
[  778.944998] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/4 
Mthd 0x0000 Data 0x88000003
[  778.945040] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/4 
Mthd 0x0180 Data 0x88000000
[  778.945092] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/4 
Mthd 0x019c Data 0x88000002
[  778.945114] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/4 
Mthd 0x02fc Data 0x00000003
[  778.945166] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/5 
Mthd 0x0000 Data 0x88000004
[  778.945212] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/5 
Mthd 0x0180 Data 0x88000000
[  778.945263] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/5 
Mthd 0x0198 Data 0x88000002
[  778.945286] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/5 
Mthd 0x02fc Data 0x00000003
[  778.945314] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/5 
Mthd 0x0304 Data 0x00000002
[  778.945360] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/6 
Mthd 0x0000 Data 0x88000005
[  778.945412] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0000 Data 0x88000006
[  778.945458] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0000 Data 0xbeef3097
[  778.945509] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0180 Data 0xbeef0301
[  778.945532] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0184 Data 0xbeef0201
[  778.945560] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0188 Data 0xbeef0202
[  778.945583] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x018c Data 0xbeef0201
[  778.945611] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0194 Data 0xbeef0201
[  778.945634] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0198 Data 0xbeef0201
[  778.945663] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x019c Data 0xbeef0201
[  778.945685] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x01a0 Data 0xbeef0202
[  778.945737] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x01a4 Data 0x00000000
[  778.945782] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x01a8 Data 0xbeef0302
[  778.945811] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x01ac Data 0xbeef0201
[  778.945833] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x01b0 Data 0xbeef0201
[  778.945862] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02c8 Data 0x00000000
[  778.945884] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02cc Data 0x00000000
[  778.945913] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02d0 Data 0x00000000
[  778.945935] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02d4 Data 0x00000000
[  778.945964] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02d8 Data 0x00000000
[  778.945986] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02dc Data 0x00000000
[  778.946015] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02e0 Data 0x00000000
[  778.946037] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02e4 Data 0x00000000
[  778.946067] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02e8 Data 0x00000000
[  778.946089] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02ec Data 0x00000000
[  778.946118] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02f0 Data 0x00000000
[  778.946140] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02f4 Data 0x00000000
[  778.946169] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02f8 Data 0x00000000
[  778.946191] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x02fc Data 0x00000000
[  778.946221] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0220 Data 0x00000001
[  778.946242] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x03b0 Data 0x00100000
[  778.946272] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1454 Data 0x00000000
[  778.946293] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1d80 Data 0x00000003
[  778.946323] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1450 Data 0x00030004
[  778.946345] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1e98 Data 0x00000000
[  778.946374] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x17e0 Data 0x00000000
[  778.946396] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x17e4 Data 0x00000000
[  778.946425] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x17e8 Data 0x3f800000
[  778.946446] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f80 Data 0x00000000
[  778.946476] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f84 Data 0x00000000
[  778.946498] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f88 Data 0x00000000
[  778.946527] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f8c Data 0x00000000
[  778.946549] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f90 Data 0x00000000
[  778.946579] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f94 Data 0x00000000
[  778.946622] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f98 Data 0x00000000
[  778.946646] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1f9c Data 0x00000000
[  778.946672] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fa0 Data 0x0000ffff
[  778.946696] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fa4 Data 0x00000000
[  778.946718] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fa8 Data 0x00000000
[  778.946744] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fac Data 0x00000000
[  778.946769] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fb0 Data 0x00000000
[  778.946799] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fb4 Data 0x00000000
[  778.946820] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fb8 Data 0x00000000
[  778.946848] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1fbc Data 0x00000000
[  778.946872] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0120 Data 0x00000000
[  778.946899] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0124 Data 0x00000001
[  778.946923] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0128 Data 0x00000002
[  778.946950] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1d88 Data 0x00001200
[  778.946974] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x08fc Data 0x00000000
[  778.947001] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0394 Data 0x00000000
[  778.947025] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x0398 Data 0x3f800000
[  778.947052] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1d7c Data 0xffff0000
[  778.947075] [drm] nouveau 0000:01:05.0: PFIFO_CACHE_ERROR - Ch 2/7 
Mthd 0x1e94 Data 0x00000013
