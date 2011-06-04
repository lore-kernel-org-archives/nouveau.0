From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Sat,  4 Jun 2011 02:57:44 -0700 (PDT)
Message-ID: <20110604095744.95331130051@annarchy.freedesktop.org>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #68 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> 2011-06-04 02:57:44 PDT ---
I checked kernel from git. Problem is still actual:
Jun  4 13:44:10 power-debian kernel: [   41.258117] [drm] Initialized drm 1.1.0
20060810
Jun  4 13:44:10 power-debian kernel: [   41.905751] au8830 0001:10:15.0:
enabling device (0004 -> 0007)
Jun  4 13:44:10 power-debian kernel: [   41.905862] Vortex: init....
Jun  4 13:44:10 power-debian kernel: [   42.114836] [drm] nouveau 0000:00:10.0:
Detected an NV10 generation card (0x017200a5)
Jun  4 13:44:10 power-debian kernel: [   42.115084] [drm] nouveau 0000:00:10.0:
OF bios successfully copied (2701 bytes)
Jun  4 13:44:10 power-debian kernel: [   42.115210] [drm] nouveau 0000:00:10.0:
Attempting to load BIOS image from PRAMIN
Jun  4 13:44:10 power-debian kernel: [   42.170951] [drm] nouveau 0000:00:10.0:
... BIOS checksum invalid
Jun  4 13:44:10 power-debian kernel: [   42.171027] [drm] nouveau 0000:00:10.0:
Attempting to load BIOS image from PROM
Jun  4 13:44:10 power-debian kernel: [   42.257320] done.
Jun  4 13:44:10 power-debian kernel: [   42.340091] [drm] nouveau 0000:00:10.0:
... BIOS checksum invalid
Jun  4 13:44:10 power-debian kernel: [   42.340148] [drm] nouveau 0000:00:10.0:
Attempting to load BIOS image from PCIROM
Jun  4 13:44:10 power-debian kernel: [   42.340286] [drm] nouveau 0000:00:10.0:
... BIOS signature not found
Jun  4 13:44:10 power-debian kernel: [   42.340309] [drm] nouveau 0000:00:10.0:
Attempting to load BIOS image from ACPI
Jun  4 13:44:10 power-debian kernel: [   42.340337] [drm] nouveau 0000:00:10.0:
... BIOS signature not found
Jun  4 13:44:10 power-debian kernel: [   42.340360] [drm] nouveau 0000:00:10.0:
Using BIOS image from PRAMIN
Jun  4 13:44:10 power-debian kernel: [   42.387733] [drm] nouveau 0000:00:10.0:
BMP BIOS found
Jun  4 13:44:10 power-debian kernel: [   42.387784] [drm] nouveau 0000:00:10.0:
BMP version 5.21
Jun  4 13:44:10 power-debian kernel: [   42.387808] [drm] nouveau 0000:00:10.0:
Bios version 04.17.00.56
Jun  4 13:44:10 power-debian kernel: [   42.387833] [drm] nouveau 0000:00:10.0:
No output data (DCB) found in BIOS
Jun  4 13:44:10 power-debian kernel: [   42.388438] i2c i2c-5:
therm_windtunnel: attach_adapter method is deprecated
Jun  4 13:44:10 power-debian kernel: [   42.388470] i2c i2c-5: Please use
another way to instantiate your i2c_client
Jun  4 13:44:10 power-debian kernel: [   42.392908] [drm] nouveau 0000:00:10.0:
Parsing VBIOS init table 0 at offset 0x0149
Jun  4 13:44:10 power-debian kernel: [   42.393046] [drm] nouveau 0000:00:10.0:
Parsing VBIOS init table 1 at offset 0x045F
Jun  4 13:44:10 power-debian kernel: [   42.408019] [drm] nouveau 0000:00:10.0:
Parsing VBIOS init table 2 at offset 0x0264
Jun  4 13:44:10 power-debian kernel: [   42.428120] [drm] nouveau 0000:00:10.0:
Parsing VBIOS init table 3 at offset 0x09EE
Jun  4 13:44:10 power-debian kernel: [   42.428180] [drm] nouveau 0000:00:10.0:
Parsing VBIOS init table 4 at offset 0x041F
Jun  4 13:44:10 power-debian kernel: [   42.492733] i2c i2c-6:
therm_windtunnel: attach_adapter method is deprecated
Jun  4 13:44:10 power-debian kernel: [   42.492771] i2c i2c-6: Please use
another way to instantiate your i2c_client
Jun  4 13:44:10 power-debian kernel: [   42.732051] [drm] nouveau 0000:00:10.0:
1 available performance level(s)
Jun  4 13:44:10 power-debian kernel: [   42.732107] [drm] nouveau 0000:00:10.0:
0: memory 400MHz
Jun  4 13:44:10 power-debian kernel: [   42.732148] [drm] nouveau 0000:00:10.0:
c: memory 351MHz core 270MHz
Jun  4 13:44:10 power-debian kernel: [   42.732434] [TTM] Zone  kernel:
Available graphics memory: 381492 kiB.
Jun  4 13:44:10 power-debian kernel: [   42.732460] [TTM] Zone highmem:
Available graphics memory: 774708 kiB.
Jun  4 13:44:10 power-debian kernel: [   42.732482] [TTM] Initializing pool
allocator.
Jun  4 13:44:10 power-debian kernel: [   42.732545] [drm] nouveau 0000:00:10.0:
Detected 32MiB VRAM
Jun  4 13:44:10 power-debian kernel: [   42.734905] [drm] nouveau 0000:00:10.0:
64 MiB GART (aperture)
Jun  4 13:44:10 power-debian kernel: [   42.736697] [drm] Supports vblank
timestamp caching Rev 1 (10.10.2010).
Jun  4 13:44:10 power-debian kernel: [   42.736729] [drm] No driver support for
vblank timestamp query.
Jun  4 13:44:10 power-debian kernel: [   42.737146] [drm] nouveau 0000:00:10.0:
Setting dpms mode 3 on vga encoder (output 0)
Jun  4 13:44:10 power-debian kernel: [   42.758052] i2c i2c-7:
therm_windtunnel: attach_adapter method is deprecated
Jun  4 13:44:10 power-debian kernel: [   42.758088] i2c i2c-7: Please use
another way to instantiate your i2c_client
Jun  4 13:44:10 power-debian kernel: [   42.774005] No connectors reported
connected with modes
Jun  4 13:44:10 power-debian kernel: [   42.774037] [drm] Cannot find any crtc
or sizes - going 1024x768
Jun  4 13:44:10 power-debian kernel: [   42.774261] [drm] nouveau 0000:00:10.0:
allocated 1024x768 fb: 0x49000, bo eedf4800
Jun  4 13:44:10 power-debian kernel: [   42.775966] Console: switching to
colour frame buffer device 128x48
Jun  4 13:44:10 power-debian kernel: [   42.777549] fb0: nouveaufb frame buffer
device
Jun  4 13:44:10 power-debian kernel: [   42.777578] drm: registered panic
notifier
Jun  4 13:44:10 power-debian kernel: [   42.777617] [drm] Initialized nouveau
0.0.16 20090420 for 0000:00:10.0 on minor 0

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
