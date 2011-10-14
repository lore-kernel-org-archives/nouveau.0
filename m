From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40866] Caught signal 11 (Segmentation fault). Server
	aborting
Date: Fri, 14 Oct 2011 13:03:25 -0700 (PDT)
Message-ID: <20111014200325.58C771300BF@annarchy.freedesktop.org>
References: <bug-40866-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40866-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40866

--- Comment #5 from JohnDoe_71Rus <johndoe99-HPQIj1OAFZMvJsYlp49lxw@public.gmane.org> 2011-10-14 13:03:24 PDT ---
Try 3.0.6-030006-generic #201110050043 SMP Wed Oct 5 02:07:23 UTC 2011 i686 and
drm xf86-video-nouveau from git. The same situation.

http://pastebin.com/VL0PAmsh dmesg
http://pastebin.com/FhP3qty0 xorg.0.log 

gdb /usr/lib/xorg/modules/drivers/nouveau_drv.so
GNU gdb (GDB) 7.1-ubuntu
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/lib/xorg/modules/drivers/nouveau_drv.so...done.
(gdb) l *0xc5c3
0xc5c3 is in NVInitDma (nv_dma.c:56).
51        NVPtr pNv = NVPTR(pScrn);
52        int ret;
53    
54        ret = nouveau_channel_alloc(pNv->dev, NvDmaFB, NvDmaTT, 24*1024,
55                        &pNv->chan);
56        if (ret) {
57            xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
58                   "Error creating GPU channel: %d\n", ret);
59            return FALSE;
60        }
(gdb)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
