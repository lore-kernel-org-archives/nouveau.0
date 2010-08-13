From: Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org>
Subject: Nouveau errors in /var/log/messages - what are they and
 what do they mean?
Date: Fri, 13 Aug 2010 20:58:34 +0100
Message-ID: <1281729514.13419.6.camel@lithium>
Reply-To: alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

What does all these errors that the X11 Nouveau driver spews out in
my /var/log/message mean? They don't seem to do any harm but I was
wondering whether it might be having an impact on the driver's
performance? 

Nvidia chipset used: NV34M (GeForce Fx Go5200 w/ 64MB RAM)
xf86-video-nouveau: 0.0.16-pre20100807
nouveau-drm: 20100520 (20100811 only usable with 2.6.35, I'm still on 2.6.34)
Mesa not in use, this happens on starting X11. 

Regards,
Alex

Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO number 3
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 3
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/2 Mthd 0x0000 Data 0x88000001
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/2 Mthd 0x0180 Data 0x88000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/3 Mthd 0x0000 Data 0x88000002
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/3 Mthd 0x0184 Data 0xbeef0201
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/3 Mthd 0x0188 Data 0xbeef0201
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/4 Mthd 0x0000 Data 0x88000003
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/4 Mthd 0x0180 Data 0x88000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/4 Mthd 0x019c Data 0x88000002
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/4 Mthd 0x02fc Data 0x00000003
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/5 Mthd 0x0000 Data 0x88000004
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/5 Mthd 0x0180 Data 0x88000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/5 Mthd 0x0198 Data 0x88000002
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/5 Mthd 0x02fc Data 0x00000003
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/5 Mthd 0x0304 Data 0x00000002
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/7 Mthd 0x0000 Data 0xbeef3097
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/7 Mthd 0x0180 Data 0xbeef0301
Aug 13 13:05:54 lithium kernel: nouveau_ratelimit: 38 callbacks suppressed
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x0184 Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x0188 Data 0x00001f43:0x00001f43
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x018c Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x0194 Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x0198 Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x019c Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x01a0 Data 0x00001f43:0x00001f43
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x01a4 Data 0x000023b5:0x000023b5
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 3/7 Mthd 0x01a8 Data 0xbeef0302
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x01ac Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x01b0 Data 0x00001f42:0x00001f42
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02c8 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02cc Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02d0 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02d4 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02d8 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02dc Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02e0 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02e4 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02e8 Data 0x00000000:0x00000000
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 13 13:05:54 lithium kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class 0x0000 Mthd 0x02ec Data 0x00000000:0x00000000

-- 
http://www.munted.org.uk

One very high maintenance cat living here.
_______________________________________________
mesa-dev mailing list
mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

-- 
http://www.munted.org.uk

One very high maintenance cat living here.
