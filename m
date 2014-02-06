From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74613] New: [v3.14-rc1] [nv34] nouveau: get
 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
Date: Thu, 06 Feb 2014 12:45:25 +0000
Message-ID: <bug-74613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0771930360=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0771930360==
Content-Type: multipart/alternative; boundary="1391690725.15AE01.3287"; charset="us-ascii"


--1391690725.15AE01.3287
Date: Thu, 6 Feb 2014 12:45:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74613

          Priority: medium
            Bug ID: 74613
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [v3.14-rc1] [nv34] nouveau: get 0x10000000 put
                    0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push
                    0x00000000
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 93524
  --> https://bugs.freedesktop.org/attachment.cgi?id=93524&action=edit
Full dmesg of crash

Tried to boot a v3.14-rc1 kernel. Previous kernel was v3.13-rc8. I'm attaching
the full dmesg, the only relevant lines were this:

[    2.357486] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 0 [DRM] get
0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
[    2.357764] Console: switching to colour frame buffer device 160x64
[    2.606574] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 0 [DRM] get
0x10000000 put 0x000091cc state 0xc0000000 (err: MEM_FAULT) push 0x00000000
[   17.350008] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]
[   17.350011] nouveau E[     DRM] GPU lockup - switching to software fbcon

It booted (nice). But the KMS was initially corrupted in the top section. The
penguin was there, but stuff next to it was pinkish garbled.

Once it switched from /dev/console to /dev/tty1 (I think that is what happens)
the corruption is gone.

X starts, but not without problems. I saw rectangular parts of Opera alternate
between correct display and black triangles.

Weird thing is, no more new errors popped up. Following list shows the
suspects:

git log --topo-order --oneline v3.13-rc8^...HEAD --no-merges --
drivers/gpu/drm/nouveau Makefile

38dbfb5 Linus 3.14-rc1
f3980dc drm/nouveau: resume display if any later suspend bits fail
09c3de1 drm/nouveau: fix lock unbalance in nouveau_crtc_page_flip
d83ef85 drm/nouveau: implement hooks for needed for drm vblank timestamping
support
d2fa7d3 drm/nouveau/disp: add a method to fetch info needed by drm vblank
timestamping
eb2e968 drm/nv50: fill in crtc mode struct members from crtc_mode_fixup
1139ffb drm/nouveau: call drm_vblank_cleanup() earlier
2332b31 drm/nouveau: create base display from common code
ea7dce9 drm/nv50/gr: print mpc trap name when it's not an mp trap
f750ecc drm/nv50/gr: update list of mp errors, make it a bitfield
e2dd003 drm/nv50/gr: add more trap names to print on error
f87cd8b drm/nouveau/devinit: lock/unlock crtc regs for all devices, not just
pre-nv50
d5c1e84 drm/nouveau: hold mutex while syncing to kernel channel
4019aaa drm/nv50-/devinit: prevent use of engines marked as disabled by
hw/vbios
f0d13e3 drm/nouveau/device: provide a way for devinit to mark engines as
disabled
cf33601 drm/nouveau/devinit: tidy up the subdev class definition
5222555 drm/nouveau/bar: tidy up the subdev and object class definitions
ab60619 drm/nouveau/instmem: tidy up the object class definition
24a4ae8 drm/nouveau/instmem: tidy up the subdev class definition
64c672a drm/nouveau/pwr: implement a simple i2c stack
2e9dfe2 drm/nouveau/pwr: have rd/wr32 routines clobber data instead of addr
7321623 drm/nve0/fb: turn off some bits in 10f584 at init
cb54dd2 drm/nve0/fb/gddr5: merge a fix from ddr3 for one of the timing settings
b13d0e4 drm/nve0/fb/gddr5: yet another random 10f200 bit
c814a60 drm/nvc0-/fb: hook up skeleton interrupt handler
7f39e59 drm/nve0/fb/gddr5: more 10f200 stuff
12642e3 drm/nve0/clk: report ddr memory frequency
1a894c0 drm/nouveau/fb/gddr5: make sure we update mr7 when we're supposed to
a8ccbb7 drm/nve0/fb/gddr5: 10f698/69c
cfe1760 drm/nve0/fb: it's now safe to obey the memory voltage setting properly
46bf1c3 drm/nve0/fb: multi-stage reclock is required for certain transitions
1789cab drm/nouveau/clk: allow fb to signal it needs to do a multi-stage
reclock
b655f2b drm/nve0/fb/gddr5: parse bios data into struct rather than using
directly
ea8b4a3 drm/nve0/fb/gddr5: found LP3 setting
971372e drm/nve0/fb: note the memory voltage toggle, not using it yet
db6735c drm/nve0/fb/gddr5: somewhat better attempt at 100770/10f604/610/614
f4aa2c6 drm/nve0/fb/gddr5: fixup delays a bit
1522eca drm/nouveau/bios: timing 2.0 entries can have subentries
09692e5 drm/nve0/fb/gddr5: note another semi-unknown
1e1d6b4 drm/nouveau/fb/gddr5: modify mr8 with high bits of CL/WR
e7084c6 drm/nve0/fb/gddr5: fix calculation of RDQS setting
334565a drm/nve0/fb/gddr5: switch off some other random bit at some point
0189169 drm/nve0/fb/gddr5: punt all 10f910/914 accesses through ram_train
d394fb1 drm/nve0/fb/gddr5: not all memory partitions are created equal
dd95c8f drm/nve0/fb: typo in register name
0a0dc8f drm/nouveau/bios: make common code to handle ramcfg strap etc
5905439 drm/nve0/fb/gddr5: fix an assumption of sane memory controller layout
2daaf5b drm/nve0/fb/gddr5: fix behaviour of lp3 setting
cb1567c drm/nve0/fifo: recover from mmu faults on bar1/bar3
649ec92 drm/nve0/fifo: keep mmu fault interrupts enabled at all times
e1b6b14 drm/nve0/fifo: update human-readable mmu fault descriptions
e9fb980 drm/nve0/fifo: document more intr status bits
9f8459c drm/nve0/fifo: populate PBDMA status bitfield with more definitions
39b0554 drm/nve0/fifo: s/subfifo/PBDMA/
f82c44a drm/nve0/fifo: s/playlist/runlist/
f76dd80 drm/nvf0/gr: enable acceleration with our chsw ucode
aa97cd3 drm/nv108/gr: enable acceleration with our chsw ucode
5d91e19 drm/nvc0-/gr: handle fwmthd interrupts in ucode
e1b22bc drm/nvc0-/gr: fiddle some magic around strand init
96616b4 drm/nv108/gr: initial support (need external fuc)
daa9ab5 drm/nv108/ce: enable copy engines
a763951 drm/nv108/fifo: initial support
a0f95f1 drm/nvf0/gr: remove a copy+pasto in ctx reglist
67af60f drm/nvc0-/gr: bring in some macros to abstract falcon isa differences
90d6db1 drm/nouveau/falcon: use vmalloc to create firwmare copies
d96bf43 drm/nouveau/gem: remove (now) unneeded pre-validate fence sync
cef9e99 drm/nouveau/ttm: explicitly wait for bo idle before memcpy buffer move
35b8141 drm/nouveau/ttm: explicity sync with kernel channel before moving
buffer
3c57d85 drm/nouveau/ttm: tidy up creation of temporary buffer move vmas
ab9b18a drm/nv04/plane: add support for nv04/nv05 video overlay
7ffb078 drm/nv10/plane: add YUYV support
a554090 drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU access
ce8f769 drm/nouveau: fix m2mf copy to tiled gart
2e2cfbe drm/nouveau/vm: reduce number of entry-points to vm_map()
d0ce7b856 drm/nouveau: make vga_switcheroo code depend on VGA_SWITCHEROO
85b2331 drm: Kill DRM_*MEMORYBARRIER
1d6ac18 drm: Kill DRM_COPY_(TO|FROM)_USER
bfd8303 drm: Kill DRM_HZ
b072e53 ACPI / nouveau: replace open-coded _DSM code with helper functions
4988d0a nouveau / ACPI: fix memory leak in ACPI _DSM related code
8b48463 ACPI: Clean up inclusions of ACPI header files
d8ec26d Linux 3.13
72de182 drm/nouveau/mxm: fix null deref on load
fdd239a drm/nouveau: fix null ptr dereferences on some boards
7e22e91 Linux 3.13-rc8

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391690725.15AE01.3287
Date: Thu, 6 Feb 2014 12:45:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [v3.14-rc1] [nv34] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">74613</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[v3.14-rc1] [nv34] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ronald645&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=93524" name="attach_93524" title="Full dmesg of crash">attachment 93524</a> <a href="attachment.cgi?id=93524&amp;action=edit" title="Full dmesg of crash">[details]</a></span>
Full dmesg of crash

Tried to boot a v3.14-rc1 kernel. Previous kernel was v3.13-rc8. I'm attaching
the full dmesg, the only relevant lines were this:

[    2.357486] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 0 [DRM] get
0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
[    2.357764] Console: switching to colour frame buffer device 160x64
[    2.606574] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 0 [DRM] get
0x10000000 put 0x000091cc state 0xc0000000 (err: MEM_FAULT) push 0x00000000
[   17.350008] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]
[   17.350011] nouveau E[     DRM] GPU lockup - switching to software fbcon

It booted (nice). But the KMS was initially corrupted in the top section. The
penguin was there, but stuff next to it was pinkish garbled.

Once it switched from /dev/console to /dev/tty1 (I think that is what happens)
the corruption is gone.

X starts, but not without problems. I saw rectangular parts of Opera alternate
between correct display and black triangles.

Weird thing is, no more new errors popped up. Following list shows the
suspects:

git log --topo-order --oneline v3.13-rc8^...HEAD --no-merges --
drivers/gpu/drm/nouveau Makefile

38dbfb5 Linus 3.14-rc1
f3980dc drm/nouveau: resume display if any later suspend bits fail
09c3de1 drm/nouveau: fix lock unbalance in nouveau_crtc_page_flip
d83ef85 drm/nouveau: implement hooks for needed for drm vblank timestamping
support
d2fa7d3 drm/nouveau/disp: add a method to fetch info needed by drm vblank
timestamping
eb2e968 drm/nv50: fill in crtc mode struct members from crtc_mode_fixup
1139ffb drm/nouveau: call drm_vblank_cleanup() earlier
2332b31 drm/nouveau: create base display from common code
ea7dce9 drm/nv50/gr: print mpc trap name when it's not an mp trap
f750ecc drm/nv50/gr: update list of mp errors, make it a bitfield
e2dd003 drm/nv50/gr: add more trap names to print on error
f87cd8b drm/nouveau/devinit: lock/unlock crtc regs for all devices, not just
pre-nv50
d5c1e84 drm/nouveau: hold mutex while syncing to kernel channel
4019aaa drm/nv50-/devinit: prevent use of engines marked as disabled by
hw/vbios
f0d13e3 drm/nouveau/device: provide a way for devinit to mark engines as
disabled
cf33601 drm/nouveau/devinit: tidy up the subdev class definition
5222555 drm/nouveau/bar: tidy up the subdev and object class definitions
ab60619 drm/nouveau/instmem: tidy up the object class definition
24a4ae8 drm/nouveau/instmem: tidy up the subdev class definition
64c672a drm/nouveau/pwr: implement a simple i2c stack
2e9dfe2 drm/nouveau/pwr: have rd/wr32 routines clobber data instead of addr
7321623 drm/nve0/fb: turn off some bits in 10f584 at init
cb54dd2 drm/nve0/fb/gddr5: merge a fix from ddr3 for one of the timing settings
b13d0e4 drm/nve0/fb/gddr5: yet another random 10f200 bit
c814a60 drm/nvc0-/fb: hook up skeleton interrupt handler
7f39e59 drm/nve0/fb/gddr5: more 10f200 stuff
12642e3 drm/nve0/clk: report ddr memory frequency
1a894c0 drm/nouveau/fb/gddr5: make sure we update mr7 when we're supposed to
a8ccbb7 drm/nve0/fb/gddr5: 10f698/69c
cfe1760 drm/nve0/fb: it's now safe to obey the memory voltage setting properly
46bf1c3 drm/nve0/fb: multi-stage reclock is required for certain transitions
1789cab drm/nouveau/clk: allow fb to signal it needs to do a multi-stage
reclock
b655f2b drm/nve0/fb/gddr5: parse bios data into struct rather than using
directly
ea8b4a3 drm/nve0/fb/gddr5: found LP3 setting
971372e drm/nve0/fb: note the memory voltage toggle, not using it yet
db6735c drm/nve0/fb/gddr5: somewhat better attempt at 100770/10f604/610/614
f4aa2c6 drm/nve0/fb/gddr5: fixup delays a bit
1522eca drm/nouveau/bios: timing 2.0 entries can have subentries
09692e5 drm/nve0/fb/gddr5: note another semi-unknown
1e1d6b4 drm/nouveau/fb/gddr5: modify mr8 with high bits of CL/WR
e7084c6 drm/nve0/fb/gddr5: fix calculation of RDQS setting
334565a drm/nve0/fb/gddr5: switch off some other random bit at some point
0189169 drm/nve0/fb/gddr5: punt all 10f910/914 accesses through ram_train
d394fb1 drm/nve0/fb/gddr5: not all memory partitions are created equal
dd95c8f drm/nve0/fb: typo in register name
0a0dc8f drm/nouveau/bios: make common code to handle ramcfg strap etc
5905439 drm/nve0/fb/gddr5: fix an assumption of sane memory controller layout
2daaf5b drm/nve0/fb/gddr5: fix behaviour of lp3 setting
cb1567c drm/nve0/fifo: recover from mmu faults on bar1/bar3
649ec92 drm/nve0/fifo: keep mmu fault interrupts enabled at all times
e1b6b14 drm/nve0/fifo: update human-readable mmu fault descriptions
e9fb980 drm/nve0/fifo: document more intr status bits
9f8459c drm/nve0/fifo: populate PBDMA status bitfield with more definitions
39b0554 drm/nve0/fifo: s/subfifo/PBDMA/
f82c44a drm/nve0/fifo: s/playlist/runlist/
f76dd80 drm/nvf0/gr: enable acceleration with our chsw ucode
aa97cd3 drm/nv108/gr: enable acceleration with our chsw ucode
5d91e19 drm/nvc0-/gr: handle fwmthd interrupts in ucode
e1b22bc drm/nvc0-/gr: fiddle some magic around strand init
96616b4 drm/nv108/gr: initial support (need external fuc)
daa9ab5 drm/nv108/ce: enable copy engines
a763951 drm/nv108/fifo: initial support
a0f95f1 drm/nvf0/gr: remove a copy+pasto in ctx reglist
67af60f drm/nvc0-/gr: bring in some macros to abstract falcon isa differences
90d6db1 drm/nouveau/falcon: use vmalloc to create firwmare copies
d96bf43 drm/nouveau/gem: remove (now) unneeded pre-validate fence sync
cef9e99 drm/nouveau/ttm: explicitly wait for bo idle before memcpy buffer move
35b8141 drm/nouveau/ttm: explicity sync with kernel channel before moving
buffer
3c57d85 drm/nouveau/ttm: tidy up creation of temporary buffer move vmas
ab9b18a drm/nv04/plane: add support for nv04/nv05 video overlay
7ffb078 drm/nv10/plane: add YUYV support
a554090 drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU access
ce8f769 drm/nouveau: fix m2mf copy to tiled gart
2e2cfbe drm/nouveau/vm: reduce number of entry-points to vm_map()
d0ce7b856 drm/nouveau: make vga_switcheroo code depend on VGA_SWITCHEROO
85b2331 drm: Kill DRM_*MEMORYBARRIER
1d6ac18 drm: Kill DRM_COPY_(TO|FROM)_USER
bfd8303 drm: Kill DRM_HZ
b072e53 ACPI / nouveau: replace open-coded _DSM code with helper functions
4988d0a nouveau / ACPI: fix memory leak in ACPI _DSM related code
8b48463 ACPI: Clean up inclusions of ACPI header files
d8ec26d Linux 3.13
72de182 drm/nouveau/mxm: fix null deref on load
fdd239a drm/nouveau: fix null ptr dereferences on some boards
7e22e91 Linux 3.13-rc8</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391690725.15AE01.3287--

--===============0771930360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0771930360==--
