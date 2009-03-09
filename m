From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20568] New: [9600M GT] modprobe nouveau modeset=1
	freeze pc
Date: Mon,  9 Mar 2009 12:26:29 -0700 (PDT)
Message-ID: <bug-20568-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=20568

           Summary: [9600M GT] modprobe nouveau modeset=1 freeze pc
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


mm_enabled=1 working fine. after this output over ssh notebook freeze
kernel 2.6.29-rc7
Notebook: MSI GX620X-061CZ

Mar  9 20:21:16 notebook nouveau 0000:08:00.0: PCI INT A -> GSI 16 (level, low)
-> IRQ 16                                                          
Mar  9 20:21:16 notebook nouveau 0000:08:00.0: setting latency timer to 64      
Mar  9 20:21:16 notebook [drm] Detected an NV50 generation card (0x096480a1)    
Mar  9 20:21:16 notebook mtrr: type mismatch for d0000000,10000000 old:
write-back new: write-combining                                            
Mar  9 20:21:16 notebook [drm] Allocating FIFO number 1                         
Mar  9 20:21:16 notebook [drm] nouveau_fifo_alloc: initialised FIFO 1           
Mar  9 20:21:17 notebook [drm] BIT BIOS found                                   
Mar  9 20:21:17 notebook [drm] Display Configuration Block version 4.0 found    
Mar  9 20:21:17 notebook [drm] DCB header length 27, with 16 possible entries   
Mar  9 20:21:17 notebook [drm] Raw DCB entry 0: 01000323 00010030               
Mar  9 20:21:17 notebook [drm] Found 1 entries in DCB                           
Mar  9 20:21:17 notebook [drm] Detected a LVDS output                           
Mar  9 20:21:17 notebook [drm] Detected a LVDS connector                        
Mar  9 20:21:17 notebook [drm] Creating i2c bus with index 3                    
Mar  9 20:21:18 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010081                                                         
Mar  9 20:21:18 notebook allocated 1680x1050 fb: 0x45210000, bo
ffff88013e228600                                                                
Mar  9 20:21:36 notebook Console: switching to colour frame buffer device
210x65                                                                   
Mar  9 20:21:36 notebook [drm] Found PLL limits table version 0x21              
Mar  9 20:21:36 notebook [drm] Loading PLL limits for reg 0x00614100            
Mar  9 20:21:36 notebook [drm] pll.vco1.minfreq: 250000                         
Mar  9 20:21:36 notebook [drm] pll.vco1.maxfreq: 500000                         
Mar  9 20:21:36 notebook [drm] pll.vco2.minfreq: 500000                         
Mar  9 20:21:36 notebook [drm] pll.vco2.maxfreq: 1000000                        
Mar  9 20:21:36 notebook [drm] pll.vco1.min_inputfreq: 4000                     
Mar  9 20:21:36 notebook [drm] pll.vco1.max_inputfreq: 27000                    
Mar  9 20:21:36 notebook [drm] pll.vco2.min_inputfreq: 14000                    
Mar  9 20:21:36 notebook [drm] pll.vco2.max_inputfreq: 75000                    
Mar  9 20:21:36 notebook [drm] pll.vco1.min_n: 20
Mar  9 20:21:36 notebook [drm] pll.vco1.max_n: 255
Mar  9 20:21:36 notebook [drm] pll.vco1.min_m: 1
Mar  9 20:21:36 notebook [drm] pll.vco1.max_m: 2
Mar  9 20:21:36 notebook [drm] pll.vco2.min_n: 14
Mar  9 20:21:36 notebook [drm] pll.vco2.max_n: 255
Mar  9 20:21:36 notebook [drm] pll.vco2.min_m: 1
Mar  9 20:21:36 notebook [drm] pll.vco2.max_m: 25
Mar  9 20:21:36 notebook [drm] pll.unk1c: 0
Mar  9 20:21:36 notebook [drm] pll.max_log2p_bias: 6
Mar  9 20:21:36 notebook [drm] pll.log2p_bias: 0
Mar  9 20:21:36 notebook [drm] pll.refclk: 27000
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010081
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x800108a5
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x800108d9
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x800108dd
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010861
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010865
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010869
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x8001086d
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010871
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x800108a9
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x800108c1
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010841
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010845
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010081
Mar  9 20:21:36 notebook [drm] LVDS-7: set mode 1680x1050 b
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010601
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010081
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c81
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c41
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c5d
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c75
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c9d
Mar  9 20:21:36 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010081
Mar  9 20:21:36 notebook fb0: nouveaudrmfb frame buffer device
Mar  9 20:21:36 notebook registered panic notifier
Mar  9 20:21:37 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c81
Mar  9 20:21:37 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c41
Mar  9 20:21:38 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c5d
Mar  9 20:21:39 notebook [drm:nv50_display_command] *ERROR* timeout: 0x610300 =
0x80010c75


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
