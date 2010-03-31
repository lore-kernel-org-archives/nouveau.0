From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27398] displayport: x server does not draw anything
 on ThinkPad T410
Date: Wed, 31 Mar 2010 09:25:14 -0700 (PDT)
Message-ID: <20100331162514.ED16C130011@annarchy.freedesktop.org>
References: <bug-27398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=27398





--- Comment #2 from Pavel S. <pav_s-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org>  2010-03-31 09:25:14 PST ---
Created an attachment (id=34584)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=34584)
dmesg wthen booted without external display on DP-1 

--- 2   2010-03-31 18:22:07.363618422 +0200
+++ 1   2010-03-31 18:22:13.202493358 +0200
@@ -64,16 +64,55 @@
 [drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
 [drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
 [drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
-[drm] nouveau 0000:01:00.0: allocated 1440x900 fb: 0x40250000, bo
ffff880133654600
+[drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x40250000, bo
ffff880134734600

1440x900 is the resolution of the internal LVDS-1 display while 1680x1050 of
the external display

+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
 [drm] nouveau 0000:01:00.0: 0xCC16: parsing output script 1
 [drm] nouveau 0000:01:00.0: 0xCAAD: parsing clock script 0
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
 fb0: nouveaufb frame buffer device
 [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
-[drm] nouveau 0000:01:00.0: 0xCAAD: parsing clock script 0
-[drm] nouveau 0000:01:00.0: 0xCAAD: parsing clock script 0
-[drm] nouveau 0000:01:00.0: 0xCAAD: parsing clock script 0
+[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
 [drm] nouveau 0000:01:00.0: 0xCC0D: parsing clock script 1
+[drm] nouveau 0000:01:00.0: 0xD441: parsing output script 1
+[drm] nouveau 0000:01:00.0: 0xD16B: parsing clock script 0
 [drm] nouveau 0000:01:00.0: Allocating FIFO number 2
 [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 2
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: expected bit 24 == 0, got 0x81109000
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
+[drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
+[drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121
 [drm] nouveau 0000:01:00.0: Allocating FIFO number 3
 [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 3
+[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
+[drm] nouveau 0000:01:00.0: SOR-1: link training failed
+[drm] nouveau 0000:01:00.0: INIT_AUXCH: rd auxch fail -121


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
