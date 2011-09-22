From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41114] New: nouveau module crashes on boot
Date: Thu, 22 Sep 2011 05:33:56 -0700 (PDT)
Message-ID: <bug-41114-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41114

           Summary: nouveau module crashes on boot
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tjaalton-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=51516)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=51516)
dmesg log

Upon loading the kernel module it crashes. An extract from the dmesg:

[   39.247309] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0x759C
[   39.358806] [drm] nouveau 0000:01:00.0: unknown i2c port 51
[   39.425347] [drm] nouveau 0000:01:00.0: 0x7568: i2c bus not found
[   39.498115] [drm] nouveau 0000:01:00.0: unknown i2c port 51
[   39.564653] [drm] nouveau 0000:01:00.0: 0x757A: i2c bus not found
[   39.637531] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0x7BF8
[   39.733665] [drm] nouveau 0000:01:00.0: unknown i2c port 51
[   39.800206] [drm] nouveau 0000:01:00.0: 0x8CE4: Failed parsing init table
opcode: INIT_I2C_LONG_IF -19
[   39.911419] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0x8E58
[   40.002897] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0x8E5C
[   40.094423] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0x8F56
[   40.185903] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0x8FBB
[   40.295285] [drm] nouveau 0000:01:00.0: 0x74F7: Condition still not met
after 20ms, skipping following opcodes
[   40.414831] [drm] nouveau 0000:01:00.0: unknown i2c port 51
[   40.481375] BUG: unable to handle kernel NULL pointer dereference at
0000000000000010

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
